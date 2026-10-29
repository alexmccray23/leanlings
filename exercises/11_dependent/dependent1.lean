/-
  dependent1: Safe indexing

  `xs[i]` on an array or list needs a proof that `i` is in bounds. Lean
  looks for that proof among the facts it knows. If it can't find one, you
  get a "failed to prove index is valid" error.

  Some ways to deal with that:

    xs[i]?                          gives an Option instead
    xs[i]!                          crashes if out of bounds (best avoided)
    if h : i < xs.size then xs[i] else ...
                                    `h` is the proof, usable in the `then` branch
    a hypothesis argument           make the caller supply the proof
-/

-- I AM NOT DONE

-- The third element, or 0 if there isn't one.
def thirdOrZero (xs : Array Nat) : Nat := xs[2]

-- This one compiles: `h` tells Lean that index 2 is in bounds.
def third (xs : Array Nat) (h : xs.size ≥ 3) : Nat := xs[2]

-- The first element plus the last. The array is guaranteed to be non-empty.
def firstPlusLast (xs : Array Nat) (h : xs.size > 0) : Nat := sorry

#guard thirdOrZero #[10, 20, 30, 40] = 30
#guard thirdOrZero #[10, 20] = 0
#guard third #[1, 2, 3] (by decide) = 3
#guard firstPlusLast #[1, 2, 3, 4] (by decide) = 5
#guard firstPlusLast #[7] (by decide) = 14
