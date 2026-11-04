local parsers = {
    "bash",
    "c_sharp",
    "css",
    "diff",
    "go",
    "gomod",
    "gowork",
    "gotmpl",
    "html",
    "javascript",
    "json",
    "lua",
    "markdown",
    "markdown_inline",
    "tsx",
    "typescript",
    "vim",
    "vimdoc",
}

require("nvim-treesitter").install(parsers)

-- The parser is called c_sharp while Neovim's filetype is cs.
vim.treesitter.language.register("c_sharp", "cs")

vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("UserTreesitter", { clear = true }),
    callback = function(args)
        local language = vim.treesitter.language.get_lang(args.match)
        if not language then
            return
        end

        local ok = pcall(vim.treesitter.start, args.buf, language)
        if ok then
            vim.wo[0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
            vim.wo[0].foldmethod = "expr"
        end
    end,
})
