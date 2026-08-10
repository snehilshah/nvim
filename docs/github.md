# GitHub

Issues, pull requests, reviews and notifications, without leaving nvim. Plugin is
[octo.nvim](https://github.com/pwntester/octo.nvim), config in `lua/plugins/git.lua`.

Everything runs through the `gh` CLI you already use in the terminal. Same login,
same repo detection. Nothing new to authenticate.

---

## Keys

All under `<Space> g h` — "git hub".

| Use case                     | Keymap          |
| ---------------------------- | --------------- |
| List pull requests           | `<Space> g h p` |
| List issues                  | `<Space> g h i` |
| Notifications                | `<Space> g h n` |
| Create a PR from this branch | `<Space> g h c` |
| Create an issue              | `<Space> g h I` |
| Review a PR                  | `<Space> g h r` |
| Search GitHub                | `<Space> g h s` |

Pickers are fzf-lua, same as everywhere else.

`:Octo` on its own lists every command it has. There are a lot — that list is the
practical way to find one, rather than memorising.

## Inside an Octo buffer

An issue or PR opens as an ordinary buffer you can edit. Write in it, then save
with `:w` to push the change to GitHub.

Actions are on `<localleader>`, which is `\` here since nothing else claims it.
So `\ c a` adds a comment, `\ l a` adds a label, `\ v a` adds a reviewer.

`<CR>` in normal mode shows the actions available on the thing under your cursor.
Use that instead of learning the table.

## Reviewing a PR

`<Space> g h r` opens a review in its own tabpage: a file panel on the left, the
diff on the right. Leave comments on lines, then submit the whole review at once.

The diff here is **not** CodeDiff. Octo builds the review with nvim's own diff
windows, and there is no setting to swap in another renderer.

In practice that is close. Your `diffopt` has `inline:char`, so changed
characters are highlighted inside changed lines. What you lose against `<Space>
d d` is moved-block detection and compact folding.

If you want CodeDiff's rendering for a PR, do it separately:

```text
<Space> d m          diff against origin/main
<Space> d M          diff against a branch you type
```

Read the code in CodeDiff, write the comments in Octo. They do not talk to each
other, and nothing breaks by using both.

## Neogit

Unaffected. Neogit's only GitHub feature was opening a browser tab to the compare
page. `<Space> g h c` replaces that with creating the PR in nvim. Both still work.

`<Space> g n` stays what it was.

---

## Fixing

### Wrong GitHub account

Octo uses whichever `gh` account is active in the current shell. Check and switch:

```sh
gh auth status
gh auth switch
```

### `Octo` says the repo is not found

`gh` could not resolve the remote. Confirm from the same directory:

```sh
gh repo view
```

### Projects v2 commands do nothing

The config enables Projects v2 and deliberately keeps the missing-scope warning.
If the active token does not have `read:project`, add it with:

```sh
gh auth refresh -s read:project
```

### Nothing happens on `<Space> g h p`

Rate limit or network. `gh api rate_limit` will say.
