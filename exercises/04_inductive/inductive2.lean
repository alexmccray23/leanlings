/-
  inductive2: Constructors with data

  Constructors can carry values, so each one describes a different shape
  of data:

    inductive Contact where
      | email (address : String)
      | phone (number : Nat)

  A match gives names to the data in each case:

    def Contact.describe : Contact → String
      | .email a => s!"email {a}"
      | .phone n => s!"phone {n}"
-/

-- I AM NOT DONE

inductive Shape where
  | rectangle (width height : Nat)
  | square (side : Nat)
  -- Add a `triangle` constructor with a `base` and a `height`.

-- For triangles, use base * height / 2.
def Shape.area : Shape → Nat
  | .rectangle w h => w * h
  | _ => sorry

#guard (Shape.rectangle 3 4).area = 12
#guard (Shape.square 5).area = 25
#guard (Shape.triangle 6 4).area = 12
