/-
  structures1: Structures

  A structure groups named fields into a new type:

    structure Point where
      x : Nat
      y : Nat

  There are several ways to build a value:

    { x := 1, y := 2 }    -- by field name
    ⟨1, 2⟩                -- anonymous constructor, fields in order
    Point.mk 1 2          -- the constructor function

  Read a field with dot notation: `p.x`.
  (In VS Code, type ⟨ and ⟩ as \< and \>.)
-/

-- I AM NOT DONE

structure Book where
  title : String
  author : String
  -- Add a `pages` field here.

def hobbit : Book := { title := "The Hobbit", author := "J. R. R. Tolkien", pages := 310 }

-- Make a book with fewer than 100 pages. Try the ⟨...⟩ syntax.
def shortBook : Book := sorry

#guard hobbit.pages = 310
#guard shortBook.pages < 100
