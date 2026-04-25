---
name: refine
description: Update slides based on changes to outline.md files
---

Check for changes to outline files and update slides accordingly:

1. Run `git diff <Tutorial>/outline.md` for each tutorial directory to see what changed
2. Update the corresponding `<Tutorial>/Basic.lean` slides to reflect the changes
3. Rebuild with `lake build tutorialsMain && .lake/build/bin/tutorialsMain`
4. If the title or subtitle changed, also update the `postProcessSlides` call in `Main.lean`
