structure Book where
  title : String
  author : String
  pages : Nat

def hobbit : Book := { title := "The Hobbit", author := "J. R. R. Tolkien", pages := 310 }

def shortBook : Book := ⟨"The Little Prince", "Antoine de Saint-Exupéry", 96⟩

#guard hobbit.pages = 310
#guard shortBook.pages < 100
