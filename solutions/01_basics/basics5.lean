def isEven (n : Nat) : Bool := n % 2 == 0

def classify (n : Nat) : String :=
  if n == 0 then "zero" else if n < 10 then "small" else "big"

#guard isEven 10
#guard !isEven 7
#guard classify 0 = "zero"
#guard classify 5 = "small"
#guard classify 10 = "big"
