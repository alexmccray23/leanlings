/-
  classes1: Type classes

  A type class describes an operation that many types can support. For
  example, `ToString α` means "values of type α can be turned into a
  String". `toString` and string interpolation work for every type that
  has an instance.

  You give a type an instance like this:

    instance : ToString Coin where
      toString c := match c with
        | .heads => "heads"
        | .tails => "tails"
-/

-- I AM NOT DONE

structure Color where
  r : Nat
  g : Nat
  b : Nat

def red : Color := ⟨255, 0, 0⟩

-- Make `toString red` produce "rgb(255, 0, 0)".
instance : ToString Color where
  toString c := sorry

#guard toString red = "rgb(255, 0, 0)"
#guard s!"The color is {red}." = "The color is rgb(255, 0, 0)."
-- Instances combine: a list of Colors can be printed because Colors can.
#guard toString [red, ⟨0, 128, 0⟩] = "[rgb(255, 0, 0), rgb(0, 128, 0)]"
