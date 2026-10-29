def withdraw (balance amount : Nat) : Except String Nat :=
  if amount > balance then
    throw s!"cannot withdraw {amount}, balance is {balance}"
  else
    pure (balance - amount)

def deposit (balance amount : Nat) : Except String Nat :=
  if amount = 0 then throw "deposit must be positive" else pure (balance + amount)

def transactions (balance d w1 w2 : Nat) : Except String Nat := do
  let b ← deposit balance d
  let b ← withdraw b w1
  withdraw b w2

def render : Except String Nat → String
  | .ok n => s!"ok {n}"
  | .error e => s!"error: {e}"

#guard render (transactions 100 50 30 20) = "ok 100"
#guard render (transactions 100 0 30 20) = "error: deposit must be positive"
#guard render (transactions 10 5 10 10) = "error: cannot withdraw 10, balance is 5"
