structure Point where
  x : Int
  y : Int
deriving Repr, DecidableEq

def Point.add (p q : Point) : Point := ⟨p.x + q.x, p.y + q.y⟩

def Point.shiftX (p : Point) (dx : Int) : Point := { p with x := p.x + dx }

def start : Point := ⟨1, 2⟩

#guard start.add ⟨10, 20⟩ = ⟨11, 22⟩
#guard start.shiftX (-5) = ⟨-4, 2⟩
#guard (start.shiftX 3).add start = ⟨5, 4⟩
