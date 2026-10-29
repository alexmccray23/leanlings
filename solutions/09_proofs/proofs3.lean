theorem self_imp (p : Prop) : p → p := fun h => h

theorem modus_ponens (p q : Prop) (hp : p) (hpq : p → q) : q := hpq hp

theorem imp_trans (p q r : Prop) (hpq : p → q) (hqr : q → r) : p → r := fun hp => hqr (hpq hp)

theorem curry_and (p q r : Prop) (h : p ∧ q → r) : p → q → r := fun hp hq => h ⟨hp, hq⟩
