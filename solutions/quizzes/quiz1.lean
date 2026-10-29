structure Item where
  name : String
  priceCents : Nat
  quantity : Nat

def Item.total (i : Item) : Nat := i.priceCents * i.quantity

def cartTotal (cart : List Item) : Nat := (cart.map Item.total).sum

def findItem (cart : List Item) (name : String) : Option Item := cart.find? (·.name == name)

def formatCents (cents : Nat) : String :=
  let c := cents % 100
  let pad := if c < 10 then "0" else ""
  s!"${cents / 100}.{pad}{c}"

def cart : List Item := [⟨"apple", 50, 4⟩, ⟨"bread", 325, 1⟩, ⟨"cheese", 1099, 2⟩]

#guard cart.map Item.total = [200, 325, 2198]
#guard cartTotal cart = 2723
#guard (findItem cart "bread").map (·.priceCents) = some 325
#guard (findItem cart "milk").isNone
#guard formatCents 2723 = "$27.23"
#guard formatCents 1205 = "$12.05"
#guard formatCents 7 = "$0.07"
