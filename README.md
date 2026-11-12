# Dotfiles

Personal configuration for Zsh, Neovim, Kitty, and tmux. The Neovim setup is
Lua-based and tailored for C#, JavaScript/TypeScript, and Go. These files are
intended for my own environment; review the settings and commands before
adapting them to yours.

## What's included

| Directory | Configuration |
| --- | --- |
| `zsh/` | Zsh startup settings, aliases, and Oh My Zsh custom scripts/plugins |
| `nvim/` | Neovim configuration and plugin lock file |
| `kitty/` | Kitty terminal settings |
| `tmux/` | tmux settings (including terminal graphics passthrough) |

The Neovim setup has a more detailed [getting-started guide](nvim/TUTORIAL.md).

## Requirements

- Git
- Zsh and [Oh My Zsh](https://ohmyz.sh/) for the shell configuration
- Neovim 0.12 or newer for the built-in `vim.pack` plugin manager
- Kitty and tmux for their respective configurations

Some configured features use optional tools. Zsh enables integrations when
available, including `fzf`, `zoxide`, `bat`, `delta`, and tmux. Neovim's
Tree-sitter parsers need Git, the Tree-sitter CLI, and a C compiler. Markdown
diagram rendering uses Mermaid CLI and ImageMagick; language features and
formatting may need language servers and formatters. See
[`nvim/TUTORIAL.md`](nvim/TUTORIAL.md) for setup details.

## Installation

Clone this repository to `~/dotfiles` because the Zsh configuration refers to
that location:

```sh
git clone https://github.com/tiagosantini/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

The Zsh configuration points `ZSH_CUSTOM` at `~/dotfiles/zsh/custom`. From the
repository directory, run:

```sh
./install.sh
```

The installer creates the symlinks and moves any existing targets to
timestamped `.backup-*` paths rather than overwriting them. It is safe to rerun.

Open a new shell (or run `exec zsh`) to load Zsh. Start Neovim once to download
its plugins, then restart it when prompted. Kitty and tmux read their
configuration on launch. In tmux, press the prefix followed by `r` to reload
the settings. Use the prefix followed by `|` or `-` to create a side-by-side
or stacked pane in the current pane's directory.

## Updating

Pull repository changes with Git. Neovim plugin versions are recorded in
`nvim/nvim-pack-lock.json`; use `:packupdate` from Neovim to review and apply
plugin updates.
