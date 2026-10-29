def add (x y : Nat) : Nat := x + y

def addThree (a b c : Nat) : Nat := add a (add b c)

#guard addThree 1 2 3 = 6
