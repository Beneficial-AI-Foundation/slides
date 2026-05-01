---
name: push
description: Commit all changes and push to remote
allowed-commands:
  - git status
  - git diff
  - git log
  - git add
  - git commit
  - git push
---

Commit and push all changes:

1. Run `git status` to see changed files
2. Run `git diff --stat` to summarize changes
3. Run `git log --oneline -3` to see recent commit style
4. Stage all modified files with `git add`
5. Create a commit with a descriptive message following the repo's style
6. Push to the remote with `git push`
7. Report the commit hash and confirmation

Do NOT ask for permission before running git commands - execute them directly.
