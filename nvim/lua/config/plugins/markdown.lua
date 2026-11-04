require("render-markdown").setup({
    enabled = true,
    heading = {
        -- Keep heading markers readable without requiring a Nerd Font.
        icons = { "# ", "## ", "### ", "#### ", "##### ", "###### " },
        position = "inline",
        sign = false,
    },
    code = {
        -- Render language labels, but avoid opaque code-block backgrounds.
        style = "language",
        language_icon = false,
        sign = false,
    },
    sign = { enabled = false },
})
