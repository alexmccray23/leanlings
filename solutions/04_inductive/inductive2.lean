inductive Shape where
  | rectangle (width height : Nat)
  | square (side : Nat)
  | triangle (base height : Nat)

def Shape.area : Shape → Nat
  | .rectangle w h => w * h
  | .square s => s * s
  | .triangle b h => b * h / 2

#guard (Shape.rectangle 3 4).area = 12
#guard (Shape.square 5).area = 25
#guard (Shape.triangle 6 4).area = 12
