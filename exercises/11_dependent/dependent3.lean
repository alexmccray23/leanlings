/-
  dependent3: Subtypes

  `{ x : α // P x }` is the type of values `x : α` that come with a proof of
  `P x`. Build one with `⟨value, proof⟩`. Get the value back with `.val`
  (or `.1`) and the proof with `.property` (or `.2`).

  This lets a type promise that its values have some property, and every
  function that receives one can rely on it.

  `have h := e` adds the fact `e` to the context, where tactics like
  `omega` can see it.
-/

-- I AM NOT DONE

abbrev PosNat := { n : Nat // n > 0 }

def one : PosNat := ⟨1, by decide⟩

def five : PosNat := ⟨5, sorry⟩

-- The sum of two positive numbers is positive.
def PosNat.add (a b : PosNat) : PosNat := ⟨a.val + b.val, sorry⟩

-- Turn a Nat into a PosNat, if it is positive.
def toPos? (n : Nat) : Option PosNat := sorry

-- Dividing by a PosNat is always safe. No zero check needed.
def safeDiv (n : Nat) (d : PosNat) : Nat := n / d.val

#guard (five.add one).val = 6
#guard (toPos? 0).isNone
#guard (toPos? 7).map (·.val) = some 7
#guard safeDiv 10 five = 2
