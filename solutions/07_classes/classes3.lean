structure Vec2 where
  x : Int
  y : Int
deriving Repr, DecidableEq

instance : Add Vec2 where
  add v w := ⟨v.x + w.x, v.y + w.y⟩

instance : HMul Int Vec2 Vec2 where
  hMul k v := ⟨k * v.x, k * v.y⟩

instance : Neg Vec2 where
  neg v := ⟨-v.x, -v.y⟩

def v : Vec2 := ⟨1, 2⟩
def w : Vec2 := ⟨3, -1⟩

#guard v + w = ⟨4, 1⟩
#guard (3 : Int) * v = ⟨3, 6⟩
#guard -w = ⟨-3, 1⟩
#guard v + -v = ⟨0, 0⟩
