local autocmd = vim.api.nvim_create_autocmd

--------------------------------------------------
-- Highlight copied text
--------------------------------------------------

autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
})
