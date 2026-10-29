class HasArea (α : Type) where
  area : α → Nat

structure Rect where
  width : Nat
  height : Nat

structure Square where
  side : Nat

instance : HasArea Rect where
  area r := r.width * r.height

instance : HasArea Square where
  area s := s.side * s.side

def totalArea {α : Type} [HasArea α] (shapes : List α) : Nat := (shapes.map HasArea.area).sum

#guard HasArea.area (Rect.mk 2 3) = 6
#guard HasArea.area (Square.mk 4) = 16
#guard totalArea [Rect.mk 1 2, Rect.mk 3 4] = 14
#guard totalArea [Square.mk 1, Square.mk 2, Square.mk 3] = 14
