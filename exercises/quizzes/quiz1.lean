/-
  quiz1: A shopping cart

  This quiz uses structures, lists, Option, and strings.

  A cart is a list of items. Each item has a name, a price in cents, and a
  quantity. Fill in the functions below.
-/

-- I AM NOT DONE

structure Item where
  name : String
  priceCents : Nat
  quantity : Nat

-- The price of one line of the cart: price times quantity.
def Item.total (i : Item) : Nat := sorry

-- The total price of the whole cart, in cents.
def cartTotal (cart : List Item) : Nat := sorry

-- Look up an item by name.
def findItem (cart : List Item) (name : String) : Option Item := sorry

-- Format cents as dollars, like "$12.05".
def formatCents (cents : Nat) : String := sorry

def cart : List Item := [⟨"apple", 50, 4⟩, ⟨"bread", 325, 1⟩, ⟨"cheese", 1099, 2⟩]

#guard cart.map Item.total = [200, 325, 2198]
#guard cartTotal cart = 2723
#guard (findItem cart "bread").map (·.priceCents) = some 325
#guard (findItem cart "milk").isNone
#guard formatCents 2723 = "$27.23"
#guard formatCents 1205 = "$12.05"
#guard formatCents 7 = "$0.07"
