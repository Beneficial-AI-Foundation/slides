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

Commit and push all changes immediately without asking for review:

1. Run `git status`, `git diff --stat`, and `git log --oneline -3` in parallel
2. Stage all modified files with `git add`
3. Create a commit with a descriptive message following the repo's style
4. Push to the remote with `git push`
5. Report the commit hash and confirmation

Do NOT ask for permission or review before running git commands - execute everything directly and report the result at the end.
