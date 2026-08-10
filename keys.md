# Git Keymaps

## Daily Git

| Use case                               | Keymap              |
| -------------------------------------- | ------------------- |
| Open Neogit                            | `<Space> g n`       |
| Show Neogit help                       | `?`                 |
| Refresh Neogit                         | `<Ctrl-r>`          |
| Review selected change in CodeDiff     | `d d`               |
| Toggle side-by-side / inline diff      | `t`                 |
| Collapse / expand unchanged regions    | `g c`               |
| Open next changed file in CodeDiff     | `] f`               |
| Open previous changed file in CodeDiff | `[ f`               |
| Close CodeDiff or Neogit               | `q`                 |
| Stage selected change                  | `s`                 |
| Unstage selected change                | `u`                 |
| Stage all changes                      | `S`                 |
| Commit staged changes                  | `c c`               |
| Submit commit message                  | `<Ctrl-c> <Ctrl-c>` |
| Push to upstream                       | `P u`               |
| Open GitHub PR creation page           | `b o`               |
| Discard selected change                | `x`                 |

## Remotes

| Use case                                       | Keymap   |
| ---------------------------------------------- | -------- |
| Fetch upstream                                 | `f u`    |
| Fetch upstream and prune stale remote branches | `f -p u` |
| Pull from upstream                             | `p u`    |
| Pull only when fast-forward is possible        | `p -f u` |
| Force-with-lease push after a rebase           | `P -f u` |

## Branches and Worktrees

| Use case                                       | Keymap |
| ---------------------------------------------- | ------ |
| Open branch actions                            | `b`    |
| Create a branch without switching to it        | `b n`  |
| Create a task branch and its worktree          | `w W`  |
| Create a worktree for an existing local branch | `w w`  |
| Change Neogit's directory to another worktree  | `w g`  |
| Remove a linked worktree                       | `w D`  |
| Delete a local or remote branch                | `b D`  |

## Updating a Task Branch

| Use case                                    | Keymap                    |
| ------------------------------------------- | ------------------------- |
| Rebase current branch onto `main`           | `r e`, then select `main` |
| Continue a rebase after resolving conflicts | `r r`                     |
| Abort an active rebase                      | `r a`                     |
| Merge `main` into current branch            | `m m`, then select `main` |
| Abort an active merge                       | `m a`                     |

## Stashes

| Use case                                  | Keymap   |
| ----------------------------------------- | -------- |
| Stash staged and unstaged tracked changes | `Z z`    |
| Stash changes including untracked files   | `Z -u z` |
| List stashes                              | `Z l`    |
| Pop a stash                               | `Z p`    |
| Apply a stash without removing it         | `Z a`    |
| Delete a stash                            | `Z d`    |

## Concepts

| Concept              | Meaning                                                                                    |
| -------------------- | ------------------------------------------------------------------------------------------ |
| Container directory  | `nitro-api/` holds the worktree folders; it is not the Git working directory.              |
| Main worktree        | `nitro-api-main/` stays clean, remains on `main`, and is never removed.                    |
| Task worktree        | A sibling folder named `nitro-api-<task>` where one task branch is developed.              |
| Worktree             | Another working folder connected to the same Git repository.                               |
| Branch per worktree  | One local branch can be checked out in only one worktree at a time.                        |
| Shared data          | Worktrees share commits, branches, remotes, configuration, and stashes.                    |
| Separate data        | Each worktree has its own files, staged changes, and checked-out branch.                   |
| `main`               | Your local `main` branch.                                                                  |
| `origin/main`        | Your last fetched view of GitHub's `main` branch.                                          |
| Fetch                | Updates `origin/...` information without changing working files.                           |
| Pull                 | Fetches and then integrates the upstream branch into the current branch.                   |
| Upstream             | The remote branch used by default for pull and push.                                       |
| Fast-forward         | Updates a branch without creating a merge commit or rewriting history.                     |
| Rebase               | Replays your commits on newer `main`; use for a private task branch.                       |
| Merge                | Brings `main` into the task without rewriting commits; use for a shared branch.            |
| Force with lease     | Safely replaces a previously pushed rebased branch unless the remote unexpectedly changed. |
| Prune                | Removes stale `origin/...` references; it does not delete local branches.                  |
| Clean worktree       | No staged, unstaged, or untracked changes.                                                 |
| Remove worktree      | Removes the linked task folder but keeps its local branch and shared stashes.              |
| Delete local branch  | Separate cleanup after its worktree has been removed.                                      |
| Delete remote branch | Removes the GitHub branch for everyone; separate from local deletion.                      |
| Shared stash         | A stash made in one worktree is visible from every other worktree.                         |
