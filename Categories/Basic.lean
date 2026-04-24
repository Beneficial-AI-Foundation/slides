import VersoSlides

open VersoSlides

set_option linter.unusedVariables false

#doc (Slides) "Category Theory" =>

# Category Theory

%%%
backgroundColor := some "#0073A3"
%%%

From Sets to Categories

Beneficial AI Foundation

# Sets: Collections of Elements

In set theory, we think of sets as *collections of elements*.

- The set `{1, 2, 3}` contains the elements `1`, `2`, and `3`
- An element `x ∈ S` is "inside" the set `S`

But there's another way to think about elements...

# Elements as Functions

An element `x ∈ S` can be viewed as a *function* from a one-point set `*` to `S`:

`x : * → S`

This shift in perspective — from "being in" to "mapping into" — is the first step toward categorical thinking.

# Types Are Not Collections

In programming languages and type theory, types are *not* collections of elements.

A type is a *symbol* with *constructors* — functions into the type:

```
inductive Nat where
  | zero : Nat
  | succ : Nat → Nat
```

- `zero` is a function `* → Nat`
- `succ` is a function `Nat → Nat`

# Matrices as Linear Maps

In linear algebra, we can think of matrices as *linear maps* (functions) between vector spaces.

An `m × n` matrix represents a linear map:

`A : ℝⁿ → ℝᵐ`

- Input dimension: `n`
- Output dimension: `m`

# Square Matrices Form a Ring

When input and output dimensions are the *same*, square matrices form a *ring*:

- Addition: `A + B`
- Multiplication: `A · B`
- Identity: `I`

The `n × n` matrices over a field form the ring `Mₙ(k)`.

# But Different Dimensions?

What if input and output dimensions are *different*?

- A `3 × 2` matrix `A : ℝ² → ℝ³`
- A `4 × 3` matrix `B : ℝ³ → ℝ⁴`

We can compose: `B · A : ℝ² → ℝ⁴`

But we *cannot* add `A + B` — the dimensions don't match!

These don't form a ring. So what structure do they have?

# They Form a Category!

The collection of *all* matrices (of all dimensions) forms a *category*:

- *Objects*: Natural numbers `0, 1, 2, 3, ...` (representing dimensions)
- *Morphisms*: An `m × n` matrix is a morphism `n → m`
- *Composition*: Matrix multiplication (when dimensions match)
- *Identity*: The identity matrix `Iₙ : n → n`

# What is a Category?

A *category* `C` consists of:

- A collection of *objects*
- For each pair of objects `A, B`, a collection of *morphisms* `A → B`
- *Composition*: If `f : A → B` and `g : B → C`, then `g ∘ f : A → C`
- *Identity*: For each object `A`, an identity morphism `idₐ : A → A`

# The Category Laws

1. *Associativity*: `(h ∘ g) ∘ f = h ∘ (g ∘ f)`

2. *Identity*: `id ∘ f = f` and `f ∘ id = f`

These are exactly the laws that matrix multiplication satisfies!

# Categories Are Everywhere

- *Sets*: Objects are sets, morphisms are functions
- *Types*: Objects are types, morphisms are functions
- *Vector spaces*: Objects are vector spaces, morphisms are linear maps
- *Groups*: Objects are groups, morphisms are group homomorphisms
- *Posets*: Objects are elements, morphism `a → b` exists iff `a ≤ b`

# The Big Idea

Category theory provides a *unified language* for mathematics.

Instead of asking "what are the elements?", we ask:

*"What are the morphisms?"*

# Thank You

%%%
backgroundColor := some "#0073A3"
%%%

*Beneficial AI Foundation*

beneficialaifoundation.org
