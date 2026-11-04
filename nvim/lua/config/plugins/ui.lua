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

-- Keep familiar automatic pair insertion, without changing other mappings.
require("mini.pairs").setup()
