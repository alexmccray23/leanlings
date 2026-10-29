def factorial : Nat → Nat
  | 0 => 1
  | n + 1 => (n + 1) * factorial n

def fib : Nat → Nat
  | 0 => 0
  | 1 => 1
  | n + 2 => fib n + fib (n + 1)

#guard factorial 0 = 1
#guard factorial 5 = 120
#guard (List.range 10).map fib = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]
