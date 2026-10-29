def safeDiv (x y : Nat) : Option Nat := if y == 0 then none else some (x / y)

def firstEven (xs : List Nat) : Option Nat := xs.find? (· % 2 == 0)

def describe (o : Option Nat) : String :=
  match o with
  | some n => s!"got {n}"
  | none => "nothing"

#guard safeDiv 10 2 = some 5
#guard safeDiv 1 0 = none
#guard firstEven [1, 3, 4, 6] = some 4
#guard firstEven [1, 3] = none
#guard describe (safeDiv 9 3) = "got 3"
#guard describe (safeDiv 9 0) = "nothing"
