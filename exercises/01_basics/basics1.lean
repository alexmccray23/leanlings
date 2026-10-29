/-
  basics1: Definitions

  `def name : Type := value` gives a name to a value. The part after the
  colon is the type.

  `sorry` is a placeholder that can stand in for anything. Lean accepts
  it with a warning, but an exercise isn't done until every `sorry` is gone.

  `#guard` checks that a condition is true when the file is compiled. If
  it's false, the file fails to compile. Exercises use `#guard` as tests.
-/

-- I AM NOT DONE

def answer : Nat := sorry

def language : String := sorry

#guard answer = 42
#guard language = "Lean"
