structure Color where
  r : Nat
  g : Nat
  b : Nat

def red : Color := ⟨255, 0, 0⟩

instance : ToString Color where
  toString c := s!"rgb({c.r}, {c.g}, {c.b})"

#guard toString red = "rgb(255, 0, 0)"
#guard s!"The color is {red}." = "The color is rgb(255, 0, 0)."
#guard toString [red, ⟨0, 128, 0⟩] = "[rgb(255, 0, 0), rgb(0, 128, 0)]"
