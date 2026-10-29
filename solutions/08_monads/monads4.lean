def rollDie : IO Nat := pure 4

def rollTwice : IO Nat := do
  let a ← rollDie
  let b ← rollDie
  return a + b

def main : IO Unit := do
  let total ← rollTwice
  IO.println s!"You rolled {total}"
  if total != 8 then
    throw (IO.userError s!"expected 8, got {total}")

#eval main
