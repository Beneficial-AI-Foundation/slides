0. Title page

1. The Idea: Categories All the Way Down
- We know categories have objects and morphisms
- What if the "collection of objects" and "collection of morphisms" are themselves categories?
- This leads to richer structure: double categories
- Goal: understand double categories as "categories internal to Cat"

2. Internal Categories: The General Pattern
- An internal category in a category A (with pullbacks) consists of:
  - Object of objects: $C_0 \in A$
  - Object of morphisms: $C_1 \in A$
  - Source and target: $s, t : C_1 \to C_0$
  - Identity: $e : C_0 \to C_1$
  - Composition: $c : C_1 \times_{C_0} C_1 \to C_1$ (pullback!)
- These satisfy the usual category axioms (associativity, identity laws)

3. Category Internal to Set = Small Category
- Let $A = \mathbf{Set}$
- $C_0$ is a set of objects
- $C_1$ is a set of morphisms
- $s, t, e, c$ are functions
- This is exactly the definition of a small category!
- Example: finite groups, finite posets

4. Category Internal to Cat = Double Category
- Now let $A = \mathbf{Cat}$
- $C_0$ is a category (objects and vertical morphisms)
- $C_1$ is a category (horizontal morphisms and 2-cells)
- $s, t, e, c$ are functors
- This gives us a double category!

5. The Four Components of a Double Category
- Objects: the objects of $C_0$
- Vertical morphisms: the morphisms of $C_0$ (form a category)
- Horizontal morphisms: the objects of $C_1$ (form a category)
- 2-cells (squares): the morphisms of $C_1$
- Draw the picture of a square with objects at corners, morphisms on edges

6. Visualizing 2-Cells as Squares
- A 2-cell has four boundaries:
  - Top: horizontal morphism $f : A \to B$
  - Bottom: horizontal morphism $g : C \to D$
  - Left: vertical morphism $u : A \to C$
  - Right: vertical morphism $v : B \to D$
- The 2-cell $\alpha$ "fills" the square
- We write $\alpha : (f, g, u, v)$ or draw the commutative-looking square

7. Composition in Double Categories
- Vertical composition: compose squares vertically (stacking)
- Horizontal composition: compose squares horizontally (side by side)
- Both must satisfy associativity and identity laws
- The interchange law: $(α ∘_v β) ∘_h (γ ∘_v δ) = (α ∘_h γ) ∘_v (β ∘_h δ)$
- This makes the structure coherent

8. Example: The Double Category of Squares
- Start with any category $C$
- Objects: objects of $C$
- Horizontal morphisms: morphisms of $C$
- Vertical morphisms: morphisms of $C$
- 2-cells: commutative squares in $C$
- This is the simplest double category: $\mathbf{Sq}(C)$

9. Example: The Double Category of Spans
- Objects: objects of a category $C$ (with pullbacks)
- Horizontal morphisms: spans $A \leftarrow X \rightarrow B$
- Vertical morphisms: morphisms of $C$
- 2-cells: commutative diagrams connecting spans
- Composition of spans uses pullbacks
- This is $\mathbf{Span}(C)$

10. Example: The Double Category of Profunctors
- Objects: small categories
- Horizontal morphisms: profunctors $P : A^{op} \times B \to \mathbf{Set}$
- Vertical morphisms: functors
- 2-cells: natural transformations with functorial boundaries
- This is $\mathbf{Prof}$, fundamental in categorical logic

11. Why Double Categories?
- 2-categories only have one kind of morphism
- Double categories have two: horizontal and vertical
- This models situations with two different "directions" of transformation
- Examples: spaces vs paths, types vs terms, syntax vs semantics

12. Monads in a Double Category
- In a 2-category, a monad on $A$ is: $T : A \to A$, $\eta : 1 \Rightarrow T$, $\mu : T^2 \Rightarrow T$
- In a double category, we have a choice: horizontal or vertical monads
- A horizontal monad: a monad in the horizontal 2-category
- The 2-cells provide a richer notion of monad morphism

13. The Key Insight: Categories as Monads in Span
- Consider $\mathbf{Span}(\mathbf{Set})$
- A monad here consists of:
  - An object $C_0$ (set of objects)
  - A horizontal endomorphism: span $C_0 \leftarrow C_1 \rightarrow C_0$ (morphisms with source/target)
  - Unit and multiplication satisfying monad laws
- This is exactly a small category!
- Categories ARE monads in the double category of spans

14. Why Monads in Double Categories Beat Bicategories
- In a bicategory, monad morphisms are too restrictive
- They require commuting with the monad structure strictly
- In a double category, vertical morphisms give "lax" monad morphisms
- These correspond to functors between categories (in Span)
- The double category perspective is more natural

15. Monads in Prof: Enriched Categories
- A monad in $\mathbf{Prof}$ on a category $A$ is a monoid in profunctors
- This is an identity-on-objects functor $A \to A$ with extra structure
- Special case: a monad in $\mathbf{Prof}$ on a discrete category is a small category
- Monads in Prof generalize enrichment

16. Example: Polynomial Monads
- Objects: sets
- Horizontal morphisms: polynomial functors $\sum_{a:A} X^{B_a}$
- Monads here are polynomial monads
- These include: lists, trees, and many data structures
- Connection to containers and species

17. Bimodules: Generalizing Monads
- A monad is a monoid in the category of endomorphisms
- What about morphisms *between* monads on different objects?
- Given monads $S$ on $A$ and $T$ on $B$, an $(S,T)$-bimodule is:
  - A horizontal morphism $M : A \to B$
  - A left $S$-action: $S \circ M \to M$
  - A right $T$-action: $M \circ T \to M$
  - Satisfying associativity and unit laws
- Bimodules are the "intertwiners" between monads

18. Bimodules in Span: Profunctors!
- Categories are monads in $\mathbf{Span}(\mathbf{Set})$
- What are bimodules between categories in Span?
- An $(C,D)$-bimodule is a span $C_0 \leftarrow M \rightarrow D_0$ with:
  - Left action: composition with morphisms of $C$
  - Right action: composition with morphisms of $D$
- This is exactly a profunctor (distributor) $C^{op} \times D \to \mathbf{Set}$!
- Profunctors ARE bimodules between categories

19. The Double Category of Monads
- Given a double category $\mathbb{D}$, form $\mathbf{Mnd}(\mathbb{D})$:
  - Objects: monads in $\mathbb{D}$
  - Vertical morphisms: monad morphisms (lax)
  - Horizontal morphisms: bimodules
  - 2-cells: bimodule morphisms
- This is itself a double category!
- For $\mathbf{Span}(\mathbf{Set})$: $\mathbf{Mnd}(\mathbf{Span}) \simeq \mathbf{Prof}$

20. Why Bimodules Matter
- Functors preserve structure strictly
- Profunctors/bimodules allow "heteromorphisms" between objects
- Example: a profunctor $P : C \to D$ assigns to each $(c,d)$ a set $P(c,d)$
- This generalizes Hom: $\mathrm{Hom}_C(-,-) : C^{op} \times C \to \mathbf{Set}$
- Bimodules give the "right" notion of morphism between monads

21. The Eilenberg-Moore Double Category
- Given a double category $\mathbb{D}$ and a horizontal monad $T$
- We can form $\mathbf{EM}(T)$: the Eilenberg-Moore double category
- Objects: $T$-algebras
- This generalizes the usual Eilenberg-Moore category construction

22. Double Functors and Double Natural Transformations
- A double functor preserves all four kinds of structure
- A double natural transformation has components that are 2-cells
- These form the morphisms of a 2-category of double categories
- Rich structure for studying relationships between double categories

23. Summary: The Double Category Perspective
- Double categories = categories internal to Cat
- Four components: objects, horizontal/vertical morphisms, 2-cells
- Key examples: Sq(C), Span, Prof
- Monads in double categories generalize ordinary monads
- Categories are monads in Span: a unifying perspective

