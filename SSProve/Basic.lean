import VersoSlides

open VersoSlides

set_option linter.unusedVariables false

#doc (Slides) "SSProve" =>

# SSProve

%%%
backgroundColor := some "#22C55E"
%%%

Modular Cryptographic Proofs in Coq

Beneficial AI Foundation

# The Challenge of Cryptographic Proofs

Security proofs in cryptography are:

- *Complex*: many interacting components and subtle conditions
- *Error-prone*: even published proofs contain mistakes
- *Hard to verify*: peer review catches some errors, but not all

*Example*: SSProve found an error in a published KEM-DEM composition proof!

# Why Machine-Checked Proofs?

Paper proofs rely on human verification, which is fallible.

Machine-checked proofs provide:

- *High assurance*: the computer verifies every step
- *Reproducibility*: anyone can re-run the verification
- *Precision*: no ambiguity in definitions or reasoning

*Goal*: Bridge informal cryptographic reasoning and formal verification.

# Game-Based Security Proofs

Security is defined relative to an *adversary* playing a *game*:

1. The adversary interacts with the system through *oracles*
2. The adversary tries to win (e.g., distinguish real from random)
3. *Advantage* = probability of winning minus $`\frac{1}{2}`

A scheme is *secure* if no efficient adversary has non-negligible advantage.

# Example: IND-CPA Security

The *indistinguishability under chosen-plaintext attack* game:

1. Adversary chooses two messages $`m_0, m_1`
2. Challenger encrypts $`m_b` for random bit $`b`
3. Adversary guesses which message was encrypted

*Advantage* = $`\left| P[\mathrm{correct}] - \frac{1}{2} \right|`

# The Game Hopping Technique

Proofs work by *transforming* one game into another:

```
Game₀ → Game₁ → Game₂ → ... → Gameₙ
```

Each step:
- Changes the game slightly
- Bounds the advantage difference

*Sum* the bounds to get overall security.

# What is a Package?

A *package* bundles together:

- *Code*: procedure implementations
- *State*: private memory locations
- *Export interface*: procedures provided to others
- *Import interface*: procedures called from others

Packages are the fundamental building block of SSProve.

# Package Example

An encryption package might look like:

```
Package Enc:
  State: key k
  Exports: encrypt(m), decrypt(c)
  Imports: random()
```

The package provides encryption/decryption and uses an external random oracle.

# Sequential Composition

Packages can be *linked* sequentially: $`P \circ Q`

- $`P`'s imports are satisfied by $`Q`'s exports
- Result exports $`P`'s procedures
- Result imports $`Q`'s remaining imports

*Like function composition, but for modules.*

# Sequential Composition: Example

```
   Enc           KeyGen
┌────────┐    ┌────────┐
│encrypt │───→│derive  │
│decrypt │    │        │
└────────┘    └────────┘
```

$`\mathsf{Enc} \circ \mathsf{KeyGen}`: encryption linked to key derivation.

# Parallel Composition

Packages can run *side by side*: $`P \| Q`

- Both packages run independently
- Combined exports = union of exports
- Combined imports = union of imports

*Enables building complex systems from components.*

# Parallel Composition: Example

```
┌────────────────────┐
│  ┌─────┐  ┌─────┐  │
│  │ Enc │  │ MAC │  │
│  └─────┘  └─────┘  │
└────────────────────┘
```

$`\mathsf{Enc} \| \mathsf{MAC}`: encryption and authentication in parallel.

# Algebraic Laws: Associativity

Sequential composition is *associative*:

$$`(P \circ Q) \circ R = P \circ (Q \circ R)`

Parallel composition is *associative*:

$$`(P \| Q) \| R = P \| (Q \| R)`

# Algebraic Laws: Identity and Commutativity

*Identity* packages exist:

$$`\mathsf{ID} \circ P = P = P \circ \mathsf{ID}`

Parallel composition is *commutative*:

$$`P \| Q = Q \| P`

# The Interchange Law

The key structural law:

$$`(P_1 \circ Q_1) \| (P_2 \circ Q_2) = (P_1 \| P_2) \circ (Q_1 \| Q_2)`

*Sequencing and parallelism interact predictably.*

This enables modular reasoning about complex compositions.

# State Separation

*State separation* is the key insight:

- Packages maintain *isolated* state
- They *cannot* access each other's memory
- This isolation enables modular proofs

If packages share state, reasoning becomes *much* harder.

# Validity Conditions

For composition to be valid:

- Interface signatures must match
- State locations must be compatible
- No conflicts in procedure names

SSProve proves algebraic laws hold when validity is satisfied.

# Security Games as Packages

A *security game* is just a package with specific structure:

- Exports an interface for the adversary
- Internally composes the scheme being analyzed
- *Advantage* = success difference between two games

*Example*: Real game (actual encryption) vs Ideal game (random values).

# Relational Program Logic

Need to prove two programs behave *equivalently*:

$$`\{P\}\ c_1 \sim c_2\ \{Q\}`

*Meaning*: If precondition $`P` holds, then after running both programs, postcondition $`Q` holds.

This is *probabilistic* relational Hoare logic.

# Key Rules: Reflexivity and Sampling

*Reflexivity*: Any code is equivalent to itself.

$$`\{P\}\ c \sim c\ \{P\}`

*Uniform sampling*: Fresh random values are indistinguishable.

$$`x \leftarrow \mathsf{random}() \sim y \leftarrow \mathsf{random}()`

# Key Rules: Dead Code

*Dead code elimination*: Unused computations can be removed.

```
x ← compute();    ≈    skip
(x never used)
```

This is essential for simplifying game transformations.

# Key Rules: Conditionals and Loops

*Conditional coupling*: Related if-then-else statements:

$$`\mathsf{if}\ b_1\ \mathsf{then}\ c_1\ \mathsf{else}\ d_1 \sim \mathsf{if}\ b_2\ \mathsf{then}\ c_2\ \mathsf{else}\ d_2`

*Loop invariants*: Reason about loops by finding invariants.

# The Two-Level Proof Architecture

*High level*: Algebraic manipulation of packages

- Use composition laws to restructure systems
- Modular and reusable proofs

*Low level*: Relational program logic

- Prove code equivalences
- Handle implementation details

SSProve *connects* both levels.

# What is a Monad?

A *monad* captures computational effects (state, randomness, exceptions):

- An endofunctor $`T : \mathcal{C} \to \mathcal{C}`
- A unit: $`\eta : \mathrm{Id} \Rightarrow T`
- A multiplication: $`\mu : T \circ T \Rightarrow T`

Satisfying associativity and unit laws.

# The Problem with Standard Monads

Standard monads are *endofunctors* — same category in and out.

But cryptographic code involves:
- *Finite types* (interfaces, signatures)
- *Distributions* over arbitrary types
- *State* indexed by memory locations

These live in *different* categories!

# Relative Monads

A *relative monad* generalizes monads across categories:

Given $`J : \mathcal{D} \to \mathcal{C}`, a relative monad is:
- $`T : \mathcal{D} \to \mathcal{C}` (not necessarily an endofunctor!)
- Unit: $`\eta : J \Rightarrow T`
- Bind: extends $`J(A) \to T(B)` to $`T(A) \to T(B)`

When $`J = \mathrm{Id}`, we recover standard monads.

# Relative Monads for Cryptography

In SSProve, relative monads model:

$$`\mathsf{Code} : \mathsf{Interface} \to \mathsf{Distributions}`

- *Input*: Interface category (import/export signatures)
- *Output*: Distributions over program outcomes
- *Effects*: State access, random sampling, oracle calls

The relative structure handles the category mismatch.

# Example: The Free Monad

Cryptographic code is modeled as a *free monad* over operations:

```
Code A = Pure A
       | Sample (Dist A) (A → Code B)
       | Get Loc (Val → Code A)
       | Put Loc Val (Code A)
       | Call Op Args (Ret → Code A)
```

External calls (`Call`) are *algebraic operations* — handled by linking.

# Order-Enriched Structure

SSProve uses *order-enriched* relative monads:

- Morphisms carry a partial order $`\leq`
- $`f \leq g` means "$`f` refines $`g`" or "$`f` is more defined"
- Enables reasoning: "this implementation is at least as good"

*Lax morphisms* preserve this order structure.

# Why Order Enrichment?

Order enrichment enables:

- *Approximation*: relate partial implementations
- *Refinement*: prove one game is "better" than another
- *Probability bounds*: $`P[A] \leq P[B] + \epsilon`

The relational program logic builds on this foundation.

# From Relative Monads to Packages

The categorical structure ensures soundness:

- *Sequential composition* = Kleisli composition in the relative monad
- *Monad laws* give associativity and identity for packages
- *Algebraic effects* (imports) handled via the relative structure

The math guarantees the package laws hold!

# The Semantic Picture

```
┌─────────────┐     T      ┌──────────────┐
│  Interface  │ ─────────→ │ Distributions │
│  Category   │            │   Category    │
└─────────────┘            └──────────────┘
       ↑                          ↑
       │ J                        │
       │                          │
┌─────────────┐                   │
│ Finite Types│ ──────────────────┘
└─────────────┘
```

Relative monads bridge different categorical worlds.

# Case Study: PRF Security

A *Pseudorandom Function* (PRF) is indistinguishable from random:

- *Game 0*: Adversary queries actual PRF
- *Game 1*: Adversary queries truly random function

*Advantage* bounded by distinguishing these games.

# PRF: The Proof Structure

```
┌───────────┐        ┌───────────┐
│ Real Game │   ≈    │Ideal Game │
│  ┌─────┐  │        │  ┌─────┐  │
│  │ PRF │  │        │  │Rand │  │
│  └─────┘  │        │  └─────┘  │
└───────────┘        └───────────┘
```

Security follows from the PRF assumption.

# Case Study: ElGamal Encryption

*ElGamal* is a classic public-key encryption scheme.

Security reduces to *Decisional Diffie-Hellman* (DDH):

- Given $`(g, g^a, g^b, Z)`, is $`Z = g^{ab}` or random?

DDH hardness implies ElGamal security.

# ElGamal: Game Hops

```
Real Encryption → DDH Challenge → Random Values
```

Each hop is justified by:
- Algebraic package transformations
- Relational program logic proofs

SSProve *formally verifies* this reduction.

# Case Study: KEM-DEM Composition

*Hybrid encryption*:
- *KEM*: Key Encapsulation Mechanism (public-key)
- *DEM*: Data Encapsulation Mechanism (symmetric-key)

Security *should* follow from component security...

# The KEM-DEM Error

The original paper proof had a *subtle error*!

- Discovered during SSProve formalization
- Required fixing the proof structure
- Shows value of machine-checked proofs

*Lesson*: Even peer-reviewed proofs can be wrong.

# Formalizing in Coq

SSProve is fully implemented in *Coq* (now Rocq):

- Algebraic laws proven as theorems
- Program logic rules proven sound
- Case studies machine-checked

Install: `opam install rocq-ssprove`

# What SSProve Enables

- *Catch errors* in published proofs
- *Modular proofs* reusable across protocols
- *Connect intuition* to formal guarantees
- *Verify real protocols*: TLS 1.3, MLS key schedules

# Summary: The SSProve Approach

1. Model systems as *packages* with clean interfaces
2. Compose with *algebraic operations*
3. *State separation* enables modularity
4. *Two-level proofs*: algebra + program logic
5. *Machine-checked* in Coq

# The Big Idea

SSProve makes *formal cryptographic verification* practical:

Instead of trusting paper proofs, we can *verify* them.

*"Trust, but verify"* — now with mathematical certainty.

# Thank You

%%%
backgroundColor := some "#22C55E"
%%%

*Beneficial AI Foundation*

beneficialaifoundation.org
