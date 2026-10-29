abbrev PosNat := { n : Nat // n > 0 }

def one : PosNat := ⟨1, by decide⟩

def five : PosNat := ⟨5, by decide⟩

def PosNat.add (a b : PosNat) : PosNat := ⟨a.val + b.val, by have := a.property; omega⟩

def toPos? (n : Nat) : Option PosNat := if h : n > 0 then some ⟨n, h⟩ else none

def safeDiv (n : Nat) (d : PosNat) : Nat := n / d.val

#guard (five.add one).val = 6
#guard (toPos? 0).isNone
#guard (toPos? 7).map (·.val) = some 7
#guard safeDiv 10 five = 2
