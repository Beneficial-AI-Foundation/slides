import VersoSlides

open VersoSlides

set_option linter.unusedVariables false

#doc (Slides) "Monads" =>

# Monads

%%%
state := some "title-slide"
%%%

In Mathematics and Programming

Beneficial AI Foundation

# What is a Monad?

A monad is a structure that combines:

- A type constructor `M`
- A `pure` operation: `a → M a`
- A `bind` operation: `M a → (a → M b) → M b`

# The Monad Laws

1. *Left identity*
   `pure a >>= f = f a`

2. *Right identity*
   `m >>= pure = m`

3. *Associativity*
   `(m >>= f) >>= g = m >>= (λx => f x >>= g)`

# Example: Option

Represents computations that might fail.

```lean
def divide (x y : Nat) : Option Nat :=
  if y == 0 then none else some (x / y)

#eval do
  let a ← divide 10 2
  let b ← divide a 5
  return b
```

# Example: List

Represents non-deterministic computations.

```lean
def pairs : List (Nat × Nat) := Id.run do
  let mut result := []
  for x in [1, 2, 3] do
    for y in [4, 5] do
      result := result ++ [(x, y)]
  return result

#eval pairs
```

# Example: IO

Represents computations with side effects.

```lean
def greet : IO Unit := do
  IO.println "What is your name?"
  let stdin ← IO.getStdin
  let name ← stdin.getLine
  IO.println s!"Hello, {name.trim}!"
```

# Monads in Category Theory

A monad on a category `C` is an endofunctor `T : C → C` equipped with:

- *Unit*: A natural transformation `η : Id → T`
- *Multiplication*: A natural transformation `μ : T² → T`

# Monad Laws (Categorical)

The following diagrams must commute:

- *Associativity*: `μ ∘ Tμ = μ ∘ μT`
- *Left unit*: `μ ∘ ηT = id`
- *Right unit*: `μ ∘ Tη = id`

# Kleisli Category

Given a monad `T` on `C`, the *Kleisli category* has:

- *Objects*: Same as `C`
- *Morphisms*: `A → TB` (Kleisli arrows)
- *Composition*: `g ∘_K f = μ ∘ Tg ∘ f`

# Next Steps

- Monad transformers
- Free monads
- Comonads
- Algebraic effects

# Thank You

%%%
state := some "title-slide"
%%%

*Beneficial AI Foundation*

beneficialaifoundation.org
