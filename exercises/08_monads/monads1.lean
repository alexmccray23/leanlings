/-
  monads1: `do` blocks and mutable variables

  Lean is a pure functional language, but `do` notation lets you write
  step-by-step code with local mutable variables and loops. `Id.run do`
  runs such a block inside an ordinary pure function:

    def sumList (xs : List Nat) : Nat := Id.run do
      let mut total := 0
      for x in xs do
        total := total + x
      return total

  A variable declared with plain `let` can't be changed. Use `let mut`.
  `[a:b]` is the range a, a+1, ..., b-1.
-/

-- I AM NOT DONE

def sumTo (n : Nat) : Nat := Id.run do
  let total := 0
  for i in [1:n+1] do
    total := total + i
  return total

-- Count the vowels (a, e, i, o, u) in `s`.
-- `s.toList` gives you the characters as a list, and `"aeiou".contains c`
-- tells you whether `c` is a vowel.
def countVowels (s : String) : Nat := Id.run do
  sorry

#guard sumTo 10 = 55
#guard sumTo 0 = 0
#guard countVowels "functional programming" = 7
#guard countVowels "rhythm" = 0
