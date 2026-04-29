0. Title page

1. The Challenge of Cryptographic Proofs
- Security proofs in cryptography are complex, error-prone, and hard to verify
- Paper proofs often contain subtle errors that go unnoticed (e.g., KEM-DEM proof error found by SSProve)
- Machine-checked proofs provide high assurance but are traditionally difficult to construct
- Goal: bridge the gap between informal cryptographic reasoning and formal verification

2. Game-Based Security Proofs
- Security is defined relative to an adversary playing a "game"
- The adversary interacts with the cryptographic system through oracles (interfaces)
- Example: IND-CPA game - adversary tries to distinguish real encryption from random
- Security is measured by "advantage" - the probability of winning minus 1/2
- A scheme is secure if no efficient adversary has non-negligible advantage

3. The Game Hopping Technique
- Proofs work by transforming one game into another
- Each step (hop) changes the game slightly while bounding the advantage difference
- Eventually reach a game where the adversary clearly cannot win
- Sum up the advantage bounds to get the overall security bound
- Problem: keeping track of all the changes and ensuring they're valid

4. What is a Package?
- A package bundles together code, state, and interfaces
- Export interface: procedures the package provides to others
- Import interface: procedures the package calls from others
- Internal state: memory locations private to the package
- Example: An encryption package exports encrypt/decrypt, imports a random oracle

5. Package Composition: Sequential Linking
- Packages can be composed sequentially: $P \circ Q$ (P linked with Q)
- P's imports are satisfied by Q's exports
- The composed package has P's exports and Q's remaining imports
- Like function composition, but for entire modules
- Example: Linking an encryption scheme to a key derivation function

6. Package Composition: Parallel
- Packages can be composed in parallel: $P \| Q$
- Both packages run side by side with disjoint interfaces
- Combined package has exports and imports from both
- Enables building complex systems from independent components
- Example: Running encryption and authentication in parallel

7. Algebraic Laws for Packages
- Sequential composition is associative: $(P \circ Q) \circ R = P \circ (Q \circ R)$
- Parallel composition is associative and commutative: $P \| Q = Q \| P$
- Identity packages exist: $\mathsf{ID} \circ P = P$
- Interchange law: $(P_1 \circ Q_1) \| (P_2 \circ Q_2) = (P_1 \| P_2) \circ (Q_1 \| Q_2)$
- These laws enable modular reasoning about composed systems

8. State Separation: The Key Insight
- Packages maintain isolated state - they cannot access each other's memory
- This separation is crucial for modular security proofs
- If packages share state, reasoning becomes much harder
- SSProve proves the algebraic laws hold even when packages share state (within limits)
- Validity conditions ensure proper interface matching and location compatibility

9. Defining Security Games as Packages
- A security game is just a package with specific structure
- The game exports an interface for the adversary to interact with
- Internal packages represent the scheme being analyzed
- Advantage = difference in adversary's success between two games
- Example: Real game (uses actual encryption) vs Ideal game (uses random values)

10. Relational Program Logic
- Need to prove two programs (games) behave "the same" or "almost the same"
- Relational Hoare logic reasons about pairs of program executions
- Key judgment: $\{P\}\ c_1 \sim c_2\ \{Q\}$ - if precondition P holds, then postcondition Q holds after running both
- Rules for sampling, sequencing, conditionals, loops
- Probabilistic reasoning: bound probability of distinguishing two distributions

11. Key Rules of the Program Logic
- Reflexivity: any code is equivalent to itself
- Uniform sampling: fresh random values are indistinguishable
- Dead code: unused computations can be eliminated
- Conditional coupling: if-then-else can be related when branches correspond
- Loop invariants: reason about loops by finding invariants
- These rules handle the low-level details of cryptographic proofs

12. The Two-Level Proof Architecture
- High level: use algebraic laws to manipulate package compositions
- Low level: use relational program logic for code equivalences
- High-level proofs are modular and reusable
- Low-level proofs handle implementation details
- SSProve connects both levels in a unified framework

13. Relative Monads: The Semantic Foundation
- Standard monads capture computational effects (state, randomness, exceptions)
- A monad is an endofunctor $T : C \to C$ with unit and multiplication
- But SSProve needs monads between *different* categories (e.g., types to distributions)
- A relative monad generalizes: $T : J \to C$ where $J : D \to C$ is a functor
- Example: the distribution monad takes finite types to distributions over arbitrary types

14. Why Relative Monads for Cryptography?
- Cryptographic code has effects: state access, random sampling, oracle calls
- These effects don't fit a standard monad on a single category
- Relative monads let us model: $\mathsf{Code} : \mathsf{Interface} \to \mathsf{Distributions}$
- The "interface" category captures import/export signatures
- The "distributions" category captures probabilistic semantics

15. Order-Enriched Relative Monads
- SSProve uses *order-enriched* relative monads
- Morphisms carry a partial order (approximation, refinement)
- This enables reasoning about "one program is at least as good as another"
- Lax morphisms preserve the order structure
- Foundation for the relational program logic and package laws

16. From Relative Monads to Packages
- Packages are modeled using the relative monad structure
- Sequential composition corresponds to Kleisli composition
- The monad laws give associativity and identity laws for packages
- Algebraic effects (imports) are handled via the relative structure
- This categorical foundation ensures the package laws are sound

17. Case Study: PRF Security
- A Pseudorandom Function (PRF) is indistinguishable from a truly random function
- Game 0: Real - adversary queries actual PRF
- Game 1: Ideal - adversary queries random function
- Advantage bounded by distinguishing the two
- Example of a simple but foundational security proof

18. Case Study: ElGamal Encryption
- ElGamal is a classic public-key encryption scheme
- Security reduces to the Decisional Diffie-Hellman (DDH) assumption
- Game hops: Real encryption → DDH challenge → Random values
- SSProve formally verifies this reduction
- Shows how algebraic assumptions integrate with the framework

19. Case Study: KEM-DEM Composition
- Hybrid encryption: Key Encapsulation Mechanism + Data Encapsulation Mechanism
- Security should follow from individual component security
- Original paper proof had a subtle error - discovered during formalization!
- SSProve mechanizes the corrected proof
- Demonstrates value of machine-checked proofs

20. Formalizing in Coq
- SSProve is fully implemented in Coq (now Rocq)
- Algebraic laws are proven as theorems
- Program logic rules are proven sound
- Case studies are machine-checked
- Available as opam package: rocq-ssprove

21. Why SSProve Matters
- Catches errors in published proofs (KEM-DEM example)
- Modular proofs can be reused across different protocols
- Connects informal cryptographic intuition to formal guarantees
- Makes high-assurance cryptography more practical
- Foundation for verifying real-world protocols (TLS, MLS)

22. Summary: The SSProve Approach
- Model cryptographic systems as packages with clean interfaces
- Compose packages using well-defined algebraic operations
- State separation enables modular reasoning
- Two-level proofs: algebraic laws + relational program logic
- Machine-checked in Coq for high assurance

