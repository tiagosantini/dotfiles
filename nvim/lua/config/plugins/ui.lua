require("mini.icons").setup()
require("mini.icons").mock_nvim_web_devicons()

require("snacks").setup({
    picker = {
        enabled = true,
        sources = {
            files = { hidden = true },
            grep = { hidden = true },
        },
    },
    indent = { enabled = true },
    notifier = { enabled = true },
    lazygit = { enabled = true, configure = true },
})

require("oil").setup({
    default_file_explorer = true,
    columns = { "icon", "permissions", "size" },
    keymaps = {
        ["h"] = "actions.parent",
        ["q"] = "actions.close",
    },
    view_options = { show_hidden = true },
    float = {
        border = "rounded",
        win_options = { winblend = 0 },
    },
})

require("gitsigns").setup()

require("oil-git").setup({
    show_file_highlights = true,
    show_directory_highlights = true,
    show_file_symbols = true,
    show_directory_symbols = true,
    symbol_position = "eol",
})

-- Oil-Git invalidates its status cache when a terminal exits. Refresh every
-- loaded Oil buffer afterward, including ones that were not the active window.
vim.api.nvim_create_autocmd("TermClose", {
    group = vim.api.nvim_create_augroup("UserOilGitRefresh", { clear = true }),
    callback = function()
        vim.schedule(function()
            for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
                if
                    vim.api.nvim_buf_is_valid(bufnr)
                    and vim.api.nvim_buf_is_loaded(bufnr)
                    and vim.bo[bufnr].filetype == "oil"
                then
                    vim.api.nvim_buf_call(bufnr, function()
                        require("oil-git").refresh()
                    end)
                end
            end
        end)
    end,
})

require("scrollbar").setup({
    handlers = { gitsigns = true },
})

-- Keep familiar automatic pair insertion, without changing other mappings.
require("mini.pairs").setup()
