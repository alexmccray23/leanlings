import Leanlings.Check

namespace Leanlings

def clearScreen : IO Unit := IO.print "\x1b[2J\x1b[H"

def printList (st : State) (current : Option String) : IO Unit := do
  IO.println (bold "  #  Status   Exercise")
  for (e, i) in exercises.zipIdx 1 do
    let content ← readExercise e
    let status := if isRecordedDone st e content then green "done   " else yellow "pending"
    let num := (toString i).pushn ' ' (3 - (toString i).length)
    let line := s!"  {num}{status}  {e.relPath}"
    IO.println (if current == some e.name then bold line ++ "  ← current" else line)
  IO.println s!"\n{progressBar (← countDone st) exercises.size}"

def printHint (e : Exercise) : IO Unit := do
  IO.println (bold s!"Hint for {e.name}:")
  IO.println e.hint

/-! ## Watch mode -/

/-- A background task reading one line of stdin. -/
abbrev LineTask := Task (Except IO.Error String)

structure WatchCtx where
  state : IO.Ref State
  /-- Pending read of the user's next command, or `none` once stdin is closed. -/
  reader : IO.Ref (Option LineTask)
  current : IO.Ref (Option String)
  showHint : IO.Ref Bool

def spawnReader : IO LineTask := do
  let stdin ← IO.getStdin
  IO.asTask (prio := .dedicated) stdin.getLine

inductive Event where
  | recheck
  | quit

def render (ctx : WatchCtx) (e : Exercise) (ev : Eval) (justFinished : Option String) :
    IO Unit := do
  clearScreen
  IO.println s!"{bold "leanlings"}  {progressBar (← countDone (← ctx.state.get)) exercises.size}"
  if let some prev := justFinished then
    IO.println (green s!"\n✓ Finished {prev}! On to the next one.")
  IO.println s!"\n{bold "Current exercise:"} {e.path}\n"
  let out := ev.result.output.trimAscii.toString
  unless out.isEmpty do IO.println s!"{out}\n"
  IO.println (statusLine ev)
  if ← ctx.showHint.get then
    IO.println ""
    printHint e
  IO.println (dim "\nSaving the file re-checks it. Commands (type, then Enter): \
    h = hint, l = list, r = re-check, q = quit")
  flush

/-- Wait until the exercise file changes or the user enters a command. -/
partial def waitForEvent (ctx : WatchCtx) (e : Exercise) (content : String) : IO Event := do
  IO.sleep 200
  if let some task ← ctx.reader.get then
    if ← IO.hasFinished task then
      match task.get with
      | .error _ | .ok "" =>
        -- stdin was closed; keep watching the file but stop reading commands
        ctx.reader.set none
      | .ok line =>
        ctx.reader.set (some (← spawnReader))
        match line.trimAscii.toString with
        | "q" | "quit" | "exit" => return .quit
        | "h" | "hint" =>
          ctx.showHint.set true
          return .recheck
        | "l" | "list" =>
          IO.println ""
          printList (← ctx.state.get) (some e.name)
          flush
        | "" | "r" | "run" => return .recheck
        | other =>
          IO.println s!"unknown command `{other}`. Try h, l, r, or q."
          flush
  let now ← try IO.FS.readFile e.path catch _ => pure content
  if now != content then return .recheck
  waitForEvent ctx e content

partial def watchLoop (ctx : WatchCtx) : IO Unit := do
  match ← findPending ctx.state with
  | none =>
    clearScreen
    IO.println (green (bold "🎉 You finished every exercise. Congratulations!"))
    IO.println "\nSome places to go next:"
    IO.println "  • Functional Programming in Lean: https://lean-lang.org/functional_programming_in_lean/"
    IO.println "  • Theorem Proving in Lean 4:      https://lean-lang.org/theorem_proving_in_lean4/"
    IO.println "  • Mathematics in Lean (Mathlib):  https://leanprover-community.github.io/mathematics_in_lean/"
  | some (e, ev) =>
    let prev ← ctx.current.get
    let justFinished := if prev.isSome && prev != some e.name then prev else none
    if prev != some e.name then
      ctx.current.set (some e.name)
      ctx.showHint.set false
    render ctx e ev justFinished
    match ← waitForEvent ctx e ev.content with
    | .quit => return
    | .recheck => watchLoop ctx

def watch : IO Unit := do
  let ctx : WatchCtx := {
    state := ← IO.mkRef (← loadState)
    reader := ← IO.mkRef (some (← spawnReader))
    current := ← IO.mkRef none
    showHint := ← IO.mkRef false
  }
  watchLoop ctx

end Leanlings
