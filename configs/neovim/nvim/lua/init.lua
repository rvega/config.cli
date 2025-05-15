-------------------------------------------------------------------------------
-- Mason installs external tools like formatters, LSPs, linters, etc.
-- I'll try to keep a list of my installed stuff here:
--     :MasonInstall clang-format prettierd

require('mason').setup()

-------------------------------------------------------------------

-- Conform uses external tools to automatically format files. 
-- It can also fallback to LSP formatting when needed/available. 
-- see :h conform.format

require("conform").setup({
    formatters_by_ft = {
        -- cpp = { "clang-format", lsp_format = "prefer" },
        cpp = { "clang-format" },
        json = { "prettierd" },
        javascript = { "prettierd" },
        html = { "prettierd" },
        markdown = { "prettierd" },
    },
})

-- Format a whole file with <leader>f
vim.keymap.set('n', '<leader>f', function()
    require("conform").format({ async=true })
end, { noremap=true })

-- Also use conform for formatting selections/lines with gq or gqq
vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"



-------------------------------------------------------------------------------
-- LSP Config allows easier configuration of LSP stuff. 
-- There is a lot of "hidden" functionality enabled by this. Explore more!!
--
-- https://neovim.io/doc/user/lsp.html#_lua-module:-vim.lsp.buf   <-- Create maps!!
-- https://neovim.io/doc/user/lsp.html

-- TODO: set mappings for this stuff.

-- Some stuff I should use:
-- In normal mode:
--   jump to declarations: ctrl-] ctrl-w-] 
--   :tag <thingToSearch>
--   References: grr
--   Implementation: gri
--   Hover info:  K
--   Rename: grn
--   Actions: gra
--
-- In insert mode
--   Ctrl+s inside function call parenthesis
--   Ctrl+x+o Good completion!!!!               <-- !!!!
vim.lsp.enable('clangd')

vim.keymap.set('n', '<leader>e', vim.diagnostic.setloclist)

---- Hide all semantic highlights. 
--for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
--  vim.api.nvim_set_hl(0, group, {})
--end



--------------------------------------------------------------------------------
-- Colors.
--
-- https://github.com/olimorris/onedarkpro.nvim/tree/main
--
-- Customize colors a little bit, this uses Lsp semantic highlights. 
-- Use :Inspect when cursor is over a word to see which highlight group it 
-- uses then, you can set the color of that highlight group here. 
--
-- The available colors in the theme are: bg, fg, red, orange, yellow, 
-- green, cyan, blue, purple, white, black, gray, highlight, comment, none.
--
-- Taken from [here](https://github.com/olimorris/onedarkpro.nvim/blob/main/lua/onedarkpro/themes/onedark_dark.lua)

local color_helper = require("onedarkpro.helpers")
local bright_white = color_helper.lighten("white", 10, "onedark_dark")
require("onedarkpro").setup({
    highlights = {
        ["Folded"] = {fg = "${comment}", bg="none"},
        ["htmlH1"] = {fg = "${red}", italic=true},
        ["Comment"] = {fg = "${comment}", italic=true},
        ["String"] = {fg = "${green}", italic=false},
        ["@string"] = {fg = "${green}", italic=false},
        ["@variable"] = {fg = "${white}"},
        ["@parameter"] = {fg = "${white}"},
        ["@property"] = {fg = bright_white},
        -- ["@property"] = {fg = "${bright_white}"},
        ["@lsp.typemod.variable.readonly.cpp"] = {fg = "${fg}"},
        Function = {fg = "${red}"},
    },
    colors = {
        bg = "#151515",
    },
    options = {
        -- transparency = true
    }
})
vim.cmd("colorscheme onedark_dark")


-------------------------------------------------------------------------------
