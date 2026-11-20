# Dotfiles

Personal configuration for Zsh, Neovim, Kitty, Konsole, and tmux. The Neovim setup is
Lua-based and tailored for C#, JavaScript/TypeScript, and Go. These files are
intended for my own environment; review the settings and commands before
adapting them to yours.

## What's included

| Directory | Configuration |
| --- | --- |
| `zsh/` | Zsh startup settings, aliases, and Oh My Zsh custom scripts/plugins |
| `nvim/` | Neovim configuration and plugin lock file |
| `kitty/` | Kitty terminal settings |
| `konsole/` | Konsole profile using the KDE-provided color scheme |
| `tmux/` | tmux settings and the per-terminal session launcher |

The Neovim setup has a more detailed [getting-started guide](nvim/TUTORIAL.md).

## Requirements

- Git
- Zsh and [Oh My Zsh](https://ohmyz.sh/) for the shell configuration
- Neovim 0.12 or newer for the built-in `vim.pack` plugin manager
- Kitty or Konsole, and tmux for terminal session management

Some configured features use optional tools. Zsh enables integrations when
available, including `fzf`, `zoxide`, `bat`, `delta`, and tmux. Neovim's
Tree-sitter parsers need Git, the Tree-sitter CLI, and a C compiler. Markdown
diagram rendering uses Mermaid CLI and ImageMagick; language features and
formatting may need language servers and formatters. See
[`nvim/TUTORIAL.md`](nvim/TUTORIAL.md) for setup details.

## Installation

Clone this repository to `~/Projects/dotfiles` because the Zsh configuration
refers to that location:

```sh
git clone https://github.com/tiagosantini/dotfiles.git ~/Projects/dotfiles
cd ~/Projects/dotfiles
```

The Zsh configuration points `ZSH_CUSTOM` at `~/Projects/dotfiles/zsh/custom`.
From the repository directory, run:

```sh
./install.sh
```

The installer creates the symlinks and moves any existing targets to
timestamped `.backup-*` paths rather than overwriting them. It is safe to rerun.

Open a new shell (or run `exec zsh`) to load Zsh. Start Neovim once to download
its plugins, then restart it when prompted. Kitty, Konsole, and tmux read their
configuration on launch. The installer adds a `Dotfiles` Konsole profile;
select it in **Settings → Manage Profiles** and set it as the default if
desired. The profile inherits Konsole's KDE-provided color scheme. Set
background transparency in **Settings → Edit Current Profile → Appearance**;
Konsole stores opacity in its color scheme, so that adjustment is made in
Konsole rather than tracked separately in these dotfiles. The installer leaves
`konsolerc` alone so your other Konsole preferences remain yours.

Each new Kitty window or Konsole session starts its own tmux session
(`term-1`, `term-2`, ...); list them with `tmux ls` and reattach with
`tmux attach -t =term-N`. Existing `kitty-N` sessions are left untouched.
In tmux, press the prefix followed by `r` to reload the settings. Use the
prefix followed by `|` or `-` to create a side-by-side or stacked pane in the
current pane's directory.

## Updating

Pull repository changes with Git. Neovim plugin versions are recorded in
`nvim/nvim-pack-lock.json`; use `:packupdate` from Neovim to review and apply
plugin updates.
