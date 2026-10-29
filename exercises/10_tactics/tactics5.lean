/-
  tactics5: Induction

  To prove something for every `Nat`, prove it for `0`, then show that if
  it holds for `n`, it also holds for `n + 1`:

    induction n with
    | zero => ...         -- the goal for 0
    | succ n ih => ...    -- `ih` is the statement for n; the goal is for n + 1

  Lists work the same way, with the cases `nil` and `cons x xs ih`.

  Automation can't do these alone because they're about functions defined
  by recursion, so `omega` doesn't know what they mean. It can still finish
  the arithmetic once the induction hypothesis is in place.
-/

-- I AM NOT DONE

def double : Nat → Nat
  | 0 => 0
  | n + 1 => double n + 2

theorem double_eq (n : Nat) : double n = 2 * n := by
  induction n with
  | zero => rfl
  | succ n ih =>
    simp only [double]
    sorry

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

-- Now do one on your own.
theorem myLength_map {α β : Type} (f : α → β) (xs : List α) :
    myLength (xs.map f) = myLength xs := by
  sorry
