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

-- Set to true to re-enable Mermaid image rendering through diagram.nvim.
local enable_mermaid_rendering = false

if enable_mermaid_rendering then
-- diagram.nvim uses image.nvim to display rendered diagrams in the buffer.
require("image").setup({
    backend = "sixel",
    processor = "magick_cli",
    debug = {
        enabled = true,
        level = "debug",
        file_path = vim.fn.stdpath("cache") .. "/image.nvim.log",
        format = "compact",
    },
    integrations = {
        -- Mermaid blocks are handled by diagram.nvim; don't also render regular
        -- Markdown image links here as part of this feature.
        markdown = { enabled = false },
    },
})

local chromium
for _, executable in ipairs({ "chromium", "chromium-browser", "google-chrome", "google-chrome-stable" }) do
    chromium = vim.fn.exepath(executable)
    if chromium ~= "" then
        break
    end
end

local renderer_options = {}
if chromium and chromium ~= "" then
    -- Mermaid CLI uses Puppeteer; point it at the system browser instead of
    -- requiring Puppeteer's separately downloaded Chrome.
    local puppeteer_config = vim.fn.stdpath("cache") .. "/mermaid-puppeteer.json"
    vim.fn.mkdir(vim.fn.stdpath("cache"), "p")
    vim.fn.writefile({ vim.json.encode({ executablePath = chromium }) }, puppeteer_config)
    renderer_options.mermaid = {
        cli_args = { "--puppeteerConfigFile", puppeteer_config },
    }
end

require("diagram").setup({
    -- Avoid spawning a Mermaid render on every keystroke; refresh when leaving
    -- insert mode or entering the Markdown window.
    events = {
        render_buffer = { "InsertLeave", "BufWinEnter" },
    },
    integrations = {
        require("diagram.integrations.markdown"),
    },
    renderer_options = renderer_options,
})
end
