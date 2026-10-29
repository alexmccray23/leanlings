/-
  collections2: Working with lists

  The library has plenty of list functions:

    xs.map f          apply f to every element
    xs.filter p       keep the elements where p is true
    xs.foldl f init   combine the elements from the left, starting from init
    xs.sum, xs.length, xs.reverse, xs.contains x, ...

  `xs.map f` means `List.map f xs`. You can chain calls, and `|>.` continues
  a chain on the next line:

    xs.filter (· > 0)
      |>.map (· * 2)
-/

-- I AM NOT DONE

def squares (xs : List Nat) : List Nat := sorry

def evens (xs : List Nat) : List Nat := sorry

-- Multiply the elements together using `foldl`. The product of [] is 1.
def product (xs : List Nat) : Nat := sorry

-- The sum of the squares of the even numbers.
def sumOfEvenSquares (xs : List Nat) : Nat := sorry

#guard squares [1, 2, 3] = [1, 4, 9]
#guard evens [1, 2, 3, 4] = [2, 4]
#guard product [2, 3, 4] = 24
#guard product [] = 1
#guard sumOfEvenSquares [1, 2, 3, 4] = 20
