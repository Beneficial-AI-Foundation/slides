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

# What is a Monoid?

%%%
state := some "section-divider"
%%%

From sets to categories

# Monoids: The Familiar Way

A *monoid* is a set $`M` with:

- Multiplication: $`\cdot : M \times M \to M`
- Identity element: $`e \in M`

Satisfying:
- *Associativity*: $`(a \cdot b) \cdot c = a \cdot (b \cdot c)`
- *Identity*: $`e \cdot a = a \cdot e = a`

*Examples*: integers under addition, strings under concatenation, matrices under multiplication

# Monoids as One-Object Categories

A monoid $`(M, \cdot, e)` can be viewed as a *category with one object*:

- Single object: $`\bullet`
- Morphisms $`\bullet \to \bullet`: elements of $`M`
- Composition: the multiplication $`\cdot`
- Identity morphism: the element $`e`

The category axioms are exactly the monoid axioms!

# Rephrasing with Arrows

Category theory prefers *arrows* over *elements*. So:

- Encode identity $`e` as an arrow $`\eta : 1 \to M`
  (choosing an element = choosing a function from a singleton)
- Multiplication is already an arrow $`\mu : M \times M \to M`

The axioms become commutative diagrams:
- *Associativity*: two ways to fold $`M \times M \times M \to M` agree
- *Identity*: $`\mu \circ (\eta \times \text{id}) = \text{id} = \mu \circ (\text{id} \times \eta)`

# Monoidal Categories

A *monoidal category* $`(\mathcal{C}, \otimes, I)` has:

- A category $`\mathcal{C}`
- A tensor product $`\otimes : \mathcal{C} \times \mathcal{C} \to \mathcal{C}`
- A unit object $`I`

This is exactly the structure needed to draw the arrow-based monoid diagrams!

# Monoid Objects in Monoidal Categories

A *monoid object* in the monoidal category $`(\mathcal{C}, \otimes, I)` is:

- An object $`M` of $`\mathcal{C}`
- Multiplication: $`\mu : M \otimes M \to M`
- Unit: $`\eta : I \to M`

such that associativity and identity diagrams commute.

# Monoid Objects in Monoidal Categories: Examples

The same definition yields many algebraic structures:

- In $`(\mathbf{Set}, \times, 1)`: ordinary monoids
- In $`(\mathbf{Ab}, \otimes_\mathbb{Z}, \mathbb{Z})`: rings
- In $`(\mathbf{Vect}_k, \otimes, k)`: $`k`-algebras
- In $`(\mathbf{Top}, \times, \ast)`: topological monoids

# Monoidal Categories as One-Object Bicategories

The tensor product $`\otimes` is itself a "multiplication" on objects!

View a monoidal category $`(\mathcal{C}, \otimes, I)` as a *one-object bicategory*:
- Single 0-cell: $`\bullet`
- 1-cells $`\bullet \to \bullet`: objects of $`\mathcal{C}`
- 2-cells: morphisms of $`\mathcal{C}`
- Horizontal composition of 1-cells: $`\otimes`
- Identity 1-cell: $`I`

*Conversely*, a one-object bicategory always corresponds to a monoidal category.

# Endomorphism Bicategories

Given a 0-cell $`X` in a bicategory $`\mathbb{C}`, form the *endomorphism bicategory* $`\mathbb{C}(X,X)` at $`X`:
- Single 0-cell: $`X`
- 1-cells: $`\text{Hom}(X, X)` (endomorphisms of $`X`)
- 2-cells: 2-cells between endomorphisms

This is a one-object bicategory, hence it corresponds to a monoidal category.

*Example.* The endomorphism bicategory $`\mathbb{C}\text{at}(\mathcal{C}, \mathcal{C})` corresponds to the monoidal category $`\lbrack\mathcal{C}, \mathcal{C}\rbrack`.

# Monads as Monoid Objects

A *monad on* $`X` *in a bicategory* $`\mathbb{C}` is a monoid object in the monoidal category corresponding to $`\mathbb{C}(X,X)`:
- An endomorphism $`T : X \to X`
- Multiplication: $`\mu : T \circ T \Rightarrow T`
- Unit: $`\eta : \text{Id} \Rightarrow T`

In $`\mathbb{C}\text{at}`, a *monad on* $`\mathcal{C}` is a monoid object in $`\lbrack\mathcal{C}, \mathcal{C}\rbrack`.
- An endofunctor $`T : \mathcal{C} \to \mathcal{C}`
- Multiplication: a natural transformation $`\mu : T \circ T \Rightarrow T`
- Unit: a natural transformation $`\eta : \text{Id} \Rightarrow T`

# What is a Monad?

%%%
state := some "section-divider"
%%%

Definition and laws

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

# Categorical Perspective

%%%
state := some "section-divider"
%%%

The mathematical foundations

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
