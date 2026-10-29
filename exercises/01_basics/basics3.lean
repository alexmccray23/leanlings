/-
  basics3: Numbers

  `Nat` has no negative numbers, so subtraction stops at zero: `3 - 5` is
  `0`. Division rounds down, and `%` gives the remainder.

  When you need negative numbers, use `Int`. Writing `(e : Int)` tells
  Lean which type an expression should have.

  Replace each `sorry` with the value that makes the test pass. Work it out
  first, then check yourself with `#eval` if you like.
-/

-- I AM NOT DONE

#guard 10 - 3 = 7
#guard 3 - 10 = sorry
#guard 17 / 5 = sorry
#guard 17 % 5 = sorry
#guard (3 - 10 : Int) = sorry
