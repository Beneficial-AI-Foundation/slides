import Lake
open Lake DSL

package tutorials where
  version := v!"0.1.0"

require «verso-slides» from git
  "https://github.com/leanprover/verso-slides.git" @ "main"

lean_lib Categories where
  roots := #[`Categories.Basic]

lean_lib Monads where
  roots := #[`Monads.Basic]

lean_lib SSProve where
  roots := #[`SSProve.Basic]

lean_lib Double where
  roots := #[`Double.Basic]

@[default_target]
lean_exe tutorialsMain where
  root := `Main
