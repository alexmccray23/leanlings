theorem rw1 (a b c : Nat) (h1 : a = b) (h2 : b = c) : a = c := by
  rw [h1, h2]

theorem rw2 (f : Nat → Nat) (a b : Nat) (h : a = b) (hf : f b = 10) : f a = 10 := by
  rw [h]
  exact hf

theorem rw3 (a b : Nat) : a + b + 0 = b + a := by
  rw [Nat.add_zero, Nat.add_comm]

theorem rw4 (a b c : Nat) (h : c = a) : a + b = b + c := by
  rw [h, Nat.add_comm]
