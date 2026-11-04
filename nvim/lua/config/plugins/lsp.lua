require("mason").setup()

-- Roslyn's global .NET tool installs here. Add the location when present so
-- the language server can be found without changing the user's shell config.
local dotnet_tools = vim.fn.expand("~/.dotnet/tools")
if vim.fn.isdirectory(dotnet_tools) == 1 then
    vim.env.PATH = dotnet_tools .. ":" .. vim.env.PATH
end

vim.diagnostic.config({
    severity_sort = true,
    virtual_text = { spacing = 3, source = "if_many" },
    float = { border = "rounded", source = "if_many" },
})

vim.lsp.config("gopls", {
    settings = {
        gopls = {
            gofumpt = false,
            staticcheck = true,
        },
    },
})

vim.lsp.config("vtsls", {})
vim.lsp.config("roslyn_ls", {})
vim.lsp.enable({ "gopls", "vtsls" })

-- Roslyn is installed separately as a .NET tool; don't start a missing server.
if vim.fn.executable("roslyn-language-server") == 1 then
    vim.lsp.enable("roslyn_ls")
end

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspKeymaps", { clear = true }),
    callback = function(args)
        local map = function(lhs, rhs, description)
            vim.keymap.set("n", lhs, rhs, { buffer = args.buf, desc = description })
        end

        map("gd", vim.lsp.buf.definition, "Go to definition")
        map("gr", vim.lsp.buf.references, "Find references")
        map("K", vim.lsp.buf.hover, "Show documentation")
        map("<leader>ca", vim.lsp.buf.code_action, "Code action")
        map("<leader>cr", vim.lsp.buf.rename, "Rename symbol")
        map("<leader>e", vim.diagnostic.open_float, "Show line diagnostics")
        map("[d", function()
            vim.diagnostic.jump({ count = -1, float = true })
        end, "Previous diagnostic")
        map("]d", function()
            vim.diagnostic.jump({ count = 1, float = true })
        end, "Next diagnostic")
    end,
})
