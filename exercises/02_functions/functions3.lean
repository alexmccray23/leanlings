/-
  functions3: Partial application

  A two-parameter function like `multiply : Nat → Nat → Nat` is really a
  function that takes one argument and returns another function. So
  `multiply 3` is a function `Nat → Nat` that multiplies by 3.

  Giving a function only some of its arguments like this is called partial
  application.
-/

-- I AM NOT DONE

def multiply (x y : Nat) : Nat := x * y

-- Define `triple` by partially applying `multiply`. You don't need `fun`.
def triple : Nat → Nat := sorry

#guard triple 5 = 15

-- `List.map f xs` applies `f` to every element of `xs`.
-- Use partial application to multiply every element by ten.
#guard List.map sorry [1, 2, 3] = [10, 20, 30]
