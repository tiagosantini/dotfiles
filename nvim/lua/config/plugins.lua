-- Neovim 0.12 includes its own plugin manager. New plugins are downloaded
-- the first time this file is loaded; restart Neovim after that first install.
vim.pack.add({
    { src = "https://github.com/nvim-mini/mini.icons" },
    { src = "https://github.com/folke/snacks.nvim" },
    { src = "https://github.com/stevearc/oil.nvim" },
    { src = "https://github.com/lewis6991/gitsigns.nvim" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("^1") },
    { src = "https://github.com/stevearc/conform.nvim" },
    { src = "https://github.com/nvim-mini/mini.pairs" },
})

require("config.plugins.ui")
require("config.plugins.treesitter")
require("config.plugins.editor")
require("config.plugins.lsp")
