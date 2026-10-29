/-
  recursion2: Recursion on lists

  A `List α` is either empty, `[]`, or `x :: xs`: an element `x` in front of
  a shorter list `xs`. `[1, 2, 3]` is shorthand for `1 :: 2 :: 3 :: []`.

  Lean's library has all of these functions already. Write your own
  versions to see how they work, without calling the library ones.
-/

-- I AM NOT DONE

def mySum : List Nat → Nat
  | [] => sorry
  | x :: xs => sorry

def myLength {α : Type} : List α → Nat := sorry

def myMap {α β : Type} (f : α → β) : List α → List β := sorry

-- Keep only the elements for which `p` returns true.
def myFilter {α : Type} (p : α → Bool) : List α → List α := sorry

#guard mySum [1, 2, 3, 4] = 10
#guard myLength ["a", "b", "c"] = 3
#guard myMap (· + 1) [1, 2, 3] = [2, 3, 4]
#guard myFilter (· > 2) [1, 5, 2, 7] = [5, 7]
