theorem s1 (xs : List Nat) : (xs ++ []).length = xs.length := by
  simp

theorem o1 (x y : Nat) (h1 : x < y) (h2 : y < 10) : x + 1 < 10 := by
  omega

theorem o2 (a b : Int) (h1 : 2 * a + b = 10) (h2 : a - b = 2) : a = 4 := by
  omega

def double (n : Nat) : Nat := n + n

theorem double_eq (n : Nat) : double n = 2 * n := by
  unfold double
  omega

theorem d1 : "lean".length + [1, 2].length = 6 := by
  decide
