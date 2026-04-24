import VersoSlides

open VersoSlides

#doc (Slides) "Monads" =>

# Introduction

This tutorial covers monads from both mathematical and programming perspectives.

# What is a Monad?

%%%
vertical := some true
%%%

A monad is a structure that combines:

- A type constructor `M`
- A `pure` operation: `a → M a`
- A `bind` operation: `M a → (a → M b) → M b`

## The Monad Laws

1. *Left identity*: `pure a >>= f = f a`
2. *Right identity*: `m >>= pure = m`
3. *Associativity*: `(m >>= f) >>= g = m >>= (λx → f x >>= g)`

# Examples in Programming

%%%
vertical := some true
%%%

## Option/Maybe

Represents computations that might fail.

## List

Represents non-deterministic computations.

## IO

Represents computations with side effects.

# Monads in Category Theory

A monad on a category C is an endofunctor `T : C → C` equipped with:

- A natural transformation `η : Id → T` (unit)
- A natural transformation `μ : T² → T` (multiplication)

# Next Steps

- Monad transformers
- Free monads
- Comonads
