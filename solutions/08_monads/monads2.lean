def ages : List (String × Nat) := [("alice", 31), ("bob", 27), ("carol", 45)]

def bosses : List (String × String) := [("bob", "alice"), ("carol", "bob")]

def bossAge (name : String) : Option Nat := do
  let boss ← bosses.lookup name
  ages.lookup boss

def grandBossAge (name : String) : Option Nat := do
  let boss ← bosses.lookup name
  bossAge boss

#guard bossAge "bob" = some 31
#guard bossAge "carol" = some 27
#guard bossAge "alice" = none
#guard grandBossAge "carol" = some 31
#guard grandBossAge "bob" = none
