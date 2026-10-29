/-
  collections1: Option

  `Option α` is either `some x` (there's a value) or `none` (there isn't).
  Lean uses it where other languages use null:

    [1, 2, 3].head?   -- some 1
    [].head?          -- none

  Handle both cases with `match`, or use helpers like `o.getD default`.
-/

-- I AM NOT DONE

-- Division that gives `none` instead of dividing by zero.
def safeDiv (x y : Nat) : Option Nat := sorry

-- The first even number in the list, if there is one.
-- Look at `List.find?`.
def firstEven (xs : List Nat) : Option Nat := sorry

def describe (o : Option Nat) : String :=
  match o with
  | some n => s!"got {n}"
  -- Add the missing case. It should give "nothing".

#guard safeDiv 10 2 = some 5
#guard safeDiv 1 0 = none
#guard firstEven [1, 3, 4, 6] = some 4
#guard firstEven [1, 3] = none
#guard describe (safeDiv 9 3) = "got 3"
#guard describe (safeDiv 9 0) = "nothing"
