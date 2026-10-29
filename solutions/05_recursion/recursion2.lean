def mySum : List Nat → Nat
  | [] => 0
  | x :: xs => x + mySum xs

def myLength {α : Type} : List α → Nat
  | [] => 0
  | _ :: xs => 1 + myLength xs

def myMap {α β : Type} (f : α → β) : List α → List β
  | [] => []
  | x :: xs => f x :: myMap f xs

def myFilter {α : Type} (p : α → Bool) : List α → List α
  | [] => []
  | x :: xs => if p x then x :: myFilter p xs else myFilter p xs

#guard mySum [1, 2, 3, 4] = 10
#guard myLength ["a", "b", "c"] = 3
#guard myMap (· + 1) [1, 2, 3] = [2, 3, 4]
#guard myFilter (· > 2) [1, 5, 2, 7] = [5, 7]
