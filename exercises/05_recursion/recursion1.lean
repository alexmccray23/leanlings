/-
  recursion1: Recursion on numbers

  Every `Nat` is either `0` or `n + 1` for some smaller `n`. Matching on
  those two patterns gives you a base case and a recursive case:

    def countdown : Nat → List Nat
      | 0 => [0]
      | n + 1 => (n + 1) :: countdown n

  Lean checks that recursive calls are on smaller values, so the function
  always finishes.
-/

-- I AM NOT DONE

def factorial : Nat → Nat
  | 0 => sorry
  | n + 1 => sorry

-- fib 0 = 0, fib 1 = 1, and each later number is the sum of the two before it.
def fib : Nat → Nat
  | 0 => 0
  | 1 => 1
  | n + 2 => sorry

#guard factorial 0 = 1
#guard factorial 5 = 120
#guard (List.range 10).map fib = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]
