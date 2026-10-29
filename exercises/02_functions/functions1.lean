/-
  functions1: Calling functions

  In Lean you call a function by writing its arguments after it, separated
  by spaces. There are no commas, and no parentheses around the argument
  list:

    add 1 2           -- not add(1, 2)

  Parentheses are only for grouping:

    add 1 (add 2 3)
-/

-- I AM NOT DONE

def add (x y : Nat) : Nat := x + y

def addThree (a b c : Nat) : Nat := add(a, add(b, c))

#guard addThree 1 2 3 = 6
