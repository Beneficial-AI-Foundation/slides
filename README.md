# Tutorials

Slide presentations built with [Lean Verso Slides](https://github.com/leanprover/verso-slides).

## Live Site

- [Categories](https://beneficial-ai-foundation.github.io/tutorials/categories/) — Category theory
- [Monads](https://beneficial-ai-foundation.github.io/tutorials/monads/) — Monads
- [Double Categories](https://beneficial-ai-foundation.github.io/tutorials/double/) — Double categories
- [SSProve](https://beneficial-ai-foundation.github.io/tutorials/ssprove/) — Cryptographic proofs

## Prerequisites

- [Lean 4](https://lean-lang.org/lean4/doc/setup.html) (via elan)
- Python 3 (for local server)

## Quick Start

```bash
# Build and serve (runs on http://localhost:8000)
./scripts/build-slides.sh
```

## Build Instructions

```bash
# Fetch dependencies
lake update

# Build the project
lake build tutorialsMain

# Generate slides
.lake/build/bin/tutorialsMain

# Serve locally
python3 -m http.server -d _site 8000
```

The generated slides will be in the `_site/` directory.

## Tutorials

- [Categories](http://localhost:8000/categories) — Introduction to category theory
- [Monads](http://localhost:8000/monads) — Monads in math and programming
- [Double Categories](http://localhost:8000/double) — Categories internal to Cat
- [SSProve](http://localhost:8000/ssprove) — Modular cryptographic proofs in Coq

## Project Structure

```
├── Categories/
│   └── Basic.lean           # Category theory slides
├── Monads/
│   └── Basic.lean           # Monads slides
├── Double/
│   └── Basic.lean           # Double categories slides
├── SSProve/
│   └── Basic.lean           # SSProve slides
├── Main.lean                # Executable that generates all slides
├── lakefile.lean            # Lake build configuration
├── lean-toolchain           # Specifies Lean version
└── scripts/
    └── build-slides.sh      # Build and serve script
```

## Writing Slides

Slides use the `#doc (Slides)` syntax:

```lean
import VersoSlides
open VersoSlides

#doc (Slides) "My Presentation" =>

# First Slide

Content here.

# Second Slide

More content.
```

### Slide Syntax

- `#` — Creates horizontal slides
- `##` — Creates subsections (vertical slides when `vertical := some true`)
- `_text_` — Emphasis
- `*text*` — Bold
- `` `code` `` — Inline code
- `$...$` — Inline math (KaTeX)
- `$$...$$` — Display math

### Vertical Slides

```lean
# Section Title

%%%
vertical := some true
%%%

First vertical slide.

## Second Vertical Slide

Navigate down to see this.
```

### Fragments (Incremental Reveal)

```lean
:::fragment
This appears on click.
:::

:::fragment fadeUp
This fades up on next click.
:::
```

### Speaker Notes

```lean
:::notes
These notes are visible in speaker view (press S).
:::
```

### Lean Code Blocks

Fenced Lean code is syntax-highlighted with hover support:

~~~lean
```lean
def factorial : Nat → Nat
  | 0 => 1
  | n + 1 => (n + 1) * factorial n
```
~~~

## Navigation

- Arrow keys or click to navigate
- `O` — Overview mode
- `S` — Speaker view
- `F` — Fullscreen
- `Esc` — Exit overview/fullscreen
