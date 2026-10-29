/-
  functions2: Functions are values

  Functions can be passed to other functions. `Nat → Nat` is the type of
  functions from `Nat` to `Nat`. (`->` works too if `→` is hard to type.)

  `fun x => x + 1` is an anonymous function. For short ones there's an even
  shorter form, `(· + 1)`, where `·` marks the spot the argument goes.
-/

-- I AM NOT DONE

-- Apply `f` to `x`, then apply `f` again to the result.
def applyTwice (f : Nat → Nat) (x : Nat) : Nat := sorry

#guard applyTwice (fun n => n + 3) 10 = 16
#guard applyTwice (· * 3) 2 = 18

-- Pass `applyTwice` a function that turns 25 into 100.
#guard applyTwice sorry 25 = 100
