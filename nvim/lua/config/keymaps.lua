local map = vim.keymap.set

vim.g.mapleader = " "
vim.g.maplocalleader = " "

--------------------------------------------------
-- Better window navigation
--------------------------------------------------

map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

--------------------------------------------------
-- Clear search highlight
--------------------------------------------------

map("n", "<Esc>", "<cmd>nohlsearch<CR>")

--------------------------------------------------
-- Save
--------------------------------------------------

map("n", "<leader>w", "<cmd>w<CR>")

--------------------------------------------------
-- Quit
--------------------------------------------------

map("n", "<leader>q", "<cmd>q<CR>")

--------------------------------------------------
-- Plugin shortcuts
--------------------------------------------------

map("n", ";f", function()
    require("snacks").picker.files()
end, { desc = "Find files" })

map("n", ";r", function()
    require("snacks").picker.grep()
end, { desc = "Search in files" })

map("n", ";b", function()
    require("snacks").picker.buffers()
end, { desc = "Find open buffers" })

map("n", "sf", function()
    require("oil").open_float(nil, { preview = {} })
end, { desc = "Browse files" })

map("n", "<leader>lg", function()
    require("snacks").lazygit()
end, { desc = "Open LazyGit" })
