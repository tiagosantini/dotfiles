local opt = vim.opt

--------------------------------------------------
-- General
--------------------------------------------------

opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

opt.mouse = "a"
opt.clipboard = "unnamedplus"

opt.swapfile = false
opt.backup = false
opt.writebackup = false

opt.undofile = true

--------------------------------------------------
-- Numbers
--------------------------------------------------

opt.number = true
opt.relativenumber = true

--------------------------------------------------
-- Indentation
--------------------------------------------------

opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4

opt.smartindent = true
opt.autoindent = true

--------------------------------------------------
-- Search
--------------------------------------------------

opt.ignorecase = true
opt.smartcase = true

opt.hlsearch = true
opt.incsearch = true

--------------------------------------------------
-- Wrapping
--------------------------------------------------

opt.wrap = false

--------------------------------------------------
-- Scrolling
--------------------------------------------------

opt.scrolloff = 8
opt.sidescrolloff = 8

--------------------------------------------------
-- Splits
--------------------------------------------------

opt.splitbelow = true
opt.splitright = true

--------------------------------------------------
-- Appearance
--------------------------------------------------

opt.termguicolors = true
opt.signcolumn = "yes"

opt.cursorline = true

opt.showmode = false

opt.laststatus = 3

--------------------------------------------------
-- Completion
--------------------------------------------------

opt.completeopt = {
    "menu",
    "menuone",
    "noselect",
}

--------------------------------------------------
-- Timing
--------------------------------------------------

opt.timeoutlen = 300
opt.updatetime = 200

--------------------------------------------------
-- Folding (future LSP support)
--------------------------------------------------

opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldenable = false
