/-
  basics4: Strings and simple functions

  Strings are joined with `++`. String interpolation builds a string out of
  values: in `s!"x is {x}"`, the value of `x` goes where `{x}` is.

  A function definition lists its parameters before the colon:

    def shout (s : String) : String := s ++ "!"

  To call it, write the arguments after the name: `shout "hi"`.
-/

-- I AM NOT DONE

def fullName (first last : String) : String := sorry

def describe (name : String) (age : Nat) : String := sorry

#guard fullName "Ada" "Lovelace" = "Ada Lovelace"
#guard describe "Ada" 36 = "Ada is 36 years old"
#guard "Lean".length = sorry
