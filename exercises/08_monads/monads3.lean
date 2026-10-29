/-
  monads3: Errors with Except

  `Except ε α` is either `.ok value` or `.error e`. It's like Option, except
  that a failure carries an error value saying what went wrong. In a `do`
  block, `throw e` stops with an error, and `←` passes errors along.

  This exercise models a bank account.
-/

-- I AM NOT DONE

def withdraw (balance amount : Nat) : Except String Nat :=
  if amount > balance then
    throw s!"cannot withdraw {amount}, balance is {balance}"
  else
    pure (balance - amount)

def deposit (balance amount : Nat) : Except String Nat :=
  if amount = 0 then throw "deposit must be positive" else pure (balance + amount)

-- Starting from `balance`, deposit `d`, then withdraw `w1`, then withdraw
-- `w2`. Stop at the first error.
def transactions (balance d w1 w2 : Nat) : Except String Nat := sorry

-- `Except` values can't be compared with `=`, so the tests turn them into strings.
def render : Except String Nat → String
  | .ok n => s!"ok {n}"
  | .error e => s!"error: {e}"

#guard render (transactions 100 50 30 20) = "ok 100"
#guard render (transactions 100 0 30 20) = "error: deposit must be positive"
#guard render (transactions 10 5 10 10) = "error: cannot withdraw 10, balance is 5"
