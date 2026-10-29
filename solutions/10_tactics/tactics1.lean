theorem t1 (p q : Prop) (hp : p) (hq : q) : p ∧ q := by
  constructor
  · exact hp
  · exact hq

theorem t2 (p q r : Prop) (hpq : p → q) (hqr : q → r) : p → r := by
  intro hp
  apply hqr
  apply hpq
  exact hp

theorem t3 (p q : Prop) : p → q → p := by
  intro hp _hq
  exact hp
