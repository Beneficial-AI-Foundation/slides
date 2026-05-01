# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Important Guidelines

- **Do NOT commit or push** without explicit user request. Wait for the user to say "commit", "push", or use `/push` before running any git commit/push commands.

## Build Commands

```bash
# Build and serve locally (runs on http://localhost:8000)
./scripts/build-slides.sh

# Or manually:
lake build tutorialsMain          # Build the executable
.lake/build/bin/tutorialsMain     # Generate slides to _site/
python3 -m http.server -d _site 8000  # Serve locally
```

## Architecture

This project generates reveal.js slide presentations using [verso-slides](https://github.com/leanprover/verso-slides).

### Slide Content
- `Categories/Basic.lean` — Category theory slides
- `Monads/Basic.lean` — Monads slides
- `SSProve/Basic.lean` — SSProve cryptographic proofs slides
- `Double/Basic.lean` — Double categories slides
- Slides use `#doc (Slides) "Title" =>` syntax with markdown-like content

### Build Pipeline
1. `Main.lean` calls `slidesMain` for each tutorial to generate HTML
2. `postProcessSlides` transforms the HTML:
   - Injects `static/custom.css` for BAIF branding
   - Adds logo headers to content slides
   - Transforms title/thank-you slides to special layout (logo on top, green band below)
   - Inlines hover data for offline viewing

### Adding a New Tutorial
1. Create `NewTopic/Basic.lean` with `#doc (Slides)` content
2. Add `lean_lib NewTopic` to `lakefile.lean`
3. Import in `Main.lean` and add `slidesMain` + `postProcessSlides` call
4. **Important**: The title/subtitle in `postProcessSlides` must exactly match the slide content for transformation to work
5. Update `README.md`:
   - Add to "Live Site" section with the GitHub Pages URL
   - Add to "Tutorials" section with localhost URL
   - Add to "Project Structure" tree
6. Update `.github/workflows/pages.yml`:
   - Add a new `<li>` entry in the "Create index page" step with title, link, and description

### Title Slide Format
Title and thank-you slides use the `state` attribute:
```lean
# Slide Title

%%%
state := some "title-slide"
%%%

Subtitle text

Beneficial AI Foundation
```

Section dividers use:
```lean
# Section Name

%%%
state := some "section-divider"
%%%

Subtitle text
```

The `postProcessSlides` function transforms `data-state="title-slide"` sections into the special layout with logo and green band.

## Custom Commands

### /refine
When the user says `/refine`, check for changes to outline files and update slides accordingly:
1. Run `git diff <Tutorial>/outline.md` to see what changed
2. Update the corresponding `<Tutorial>/Basic.lean` slides to reflect the changes
3. Rebuild with `lake build tutorialsMain && .lake/build/bin/tutorialsMain`
4. If the title or subtitle changed, also update the `postProcessSlides` call in `Main.lean`
