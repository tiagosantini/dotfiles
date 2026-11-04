require("blink.cmp").setup({
    keymap = { preset = "default" },
    appearance = { nerd_font_variant = "mono" },
    completion = {
        documentation = { auto_show = true, auto_show_delay_ms = 300 },
        menu = { border = "rounded" },
    },
    signature = { enabled = true },
})

require("conform").setup({
    formatters_by_ft = {
        lua = { "stylua" },
        go = { "gofmt" },
        javascript = { "prettierd", "prettier", stop_after_first = true },
        javascriptreact = { "prettierd", "prettier", stop_after_first = true },
        typescript = { "prettierd", "prettier", stop_after_first = true },
        typescriptreact = { "prettierd", "prettier", stop_after_first = true },
        json = { "prettierd", "prettier", stop_after_first = true },
        html = { "prettierd", "prettier", stop_after_first = true },
        css = { "prettierd", "prettier", stop_after_first = true },
        markdown = { "prettierd", "prettier", stop_after_first = true },
        yaml = { "prettierd", "prettier", stop_after_first = true },
    },
    format_on_save = function(bufnr)
        local filetype = vim.bo[bufnr].filetype
        local supported = {
            lua = true,
            go = true,
            javascript = true,
            javascriptreact = true,
            typescript = true,
            typescriptreact = true,
            json = true,
            html = true,
            css = true,
            markdown = true,
            yaml = true,
            cs = true,
        }

        if supported[filetype] and not vim.g.disable_autoformat and not vim.b[bufnr].disable_autoformat then
            return { timeout_ms = 1000, lsp_format = "fallback" }
        end
    end,
    notify_no_formatters = false,
})

vim.api.nvim_create_user_command("FormatDisable", function(args)
    vim.b.disable_autoformat = true
    if args.bang then
        vim.g.disable_autoformat = true
    end
end, { desc = "Disable format-on-save for this buffer (or all buffers with !) ", bang = true })

vim.api.nvim_create_user_command("FormatEnable", function()
    vim.b.disable_autoformat = false
    vim.g.disable_autoformat = false
end, { desc = "Enable format-on-save" })
