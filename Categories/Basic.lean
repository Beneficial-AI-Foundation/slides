import VersoSlides

open VersoSlides

#doc (Slides) "Category Theory" =>

# Introduction

This tutorial covers the fundamentals of category theory.

# What is a Category?

%%%
vertical := some true
%%%

A category consists of:

- A collection of *objects*
- A collection of *morphisms* (arrows) between objects
- A composition operation for morphisms
- An identity morphism for each object

## The Category Laws

For any category, the following laws must hold:

1. *Associativity*: `(f ∘ g) ∘ h = f ∘ (g ∘ h)`
2. *Identity*: `id ∘ f = f` and `f ∘ id = f`

# Examples

%%%
vertical := some true
%%%

## The Category of Sets

Objects are sets, morphisms are functions between sets.

## The Category of Types

In programming, types form a category where morphisms are functions.

# Next Steps

- Functors
- Natural transformations
- Adjunctions
