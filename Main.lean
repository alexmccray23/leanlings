import Leanlings

open Leanlings

def usage : String := "leanlings: small exercises for learning Lean 4

Usage: lake exe leanlings [command]

Commands:
  watch          (default) work through the exercises in order, re-checking on save
  list           show every exercise and whether it's done
  hint [NAME]    show the hint for NAME (default: the current exercise)
  run NAME       check a single exercise
  verify         check every exercise in order, stopping at the first unfinished one
  help           show this message

Maintainer commands:
  dev-check      check that every exercise starts out unfinished and every solution passes"

def printEval (path : System.FilePath) (ev : Eval) : IO Unit := do
  IO.println s!"{bold "Checking"} {path}\n"
  let out := ev.result.output.trimAscii.toString
  unless out.isEmpty do IO.println s!"{out}\n"
  IO.println (statusLine ev)

def cmdRun (name : String) : IO UInt32 := do
  let some e := findExercise name
    | IO.eprintln s!"no exercise named `{name}`. Run `lake exe leanlings list` to see them all."
      return 1
  let ev ← evalFile e.path
  printEval e.path ev
  if ev.done then
    let st ← IO.mkRef (← loadState)
    recordDone st e ev.content
    return 0
  return 1

def cmdHint (name? : Option String) : IO UInt32 := do
  let e? ← match name? with
    | some name => pure (findExercise name)
    | none => do pure ((← findPending (← IO.mkRef (← loadState))).map (·.1))
  match e?, name? with
  | some e, _ => printHint e; return 0
  | none, some name => IO.eprintln s!"no exercise named `{name}`"; return 1
  | none, none => IO.println "Every exercise is done, so there's nothing to hint at."; return 0

def cmdVerify : IO UInt32 := do
  let st ← IO.mkRef (← loadState)
  for e in exercises do
    let content ← readExercise e
    if isRecordedDone (← st.get) e content then
      IO.println s!"{green "✓"} {e.relPath}"
      continue
    let ev ← evalFile e.path
    if ev.done then
      recordDone st e ev.content
      IO.println s!"{green "✓"} {e.relPath}"
    else
      IO.println s!"{red "✗"} {e.relPath}\n"
      printEval e.path ev
      IO.println s!"\n{progressBar (← countDone (← st.get)) exercises.size}"
      return 1
  IO.println (green "\nAll exercises are done!")
  return 0

/-- Run `f` on every element, `n` at a time in parallel. -/
def parallelMap {α β : Type} (n : Nat) (xs : Array α) (f : α → IO β) : IO (Array β) := do
  let mut out := #[]
  let mut i := 0
  while i < xs.size do
    let tasks ← (xs.extract i (i + n)).mapM fun x => IO.asTask (f x)
    for t in tasks do
      out := out.push (← IO.ofExcept t.get)
    i := i + n
  return out

/-- Exercises that are allowed to compile cleanly as given (the learner only
has to read them and delete the marker). -/
def compilesAsGiven : List String := ["intro1"]

def cmdDevCheck : IO UInt32 := do
  let mut problems : Array String := #[]
  -- names must be unique
  let names := exercises.map (·.name)
  for (n, i) in names.zipIdx do
    if names[i+1:].toArray.contains n then problems := problems.push s!"duplicate name {n}"
  -- every exercise file on disk must be listed
  let listed := exercises.map (·.path.toString)
  for p in ← System.FilePath.walkDir "exercises" do
    if p.extension == some "lean" && !listed.contains p.toString then
      problems := problems.push s!"{p} is not listed in Leanlings/Info.lean"
  for e in exercises do
    unless ← e.path.pathExists do problems := problems.push s!"missing {e.path}"
    unless ← e.solutionPath.pathExists do problems := problems.push s!"missing {e.solutionPath}"
  if !problems.isEmpty then
    problems.forM (IO.eprintln ∘ red)
    return 1
  IO.println s!"Compiling {exercises.size} exercises and their solutions..."
  let results ← parallelMap 8 exercises fun e => do
    return (e, ← evalFile e.path, ← evalFile e.solutionPath)
  for (e, ex, sol) in results do
    let mut msgs := #[]
    if !ex.marker then msgs := msgs.push "exercise is missing the marker line"
    if ex.result.outcome == .passed && !compilesAsGiven.contains e.name then
      msgs := msgs.push "exercise compiles cleanly as given; it should fail until solved"
    if sol.marker then msgs := msgs.push "solution still has the marker line"
    if sol.result.outcome != .passed then
      msgs := msgs.push s!"solution does not pass:\n{sol.result.output}"
    if msgs.isEmpty then
      IO.println s!"{green "✓"} {e.relPath}"
    else
      IO.println s!"{red "✗"} {e.relPath}"
      for m in msgs do IO.println s!"    {m}"
      problems := problems.push e.name
  if problems.isEmpty then
    IO.println (green "\nAll good.")
    return 0
  IO.println (red s!"\n{problems.size} exercise(s) have problems.")
  return 1

def main (args : List String) : IO UInt32 := do
  unless ← System.FilePath.isDir "exercises" do
    IO.eprintln "leanlings: run this from the leanlings directory (the one that contains `exercises/`)."
    return 1
  match args with
  | [] | ["watch"] =>
    watch
    -- The stdin reader thread may still be blocked; exit without waiting for it.
    IO.Process.exit 0
  | ["list"] => printList (← loadState) none; return 0
  | ["hint"] => cmdHint none
  | ["hint", name] => cmdHint (some name)
  | ["run", name] => cmdRun name
  | ["verify"] => cmdVerify
  | ["dev-check"] => cmdDevCheck
  | ["help"] | ["--help"] | ["-h"] => IO.println usage; return 0
  | _ => IO.eprintln usage; return 1
