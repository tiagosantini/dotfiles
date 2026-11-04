# Getting started with this Neovim setup

This is a small Lua-based Neovim configuration inspired by
[craftzdog's dotfiles](https://github.com/craftzdog/dotfiles), adapted for
Neovim 0.12+ and for C#, JavaScript/TypeScript, and Go. It keeps a simple,
transparent appearance and uses four-space indentation by default.

## What happens the first time you open Neovim

The config uses Neovim 0.12's built-in plugin manager, `vim.pack`. On the first
launch, Neovim downloads the plugins listed in `lua/config/plugins.lua` and may
ask you to confirm. Let it finish, then restart Neovim:

```vim
:restart
```

The Tree-sitter plugin also downloads parsers in the background. The first
time you open a file in a language, give it a moment to finish. Tree-sitter
parser installation requires Git, the `tree-sitter` command-line tool, and a C
compiler. Install these with the package manager for your operating system if
they are not already available.

## Install language servers

Language servers provide features such as completion, go-to-definition,
references, and diagnostics (errors and warnings). Open Neovim and run:

```vim
:Mason
```

Mason opens a tool browser. You can search for `vtsls` and `gopls` and install
them there. Or install both from Neovim's command line:

```vim
:MasonInstall vtsls gopls
```

For C#, install the Roslyn language server as a .NET global tool from a shell
with the .NET SDK available (this changes your user-level .NET tool
installation):

```sh
dotnet tool install --global roslyn-language-server --prerelease
```

Restart Neovim after installing it. The config adds `~/.dotnet/tools` to
Neovim's PATH when that directory exists. If the server command is not found,
check that the tool installed successfully and run `:checkhealth vim.lsp`.

For JS/TS, the language server works best when the project has its own
`typescript` dependency and a `tsconfig.json` or `jsconfig.json`. Formatting
uses a formatter from the project if available. In a JavaScript/TypeScript
project that wants Prettier, install it in that project, for example:

```sh
npm install --save-dev prettier
```

Go formatting uses `gofmt`, included with Go.

## Everyday shortcuts

The leader key is **Space**. Press these shortcuts in Normal mode (press
`Esc` first if you are typing into a file):

| Shortcut | What it does |
| --- | --- |
| `;f` | Find files in the current project |
| `;r` | Search text across project files (live grep) |
| `;b` | Find an open buffer (an open file in Neovim) |
| `sf` | Open the floating file browser |
| `Space w` | Save the current file |
| `Space q` | Quit the current window |
| `Space lg` | Open LazyGit in the current project |
| `Ctrl-h/j/k/l` | Move between split windows |
| `Esc` | Clear search highlighting |

In the file browser, use `h` to go to the parent directory, `Enter` to open a
file, and `q` to close the browser.

## LazyGit for VS Code users

LazyGit is a keyboard-driven Git interface. Think of it as a visual front end
for Git, similar to VS Code's **Source Control** view: your editor still edits
the files, while LazyGit helps you review changes, stage them, commit, and
sync with a remote. It does not replace Git or change the project files just
by opening it.

From Neovim, press `Space lg` in Normal mode. LazyGit opens in a terminal
window; press `q` to exit and return to Neovim. This config enables Snacks'
LazyGit integration so opening a file for editing can send you back to the
current Neovim session.

### Translate the VS Code ideas

| In VS Code | In LazyGit |
| --- | --- |
| Changed files in Source Control | The **Files** list |
| Review a file's diff | Select a file and press `Enter` |
| Stage a whole file | Select it in **Files** and press `Space` |
| Stage only part of a file | Open its diff with `Enter`, then stage hunks or lines with `Space` |
| Commit staged changes | Press `c` in the **Files** view and enter a message |
| View branch history | The **Commits** view |
| Switch branches | The **Branches** view; select a branch and press `Space` |
| Sync with the remote | `p` pulls; `P` pushes |

### A safe everyday workflow

1. **Review before staging.** In the **Files** list, select a changed file
   and press `Enter` to inspect its diff. Added lines and removed lines are
   shown separately. Press `Esc` to return to the list.
2. **Stage what belongs in this commit.** Select a file and press `Space` to
   stage the whole file. To stage only part of it, open its diff, select a
   hunk, and press `Space`. Press `a` in the diff to switch between selecting
   whole hunks and individual lines. Staged changes are like VS Code's
   “staged changes”: they are prepared for a commit but are not committed yet.
3. **Check the staged diff.** Review what you staged before committing. In a
   diff with separate staged and unstaged panes, `Tab` switches between them.
4. **Commit.** Press `c`, type a short message describing the change, then
   confirm it. Only staged changes go into this commit; unstaged edits remain
   in your working tree.
5. **Push when ready.** Press capital `P` to push the current branch to its
   remote. Lowercase `p` pulls from the branch's configured remote. In the
   **Files** view, `f` fetches remote updates without merging them into your
   current branch.

### Moving around and staying safe

- Use `j`/`k` or the arrow keys to move through a list. `[` and `]` switch
  between list tabs. Press `?` at any time to see the keys available in the
  current view; press `Esc` to close the help or cancel a dialog.
- In the **Branches** view, `n` starts creating a branch. Select a branch and
  press `Space` to check it out. If you have uncommitted edits, review or save
  them first; Git may prevent switching or ask how to handle those changes.
- Be cautious with `d` (discard) and reset options. They can remove local
  changes rather than merely unstage them. Read the confirmation prompt and
  inspect the selected file or diff before confirming. When unsure, cancel
  with `Esc` and ask Git to show the diff again.
- To leave LazyGit, press `q`. Inside Neovim this closes the LazyGit window;
  when launched from a shell, it returns to the shell.

## Finding your way around a project

### Start in the folder you want to work in

The file finder and text search start from Neovim's current working directory.
Starting Neovim in your project folder makes their results easier to navigate:

```sh
cd /path/to/my-project
nvim .
```

You can also pass the folder directly, such as `nvim /path/to/my-project`.
Inside Neovim, check the current folder with `:pwd` or change it with:

```vim
:cd /path/to/my-project
```

### Find a file by its name

Press `;f`, then type part of a file name or path. You don't need to type the
whole path: for example, `user model` can match a file under a `models` folder.
Use the arrow keys (or `Ctrl-j` and `Ctrl-k`) to move through results, then
press `Enter` to open the selected file. Press `Esc` to close the finder.

### Search inside files

Press `;r`, type a word or phrase, and the results update as you type. Choose a
match and press `Enter` to open the file at that location. This is useful when
you remember some code or text but not its file name.

### Browse folders and files

Press `sf` to open a floating browser near the current location: it shows the
current file's folder, or Neovim's working folder if no file is active. You can
also open a folder directly by passing it to Neovim, or from inside Neovim with
`:edit /path/to/folder`; the Oil browser takes over directory buffers.

In Oil:

- `Enter` opens the highlighted file or enters a highlighted folder.
- `h` goes up to the parent folder.
- `q` closes the floating browser.
- `g.` toggles hidden files, such as files whose names start with a dot.

To create, rename, or remove files from Oil, use its normal buffer-editing
actions and write the buffer with `:w` to apply the changes. Take care: writing
the buffer performs the filesystem operations. Press `g?` inside Oil for its
available actions and key bindings.

### Open files in splits

Neovim can show two files side by side. From Normal mode, use `:vsplit` to
create a vertical split or `:split` for a horizontal split; then open a file
with `:edit /path/to/file`. The existing `Ctrl-h`, `Ctrl-j`, `Ctrl-k`, and
`Ctrl-l` shortcuts move between windows. To close the current split, use
`:q` (or `Space q`).

## Coding shortcuts

When the matching server is installed and attached to the current project:

| Shortcut | What it does |
| --- | --- |
| `gd` | Go to definition |
| `gr` | Find references |
| `K` | Show documentation for the symbol under the cursor |
| `Space ca` | Show code actions |
| `Space cr` | Rename a symbol |
| `[d` / `]d` | Go to the previous / next diagnostic |
| `Space e` | Show diagnostics for the current line |

Supported files are formatted on save when a formatter is available: Lua uses
Stylua, Go uses `gofmt`, and JS/TS and common data/web files use project-local
Prettier when installed. C# formatting falls back to the Roslyn language
server when it supports formatting. To opt out temporarily, run
`:FormatDisable`; use `:FormatEnable` to turn it back on. `:FormatDisable!`
disables it globally for the current Neovim session.

## Transparent appearance

Neovim clears its normal background colors so the terminal's background can
show through. The active line is underlined instead of painted with an opaque
stripe. Neovim can make its own surfaces transparent, but the terminal or
window manager is responsible for actual window transparency and blur.
If a plugin or colorscheme later paints a solid background, the groups are
cleared again after a colorscheme loads.

## Useful checks and maintenance

Run these from Neovim's command line:

```vim
:checkhealth
:checkhealth vim.lsp
:checkhealth nvim-treesitter
:ConformInfo
:Mason
:packupdate
```

`:packupdate` shows a review buffer for plugin updates. Write that buffer to
accept the updates, or quit it to cancel. Restart Neovim afterward if needed.

If a shortcut is unfamiliar, Neovim's built-in help works too—for example,
`:help key-notation` explains how keys such as `<leader>` and `<C-h>` are
written. You can inspect configured mappings with `:map` or `:nmap`.
