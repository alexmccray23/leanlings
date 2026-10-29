/-
  monads4: IO

  Code that interacts with the outside world runs in `IO`. A program's
  `main` function has type `IO Unit`. Inside a `do` block:

    let x ← action    runs `action` and names its result `x`
    let x := value    just names a value; nothing runs

  Mixing these up is a common mistake: with `:=`, `x` is the action itself,
  not its result.

  `#eval` can run IO actions, so the `#eval main` at the bottom runs every
  time the file is checked.
-/

-- I AM NOT DONE

-- Chosen by a fair dice roll. Guaranteed to be random.
def rollDie : IO Nat := pure 4

def rollTwice : IO Nat := do
  let a := rollDie
  let b := rollDie
  return a + b

def main : IO Unit := do
  let total ← rollTwice
  IO.println s!"You rolled {total}"
  if total != 8 then
    throw (IO.userError s!"expected 8, got {total}")

#eval main
