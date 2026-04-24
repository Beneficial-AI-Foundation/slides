import VersoSlides

open VersoSlides

set_option linter.unusedVariables false

#doc (Slides) "Category Theory" =>

# Category Theory

%%%
backgroundColor := some "#0073A3"
%%%

Introduction to Categories

Beneficial AI Foundation

# What is a Category?

A category consists of:

- A collection of *objects*
- A collection of *morphisms* (arrows) between objects
- A composition operation for morphisms
- An identity morphism for each object

# The Category Laws

For any category, the following laws must hold:

1. *Associativity*: `(f ∘ g) ∘ h = f ∘ (g ∘ h)`

2. *Identity*: `id ∘ f = f` and `f ∘ id = f`

# Example: The Category of Sets

- *Objects*: Sets
- *Morphisms*: Functions between sets
- *Composition*: Function composition
- *Identity*: The identity function

# Example: The Category of Types

In programming, types form a category:

- *Objects*: Types (`Int`, `String`, `List α`, ...)
- *Morphisms*: Functions between types
- *Composition*: Function composition
- *Identity*: `fun x => x`

# Functors

A *functor* `F : C → D` between categories consists of:

- A mapping on objects: `F(A)` for each object `A` in `C`
- A mapping on morphisms: `F(f) : F(A) → F(B)` for each `f : A → B`

Preserving:
- Identity: `F(id) = id`
- Composition: `F(g ∘ f) = F(g) ∘ F(f)`

# Natural Transformations

A *natural transformation* `η : F → G` between functors is:

- A family of morphisms `η_A : F(A) → G(A)` for each object `A`

Such that for any `f : A → B`:

`η_B ∘ F(f) = G(f) ∘ η_A`

# Next Steps

- Adjunctions
- Limits and colimits
- Yoneda lemma
- Kan extensions

# Thank You

%%%
backgroundColor := some "#0073A3"
%%%

*Beneficial AI Foundation*

beneficialaifoundation.org
