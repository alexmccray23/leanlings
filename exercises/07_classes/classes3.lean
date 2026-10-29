/-
  classes3: Operators are type classes too

  `a + b` is notation for `HAdd.hAdd a b`. When both sides and the result
  have the same type, you can implement the simpler `Add` class instead:

    instance : Add Point where
      add p q := ...

  `Mul`, `Sub`, `Neg` and others work the same way. `HMul α β γ` covers
  `a * b` where `a : α`, `b : β`, and the result has type `γ`.
-/

-- I AM NOT DONE

structure Vec2 where
  x : Int
  y : Int
deriving Repr, DecidableEq

-- Make `v + w` add two vectors, component by component.
instance : Add Vec2 where
  add v w := sorry

-- Make `k * v` scale a vector by an integer.
instance : HMul Int Vec2 Vec2 where
  hMul k v := sorry

-- Make `-v` point the other way. You'll need an instance of `Neg`.

def v : Vec2 := ⟨1, 2⟩
def w : Vec2 := ⟨3, -1⟩

#guard v + w = ⟨4, 1⟩
#guard (3 : Int) * v = ⟨3, 6⟩
#guard -w = ⟨-3, 1⟩
#guard v + -v = ⟨0, 0⟩
