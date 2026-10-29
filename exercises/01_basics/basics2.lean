/-
  basics2: Types

  Every value in Lean has a type, and Lean checks that values match the
  types you give them. Some common types:

    Nat     natural numbers: 0, 1, 2, ...
    Int     integers: ..., -1, 0, 1, ...
    String  text: "hello"
    Bool    true or false
    Char    a single character: 'a'

  Each value below doesn't match its type. Change the values (not the
  types) so the tests pass.
-/

-- I AM NOT DONE

def age : Nat := "30"

def isLearning : Bool := "yes"

def initial : Char := "L"

#guard age = 30
#guard isLearning = true
#guard initial = 'L'
