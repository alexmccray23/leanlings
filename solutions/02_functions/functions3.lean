def multiply (x y : Nat) : Nat := x * y

def triple : Nat → Nat := multiply 3

#guard triple 5 = 15

#guard List.map (multiply 10) [1, 2, 3] = [10, 20, 30]
