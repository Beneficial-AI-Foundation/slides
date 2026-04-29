import VersoSlides

open VersoSlides

set_option linter.unusedVariables false

#doc (Slides) "Double Categories" =>

# Double Categories

%%%
backgroundColor := some "#22C55E"
%%%

Categories Internal to Cat

Beneficial AI Foundation

# The Idea: Categories All the Way Down

A category has *objects* and *morphisms*.

What if the "collection of objects" and "collection of morphisms" are *themselves categories*?

This leads to *double categories* — a richer categorical structure with two dimensions of composition.

# Internal Categories: The General Pattern

An *internal category* in a category $`\mathcal{A}` (with pullbacks) consists of:

- Object of objects: $`C_0 \in \mathcal{A}`
- Object of morphisms: $`C_1 \in \mathcal{A}`
- Source and target: $`s, t : C_1 \to C_0`
- Identity: $`e : C_0 \to C_1`
- Composition: $`c : C_1 \times_{C_0} C_1 \to C_1`

# The Pullback for Composition

The composition uses the *pullback* $`C_1 \times_{C_0} C_1`:

```
C₁ ×_{C₀} C₁ ──→ C₁
      │           │
      ↓           ↓ s
     C₁ ────────→ C₀
            t
```

This captures *composable pairs*: morphisms where the target of one equals the source of the other.

# Category Axioms Internalized

The internal category must satisfy:

- *Associativity*: $`c \circ (c \times 1) = c \circ (1 \times c)`
- *Left identity*: $`c \circ (e \times 1) = 1`
- *Right identity*: $`c \circ (1 \times e) = 1`

These are the usual category axioms, expressed as commutative diagrams in $`\mathcal{A}`.

# Category Internal to Set

Let $`\mathcal{A} = \mathbf{Set}`:

- $`C_0` is a *set* of objects
- $`C_1` is a *set* of morphisms
- $`s, t, e, c` are *functions*

This is exactly the definition of a *small category*!

Every small category is a category internal to $`\mathbf{Set}`.

# Category Internal to Cat

Now let $`\mathcal{A} = \mathbf{Cat}`:

- $`C_0` is a *category* — its objects are our objects, its morphisms are *vertical* morphisms
- $`C_1` is a *category* — its objects are *horizontal* morphisms, its morphisms are *2-cells*
- $`s, t, e, c` are *functors*

This gives us a *double category*!

# The Four Components

A double category $`\mathbb{D}` has four kinds of data:

1. *Objects*: the objects of $`C_0`
2. *Vertical morphisms*: the morphisms of $`C_0`
3. *Horizontal morphisms*: the objects of $`C_1`
4. *2-cells* (squares): the morphisms of $`C_1`

# Visualizing a 2-Cell

A 2-cell $`\alpha` is a *square* with four boundaries:

```
      f
  A ────→ B
  │   α   │
u │       │ v
  ↓       ↓
  C ────→ D
      g
```

- Top/bottom: horizontal morphisms $`f, g`
- Left/right: vertical morphisms $`u, v`

# Notation for 2-Cells

We write a 2-cell as:

$$`\alpha : \begin{pmatrix} f \\ u \quad v \\ g \end{pmatrix}`

Or simply draw the square. The 2-cell $`\alpha` "fills" the boundary.

# Vertical Composition

2-cells compose *vertically* by stacking:

```
      f           f
  A ────→ B   A ────→ B
  │   α   │   │       │
  ↓       ↓   │ α∘β   │
  C ────→ D = │       │
  │   β   │   ↓       ↓
  ↓       ↓   E ────→ F
  E ────→ F
```

# Horizontal Composition

2-cells compose *horizontally* by placing side by side:

```
      f       g           f∘g
  A ────→ B ────→ C   A ──────→ C
  │   α   │   β   │ = │  α∘β   │
  ↓       ↓       ↓   ↓        ↓
  D ────→ E ────→ F   D ──────→ F
```

# The Interchange Law

Vertical and horizontal composition satisfy the *interchange law*:

$$`(\alpha \circ_v \beta) \circ_h (\gamma \circ_v \delta) = (\alpha \circ_h \gamma) \circ_v (\beta \circ_h \delta)`

This ensures the two compositions are compatible.

# Example: Squares in a Category

Given any category $`\mathcal{C}`, form $`\mathbf{Sq}(\mathcal{C})`:

- *Objects*: objects of $`\mathcal{C}`
- *Horizontal morphisms*: morphisms of $`\mathcal{C}`
- *Vertical morphisms*: morphisms of $`\mathcal{C}`
- *2-cells*: commutative squares in $`\mathcal{C}`

This is the simplest double category.

# Example: Spans

In a category $`\mathcal{C}` with pullbacks, form $`\mathbf{Span}(\mathcal{C})`:

- *Objects*: objects of $`\mathcal{C}`
- *Horizontal morphisms*: spans $`A \leftarrow X \rightarrow B`
- *Vertical morphisms*: morphisms of $`\mathcal{C}`
- *2-cells*: morphisms of spans

# What is a Span?

A *span* from $`A` to $`B` is a diagram:

```
      X
     ↙ ↘
    A   B
```

Spans compose using *pullbacks*:

```
      X ×_B Y
       ↙   ↘
      X     Y
     ↙ ↘   ↙ ↘
    A   B   C
```

# Example: Profunctors

The double category $`\mathbf{Prof}`:

- *Objects*: small categories
- *Horizontal morphisms*: profunctors $`P : \mathcal{A}^{op} \times \mathcal{B} \to \mathbf{Set}`
- *Vertical morphisms*: functors
- *2-cells*: natural transformations

Profunctors generalize functors and relations.

# Why Double Categories?

2-categories have only *one* kind of 1-morphism.

Double categories have *two*: horizontal and vertical.

This models situations with two different "directions":
- Spaces vs. paths
- Types vs. terms
- Syntax vs. semantics

# Monads in 2-Categories

Recall: a *monad* in a 2-category on object $`A` is:

- An endomorphism $`T : A \to A`
- A unit $`\eta : 1_A \Rightarrow T`
- A multiplication $`\mu : T \circ T \Rightarrow T`

Satisfying associativity and unit laws.

# Monads in Double Categories

In a double category, we can define:

*Horizontal monads*: monads using horizontal morphisms

- $`T : A \to A` (horizontal)
- $`\eta, \mu` are 2-cells

The vertical morphisms give us *monad morphisms*.

# The Key Insight: Categories as Monads

Consider $`\mathbf{Span}(\mathbf{Set})`:

A monad here consists of:
- An object $`C_0` (a set)
- A span $`C_0 \leftarrow C_1 \rightarrow C_0`
- Unit and multiplication satisfying monad laws

# Categories ARE Monads in Span

The monad data in $`\mathbf{Span}(\mathbf{Set})` is exactly:

- $`C_0`: set of objects
- $`C_1 \to C_0 \times C_0`: morphisms with source and target
- Unit: identity morphisms
- Multiplication: composition

*A small category is a monad in the double category of spans!*

# Why Double Categories Beat Bicategories

In a bicategory, monad morphisms are *too restrictive*.

They require strict commutation with the monad structure.

In a double category, vertical morphisms give *lax* monad morphisms.

These correspond to *functors* between categories!

# Monad Morphisms in Span

A vertical monad morphism in $`\mathbf{Span}(\mathbf{Set})`:

```
  C₀ ←── C₁ ──→ C₀
  │      │      │
  F₀     F₁     F₀
  ↓      ↓      ↓
  D₀ ←── D₁ ──→ D₀
```

This is exactly a *functor* $`F : \mathcal{C} \to \mathcal{D}`!

# Monads in Prof

A monad in $`\mathbf{Prof}` on a category $`\mathcal{A}`:

- A profunctor $`T : \mathcal{A} \to \mathcal{A}`
- Unit and multiplication

Special case: on a *discrete* category, this gives a small category.

Monads in Prof generalize enriched categories.

# Bimodules: Beyond Monads

A monad is a monoid in endomorphisms.

But what about morphisms *between* monads on *different* objects?

This leads to *bimodules* — the horizontal morphisms between monads.

# What is a Bimodule?

Given monads $`S` on $`A` and $`T` on $`B`, an $`(S,T)`-*bimodule* is:

- A horizontal morphism $`M : A \to B`
- Left action: $`\lambda : S \circ M \to M`
- Right action: $`\rho : M \circ T \to M`

Satisfying associativity and unit laws.

# Bimodule Axioms

The actions must be compatible:

```
S ∘ M ∘ T ──→ M ∘ T ──→ M
    │                   ‖
    ↓                   ‖
  S ∘ M ─────────────→ M
```

Both paths give the same result.

# Bimodules in Span

In $`\mathbf{Span}(\mathbf{Set})`:

- Monads = categories
- Bimodules = ???

An $`(\mathcal{C}, \mathcal{D})`-bimodule is a span with compatible actions.

# Bimodules ARE Profunctors!

A bimodule $`M : \mathcal{C} \to \mathcal{D}` in Span is:

- A set $`M` with maps to $`C_0` and $`D_0`
- Left $`\mathcal{C}`-action: precomposition with morphisms
- Right $`\mathcal{D}`-action: postcomposition with morphisms

This is exactly a *profunctor* $`\mathcal{C}^{op} \times \mathcal{D} \to \mathbf{Set}`!

# The Profunctor Perspective

A profunctor $`P : \mathcal{C} \to \mathcal{D}` assigns:

- To each pair $`(c, d)`, a set $`P(c, d)`
- Left action: $`f : c' \to c` gives $`P(c,d) \to P(c',d)`
- Right action: $`g : d \to d'` gives $`P(c,d) \to P(c,d')`

*Profunctors generalize the Hom functor!*

# The Hom Profunctor

Every category has a canonical profunctor:

$$`\mathrm{Hom} : \mathcal{C}^{op} \times \mathcal{C} \to \mathbf{Set}`

This is the *identity bimodule* for $`\mathcal{C}`.

Composition of profunctors uses coends — like matrix multiplication.

# The Double Category of Monads

Given $`\mathbb{D}`, form $`\mathbf{Mnd}(\mathbb{D})`:

- *Objects*: monads in $`\mathbb{D}`
- *Vertical morphisms*: monad morphisms
- *Horizontal morphisms*: bimodules
- *2-cells*: bimodule morphisms

This is itself a double category!

# The Equivalence

For $`\mathbf{Span}(\mathbf{Set})`:

$$`\mathbf{Mnd}(\mathbf{Span}) \simeq \mathbf{Prof}`

- Monads $`\leftrightarrow` Categories
- Monad morphisms $`\leftrightarrow` Functors
- Bimodules $`\leftrightarrow` Profunctors

*Prof arises naturally from Span!*

# Why Bimodules Matter

Functors are "strict" — they preserve structure exactly.

Profunctors/bimodules allow *heteromorphisms*:

- Elements of $`P(c,d)` are "generalized morphisms" from $`c` to $`d`
- No requirement that $`c` and $`d` live in the same category

Bimodules are the natural "1-cells" between monads.

# Example: Polynomial Monads

The double category of *polynomial functors*:

- Objects: sets
- Horizontal morphisms: $`P(X) = \sum_{a:A} X^{B_a}`

Monads here include:
- Lists: $`L(X) = 1 + X \cdot L(X)`
- Binary trees: $`T(X) = X + T(X)^2`

# The Eilenberg-Moore Construction

Given a horizontal monad $`T` in $`\mathbb{D}`:

We can form $`\mathbf{EM}(T)`:
- Objects: $`T`-algebras
- Morphisms: algebra morphisms

This generalizes the usual Eilenberg-Moore category.

# Double Functors

A *double functor* $`F : \mathbb{D} \to \mathbb{E}` preserves:

- Objects $`\mapsto` Objects
- Horizontal morphisms $`\mapsto` Horizontal morphisms
- Vertical morphisms $`\mapsto` Vertical morphisms
- 2-cells $`\mapsto` 2-cells

Plus: composition and identities in both directions.

# Summary

- *Internal categories*: categories defined inside another category
- *Category in Set*: small category
- *Category in Cat*: double category
- Four components: objects, horizontal/vertical morphisms, 2-cells
- Key examples: $`\mathbf{Sq}(\mathcal{C})`, $`\mathbf{Span}`, $`\mathbf{Prof}`

# The Unifying Perspective

Double categories reveal hidden structure:

- *Categories* = monads in Span
- *Functors* = monad morphisms
- *Profunctors* = bimodules between monads

The double category $`\mathbf{Prof}` arises as $`\mathbf{Mnd}(\mathbf{Span})`!

# Thank You

%%%
backgroundColor := some "#22C55E"
%%%

*Beneficial AI Foundation*

beneficialaifoundation.org
