/-
  structures2: Methods and updates

  A function named `Point.something` can be called with dot notation: if
  `p : Point`, then `p.something` means `Point.something p`.

  Structures can't be changed in place. To get a copy with some fields
  changed, write `{ p with x := 5 }`.

  `deriving Repr, DecidableEq` asks Lean to generate code for printing
  values and for comparing them with `=`.
-/

-- I AM NOT DONE

structure Point where
  x : Int
  y : Int
deriving Repr, DecidableEq

def Point.add (p q : Point) : Point := sorry

-- Move a point sideways by `dx`, keeping `y` the same. Use `{ p with ... }`.
def Point.shiftX (p : Point) (dx : Int) : Point := sorry

def start : Point := ⟨1, 2⟩

#guard start.add ⟨10, 20⟩ = ⟨11, 22⟩
#guard start.shiftX (-5) = ⟨-4, 2⟩
#guard (start.shiftX 3).add start = ⟨5, 4⟩
