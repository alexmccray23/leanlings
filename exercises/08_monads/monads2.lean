/-
  monads2: `do` with Option

  `do` notation works for more than `Id`. In an `Option` block,
  `let x ← e` takes the value out of `e : Option α`. If `e` is `none`, the
  whole block stops and returns `none`. That saves you from writing nested
  `match`es:

    def addStrings (a b : String) : Option Nat := do
      let x ← a.toNat?
      let y ← b.toNat?
      return x + y
-/

-- I AM NOT DONE

def ages : List (String × Nat) := [("alice", 31), ("bob", 27), ("carol", 45)]

-- Who reports to whom: bob's boss is alice.
def bosses : List (String × String) := [("bob", "alice"), ("carol", "bob")]

-- The age of `name`'s boss. `bosses.lookup "bob"` is `some "alice"`.
def bossAge (name : String) : Option Nat := sorry

-- The age of `name`'s boss's boss.
def grandBossAge (name : String) : Option Nat := sorry

#guard bossAge "bob" = some 31
#guard bossAge "carol" = some 27
#guard bossAge "alice" = none
#guard grandBossAge "carol" = some 31
#guard grandBossAge "bob" = none
