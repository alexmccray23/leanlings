def applyTwice (f : Nat → Nat) (x : Nat) : Nat := f (f x)

#guard applyTwice (fun n => n + 3) 10 = 16
#guard applyTwice (· * 3) 2 = 18

#guard applyTwice (· * 2) 25 = 100
