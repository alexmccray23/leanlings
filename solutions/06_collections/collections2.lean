def squares (xs : List Nat) : List Nat := xs.map (fun x => x * x)

def evens (xs : List Nat) : List Nat := xs.filter (· % 2 == 0)

def product (xs : List Nat) : Nat := xs.foldl (· * ·) 1

def sumOfEvenSquares (xs : List Nat) : Nat :=
  xs.filter (· % 2 == 0)
    |>.map (fun x => x * x)
    |>.sum

#guard squares [1, 2, 3] = [1, 4, 9]
#guard evens [1, 2, 3, 4] = [2, 4]
#guard product [2, 3, 4] = 24
#guard product [] = 1
#guard sumOfEvenSquares [1, 2, 3, 4] = 20
