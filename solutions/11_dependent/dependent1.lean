def thirdOrZero (xs : Array Nat) : Nat := xs[2]?.getD 0

def third (xs : Array Nat) (h : xs.size ≥ 3) : Nat := xs[2]

def firstPlusLast (xs : Array Nat) (h : xs.size > 0) : Nat := xs[0] + xs[xs.size - 1]

#guard thirdOrZero #[10, 20, 30, 40] = 30
#guard thirdOrZero #[10, 20] = 0
#guard third #[1, 2, 3] (by decide) = 3
#guard firstPlusLast #[1, 2, 3, 4] (by decide) = 5
#guard firstPlusLast #[7] (by decide) = 14
