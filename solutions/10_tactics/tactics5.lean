def double : Nat → Nat
  | 0 => 0
  | n + 1 => double n + 2

theorem double_eq (n : Nat) : double n = 2 * n := by
  induction n with
  | zero => rfl
  | succ n ih =>
    simp only [double]
    rw [ih]
    omega

def myLength {α : Type} : List α → Nat
  | [] => 0
  | _ :: xs => myLength xs + 1

theorem myLength_append {α : Type} (xs ys : List α) :
    myLength (xs ++ ys) = myLength xs + myLength ys := by
  induction xs with
  | nil => simp [myLength]
  | cons x xs ih =>
    simp [myLength, ih]
    omega

theorem myLength_map {α β : Type} (f : α → β) (xs : List α) :
    myLength (xs.map f) = myLength xs := by
  induction xs with
  | nil => simp [myLength]
  | cons x xs ih => simp [myLength, ih]
