/-
  basics5: Booleans and `if`

  `if c then a else b` picks one of two values. Both branches are required
  and must have the same type.

  Lean has two kinds of equality:
    `a == b`  is a `Bool`, computed by a function
    `a = b`   is a proposition, a statement you could prove
  For simple types like `Nat`, `if` accepts either one.

  Comparisons: `<`, `<=` (or `≤`), `>`, `>=` (or `≥`), `!=`.
  Logic on Bools: `&&`, `||`, `!`.
-/

-- I AM NOT DONE

def isEven (n : Nat) : Bool := sorry

-- "zero" for 0, "small" for 1 through 9, and "big" for 10 and up.
def classify (n : Nat) : String := sorry

#guard isEven 10
#guard !isEven 7
#guard classify 0 = "zero"
#guard classify 5 = "small"
#guard classify 10 = "big"
