/-
  classes2: Writing your own type class

  A class lists the operations that every instance has to provide:

    class Describe (α : Type) where
      describe : α → String

  A function can ask for an instance with an argument in square brackets,
  and then use the class's operations on α:

    def describeAll {α : Type} [Describe α] (xs : List α) : List String :=
      xs.map Describe.describe
-/

-- I AM NOT DONE

class HasArea (α : Type) where
  area : α → Nat

structure Rect where
  width : Nat
  height : Nat

structure Square where
  side : Nat

instance : HasArea Rect where
  area r := r.width * r.height

-- Give `Square` an instance too.

-- Add up the areas of all the shapes in the list.
def totalArea {α : Type} [HasArea α] (shapes : List α) : Nat := sorry

#guard HasArea.area (Rect.mk 2 3) = 6
#guard HasArea.area (Square.mk 4) = 16
#guard totalArea [Rect.mk 1 2, Rect.mk 3 4] = 14
#guard totalArea [Square.mk 1, Square.mk 2, Square.mk 3] = 14
