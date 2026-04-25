import VersoSlides

open VersoSlides

set_option linter.unusedVariables false

#doc (Slides) "Category Theory" =>

# Category Theory

%%%
backgroundColor := some "#22C55E"
%%%

From Sets to Categories

Beneficial AI Foundation

# Sets, Elements, and Functions

In set theory, we work with three concepts:

- *Sets*: collections like $`\mathbb{N}`, $`\mathbb{R}`, $`\{1, 2, 3\}`
- *Elements*: $`x \in S` — an element belongs to a set
- *Functions*: $`f : A \to B` — a mapping between sets

But, can we simplify this? Can we express one concept in terms of the other two?

# Elements as Functions

An element $`x \in S` can be viewed as a *function* from a one-point set $`*` to $`S`:

$$`x : * \to S`

Now we only have *sets* and *functions* between them!

This shift to an *element-free* perspective is the first step toward categorical thinking.

# Types, not Collections of Terms

In programming languages and type theory, types are *not defined* as collections of terms.

A type is a symbolic *object* with *constructors* — functions into the type:

```
inductive Nat where
  | zero : Nat
  | succ : Nat → Nat
```

- `zero` is a function $`* \to \mathsf{Nat}`
- `succ` is a function $`\mathsf{Nat} \to \mathsf{Nat}`

The type `Nat` is *freely generated* by these constructors.

# Linear Maps, not Matrices

In linear algebra, a *linear map* between vector spaces is represented by an $`m \times n` matrix:

$$`A : \mathbb{R}^n \to \mathbb{R}^m`

- Input dimension: $`n`
- Output dimension: $`m`

We want a *coordinate-free* view of linear algebra.

# Square Matrices Form a Monoid

When input and output dimensions are the *same*, the linear maps form a *monoid*:

- Multiplication: $`A \cdot B`
- Identity: $`I`

The $`n \times n` matrices over a field form the monoid $`M_n(\mathbb{R})`.

# But Different Dimensions?

What if input and output dimensions are *different*?

- A $`3 \times 2` matrix $`A : \mathbb{R}^2 \to \mathbb{R}^3`
- A $`4 \times 3` matrix $`B : \mathbb{R}^3 \to \mathbb{R}^4`

We can multiply: $`B \cdot A : \mathbb{R}^2 \to \mathbb{R}^4`

But we *cannot* multiply $`A \cdot B` — the dimensions don't match!

These don't form a monoid because multiplication can fail. So what structure do they have?

# They Form a Category!

The collection of *all* linear maps (of all dimensions) forms a *category*:

- *Objects*: Natural numbers $`0, 1, 2, 3, \ldots` (representing dimensions)
- *Morphisms*: An $`m \times n` matrix is a morphism $`n \to m`
- *Composition*: Matrix multiplication (when dimensions match)
- *Identity*: The identity matrix $`I_n : n \to n`

# What is a Category?

A *category* $`\mathcal{C}` consists of:

- A collection of *objects*
- For each pair of objects $`A, B`, a collection of *morphisms* $`A \to B`
- *Composition*: If $`f : A \to B` and $`g : B \to C`, then $`g \circ f : A \to C`
- *Identity*: For each object $`A`, an identity morphism $`\mathrm{id}_A : A \to A`

# The Category Laws

1. *Associativity*: $`(h \circ g) \circ f = h \circ (g \circ f)`

2. *Identity*: $`\mathrm{id} \circ f = f` and $`f \circ \mathrm{id} = f`

These are exactly the laws that linear map composition satisfies!

# The Opposite Category

Every category $`\mathcal{C}` has an *opposite category* $`\mathcal{C}^{\mathrm{op}}`:

- Same objects as $`\mathcal{C}`
- Morphisms are *reversed*: a morphism $`f : A \to B` in $`\mathcal{C}` becomes $`f^{\mathrm{op}} : B \to A` in $`\mathcal{C}^{\mathrm{op}}`

Composition is reversed: $`g^{\mathrm{op}} \circ f^{\mathrm{op}} = (f \circ g)^{\mathrm{op}}`

This duality is fundamental — many concepts come in pairs!

# Categories Are Everywhere

- *Sets*: Objects are sets, morphisms are functions
- *Types*: Objects are types, morphisms are functions
- *Vector spaces*: Objects are vector spaces, morphisms are linear maps
- *Groups*: Objects are groups, morphisms are group homomorphisms
- *Posets*: Objects are elements, morphism $`a \to b` exists iff $`a \leq b`

# Small Categories from Graphs

Category theory isn't just about *sets* and *functions*.

A category is any abstract structure that has *objects* and *morphisms*.

e.g. a *small category* can be generated from a directed graph:

```
    f      g
A ───→ B ───→ C
```

- Objects: $`A`, $`B`, $`C`
- Morphisms: $`f`, $`g`, $`g \circ f`, and identities

# Representing Categories

Given a small category $`\mathcal{C}`, can we *represent* it (or its opposite) using sets and functions?

Pick any object $`X` in $`\mathcal{C}`. For each object $`Y`, consider the set:

$$`\mathcal{C}[Y, X]`

For a morphism $`g : Z \to Y`, we get a function $`\mathcal{C}[Y, X] \to \mathcal{C}[Z, X]` by precomposition: $`f \mapsto f \circ g`.

This defines a functor $`\mathcal{C}[-,X] : \mathcal{C}^{\mathrm{op}} \to \mathbf{Set}`, called a *presheaf*.

# What is a Functor?

A *functor* $`F : \mathcal{C} \to \mathcal{D}` between categories consists of:

- A mapping of objects: $`X \mapsto F(X)`
- A mapping of morphisms: $`f \mapsto F(f)`

Such that:
- $`F(\mathrm{id}) = \mathrm{id}`
- $`F(g \circ f) = F(g) \circ F(f)`

Functors preserve the categorical structure!

# Cayley's Theorem for Categories

This is analogous to *Cayley's theorem* in group theory:

> Every finite group can be represented as a group of permutations.

Similarly, we can ask: can every small category be represented?

# The Yoneda Embedding

The *Yoneda embedding* $`\mathcal{Y} : \mathcal{C} \to [\mathcal{C}^{\mathrm{op}}, \mathbf{Set}]` assigns to each object $`X`:

$$`\mathcal{Y}(X) = \mathrm{Hom}(-, X)`

This functor sends each object to its "representable presheaf".

*Yoneda Lemma*: The Yoneda embedding is _fully faithful_ — every small category embeds into a category of presheaves!

# The Big Idea

Category theory provides a *unified language* for mathematics.

Instead of asking "what are the elements?", we ask:

*"What are the morphisms?"*

# Thank You

%%%
backgroundColor := some "#22C55E"
%%%

*Beneficial AI Foundation*

beneficialaifoundation.org
