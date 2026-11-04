-- Re-apply after a colorscheme is loaded in the future, while keeping the
-- default Neovim colors and the terminal's background visible.
local groups = {
    "Normal",
    "NormalNC",
    "NormalFloat",
    "FloatBorder",
    "SignColumn",
    "FoldColumn",
    "EndOfBuffer",
    "LineNr",
    "CursorLine",
    "CursorLineNr",
    "StatusLine",
    "StatusLineNC",
    "Pmenu",
    "RenderMarkdownH1Bg",
    "RenderMarkdownH2Bg",
    "RenderMarkdownH3Bg",
    "RenderMarkdownH4Bg",
    "RenderMarkdownH5Bg",
    "RenderMarkdownH6Bg",
    "RenderMarkdownCode",
    "RenderMarkdownCodeBorder",
    "RenderMarkdownCodeInline",
}

local function apply()
    for _, group in ipairs(groups) do
        vim.api.nvim_set_hl(0, group, { bg = "NONE" })
    end

    vim.api.nvim_set_hl(0, "CursorLine", { bg = "NONE", underline = true })
    vim.api.nvim_set_hl(0, "PmenuSel", { bg = "NONE", bold = true, underline = true })
end

apply()
vim.api.nvim_create_autocmd("ColorScheme", { callback = apply })

return { apply = apply }
