import Leanlings.Exercise
import Leanlings.Info

namespace Leanlings

/-! ## Terminal styling -/

def style (code s : String) : String := "\x1b[" ++ code ++ "m" ++ s ++ "\x1b[0m"
def red (s : String) : String := style "31" s
def green (s : String) : String := style "32" s
def yellow (s : String) : String := style "33" s
def bold (s : String) : String := style "1" s
def dim (s : String) : String := style "2" s

def flush : IO Unit := do (← IO.getStdout).flush

/-! ## Checking one file -/

/-- The line a learner deletes to say "I'm finished with this exercise". -/
def markerLine : String := "-- I AM NOT DONE"

def hasMarker (content : String) : Bool :=
  (content.splitOn "\n").any (·.trimAscii.toString == markerLine)

inductive Outcome where
  /-- Lean reported an error (this includes failing `#guard` tests). -/
  | failed
  /-- No errors, but something still uses `sorry`. -/
  | hasSorry
  | passed
  deriving BEq

structure CheckResult where
  output : String
  outcome : Outcome

def mentionsSorry (out : String) : Bool :=
  out.contains "declaration uses `sorry`" || out.contains "declaration uses 'sorry'"

/-- Compile a file with `lean` and classify the result. -/
def compileFile (path : System.FilePath) : IO CheckResult := do
  let out ← try
      IO.Process.output { cmd := "lean", args := #[path.toString] }
    catch err =>
      return { output := s!"could not run `lean`: {err}\nIs elan installed and on your PATH?",
               outcome := .failed }
  let text := out.stdout ++ out.stderr
  -- `#guard`/`#eval` on code that uses `sorry` is an error, but the cause is the
  -- `sorry`, so report it that way.
  let errors := (text.splitOn "\n").filter (·.contains ": error")
  let onlySorryErrors := errors.all fun e =>
    e.contains "uses 'sorry'" || e.contains "depends on the 'sorry' axiom"
  let outcome :=
    if out.exitCode != 0 && !(onlySorryErrors && mentionsSorry text) then .failed
    else if mentionsSorry text then .hasSorry
    else .passed
  return { output := text, outcome }

/-- An exercise file's contents together with its compile result. -/
structure Eval where
  content : String
  marker : Bool
  result : CheckResult

def Eval.done (ev : Eval) : Bool := ev.result.outcome == .passed && !ev.marker

def evalFile (path : System.FilePath) : IO Eval := do
  let content ← IO.FS.readFile path
  return { content, marker := hasMarker content, result := ← compileFile path }

def statusLine (ev : Eval) : String :=
  match ev.result.outcome with
  | .failed => red "✗ Lean reports errors (or a failing #guard test). Fix them and save."
  | .hasSorry => yellow "✗ There's still a `sorry` in the file. Replace each one with real code or a proof."
  | .passed =>
    if ev.marker then
      green "✓ Everything compiles! " ++
        s!"Delete the `{markerLine}` line when you're ready to move on."
    else green "✓ Done!"

/-! ## Progress

Finished exercises are remembered in `.leanlings-state` together with a hash
of the file, so we don't recompile them every time. Editing a finished file
makes it count as unchecked again. -/

def stateFile : System.FilePath := ".leanlings-state"

abbrev State := List (String × UInt64)

def loadState : IO State := do
  unless ← stateFile.pathExists do return []
  let text ← IO.FS.readFile stateFile
  return (text.splitOn "\n").filterMap fun line =>
    match line.trimAscii.toString.splitOn " " with
    | [name, h] => h.toNat?.map (name, ·.toUInt64)
    | _ => none

def saveState (st : State) : IO Unit :=
  IO.FS.writeFile stateFile (String.join (st.map fun (n, h) => s!"{n} {h}\n"))

def isRecordedDone (st : State) (e : Exercise) (content : String) : Bool :=
  !hasMarker content && st.lookup e.name == some (hash content)

def recordDone (stRef : IO.Ref State) (e : Exercise) (content : String) : IO Unit := do
  let st := (← stRef.get).filter (·.1 != e.name) ++ [(e.name, hash content)]
  stRef.set st
  saveState st

def readExercise (e : Exercise) : IO String := do
  try IO.FS.readFile e.path
  catch _ => throw <| IO.userError s!"missing exercise file {e.path}"

/-- Number of exercises whose current contents are recorded as finished. -/
def countDone (st : State) : IO Nat := do
  let mut n := 0
  for e in exercises do
    if isRecordedDone st e (← readExercise e) then n := n + 1
  return n

/-- The first exercise that isn't finished, along with its compile result.
Unchecked files without the marker get compiled along the way. -/
def findPending (stRef : IO.Ref State) : IO (Option (Exercise × Eval)) := do
  for e in exercises do
    let content ← readExercise e
    if isRecordedDone (← stRef.get) e content then continue
    let ev ← evalFile e.path
    if ev.done then
      recordDone stRef e ev.content
    else
      return some (e, ev)
  return none

def findExercise (name : String) : Option Exercise :=
  exercises.find? (·.name == name)

def progressBar (done total : Nat) : String :=
  let width := 40
  let filled := if total == 0 then width else done * width / total
  "[" ++ green ("".pushn '#' filled) ++ dim ("".pushn '-' (width - filled)) ++ "]" ++
    s!" {done}/{total}"

end Leanlings
