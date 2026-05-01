# Title: Monads (In Mathematics and Programming)

# What is a Monoid?
* Monoids: The Familiar Way - set with multiplication and identity
* Monoids as One-Object Categories - elements are morphisms, multiplication is composition
* Rephrasing with Arrows - encode identity as η : 1 → M, multiplication as μ : M × M → M
* Monoidal Categories - tensor product and unit object
* Monoid Objects in Monoidal Categories - definition in monoidal category
* Monoid Objects in Monoidal Categories: Examples - Set, Ab, Vect, Top
* Monoidal Categories as One-Object Bicategories - view (C, ⊗, I) as a one-object bicategory; monoids there are monoid objects in C
* Monoids in a Bicategory - endomorphism bicategory at X is a monoidal category; monoid on X = monoid object there
* The Monoidal Category of Endofunctors - [C, C] with composition as tensor; corresponds to one-object bicategory
* Monads as Monoid Objects - a monoid object in [C, C] is exactly a monad

# What is a Monad?
* Definition: type constructor M, pure operation, bind operation
* The three monad laws: left identity, right identity, associativity
* Example: Option - computations that might fail
* Example: List - non-deterministic computations
* Example: IO - computations with side effects

# Categorical Perspective
* Monads in category theory: endofunctor T with unit and multiplication
* Monad laws expressed categorically
* The Kleisli category: objects same as C, morphisms are Kleisli arrows
* Next steps: transformers, free monads, comonads, algebraic effects

# Thank you
