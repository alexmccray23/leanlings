namespace Leanlings

/-- One exercise. Its file lives at `exercises/<dir>/<name>.lean`, and the
reference solution at `solutions/<dir>/<name>.lean`. -/
structure Exercise where
  name : String
  dir : String
  hint : String

namespace Exercise

def relPath (e : Exercise) : String := s!"{e.dir}/{e.name}.lean"

def path (e : Exercise) : System.FilePath := "exercises" / e.dir / s!"{e.name}.lean"

def solutionPath (e : Exercise) : System.FilePath := "solutions" / e.dir / s!"{e.name}.lean"

end Exercise

end Leanlings
