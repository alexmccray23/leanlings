def sumTo (n : Nat) : Nat := Id.run do
  let mut total := 0
  for i in [1:n+1] do
    total := total + i
  return total

def countVowels (s : String) : Nat := Id.run do
  let mut count := 0
  for c in s.toList do
    if "aeiou".contains c then
      count := count + 1
  return count

#guard sumTo 10 = 55
#guard sumTo 0 = 0
#guard countVowels "functional programming" = 7
#guard countVowels "rhythm" = 0
