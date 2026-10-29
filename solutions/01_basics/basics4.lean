def fullName (first last : String) : String := first ++ " " ++ last

def describe (name : String) (age : Nat) : String := s!"{name} is {age} years old"

#guard fullName "Ada" "Lovelace" = "Ada Lovelace"
#guard describe "Ada" 36 = "Ada is 36 years old"
#guard "Lean".length = 4
