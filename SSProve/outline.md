# Title: SSProve (Modular Cryptographic Proofs in Coq)

# Motivation
* The challenge of cryptographic proofs: complex, error-prone, hard to verify
* Why machine-checked proofs: high assurance, reproducibility, precision
* Game-based security proofs: adversary plays a game, advantage measures success
* Example: IND-CPA security
* The game hopping technique: transform games, bound advantage differences

# Packages
* What is a package: code, state, export/import interfaces
* Package example: encryption package
* Sequential composition: linking packages
* Sequential composition example
* Parallel composition: running packages side by side
* Parallel composition example
* Algebraic laws: associativity, identity, commutativity
* The interchange law
* State separation: isolated state enables modular proofs
* Validity conditions for composition

# Proving Security
* Security games as packages
* Relational program logic: proving two programs behave equivalently
* Key rules: reflexivity and sampling
* Key rules: dead code elimination
* Key rules: conditionals and loops
* Two-level proof architecture: algebraic manipulation + program logic

# Categorical Foundations
* What is a monad
* The problem with standard monads: cryptographic code spans different categories
* Relative monads: generalize monads across categories via J: D → C
* Relative monads for cryptography: Code : Interface → Distributions
* The free monad over operations
* Order-enriched structure: enables refinement and probability bounds
* Why order enrichment matters
* From relative monads to packages: sequential composition = Kleisli composition
* The semantic picture

# Case Studies
* PRF security: real game vs ideal game
* PRF proof structure
* ElGamal encryption: reduction to DDH
* ElGamal game hops
* KEM-DEM composition
* The KEM-DEM error: SSProve found a bug in published proof!
* Formalizing in Coq
* What SSProve enables
* Summary: the SSProve approach
* The big idea

# Thank you
