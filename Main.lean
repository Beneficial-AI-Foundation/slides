import VersoSlides
import Categories.Basic
import Monads.Basic

open VersoSlides

def main : IO UInt32 := do
  -- Build category theory slides
  let _ ← slidesMain (config := { outputDir := "_site/categories" }) (doc := %doc Categories.Basic)
  -- Build monads slides
  let _ ← slidesMain (config := { outputDir := "_site/monads" }) (doc := %doc Monads.Basic)
  return 0
