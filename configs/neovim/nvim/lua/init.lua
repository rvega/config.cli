-------------------------------------------------------------------------------
-- Mason installs external tools like formatters, LSPs, linters, etc.
-- I'll try to keep a list of my installed stuff here:
--     :MasonInstall clang-format prettierd

require("mason").setup()

-------------------------------------------------------------------
-- fzf-lua is a picker, searcher, etc.

require("fzf-lua").setup({
    files = {
        rg_opts = [[--color=never --hidden --files --follow -g "!.git" -g "!.cache"]],
    },
    grep = {
        rg_opts = "--column --line-number --no-heading --color=always --smart-case --max-columns=4096 --glob !tags --glob !.git --glob !.cache -e",
    },
    winopts = {
        preview = { hidden = true },
    },
})

-- <leader>t search files
vim.keymap.set("n", "<leader>t", function()
    require("fzf-lua").files({ no_ignore = false })
end, { noremap = true })

-- <leader>T search ALL files
vim.keymap.set("n", "<leader>T", function()
    require("fzf-lua").files({
        no_ignore = true,
        prompt = "All Files❯ ",
    })
end, { noremap = true })

-- <leader>R grep in ALL files
vim.keymap.set("n", "<leader>R", function()
    require("fzf-lua").grep({
        no_ignore = true,
    })
end, { noremap = true })

-- <leader>r grep in files
vim.keymap.set("n", "<leader>r", function()
    require("fzf-lua").grep({
        no_ignore = false,
    })
end, { noremap = true })

-- <leader>* search current word
vim.keymap.set("n", "<leader>*", require("fzf-lua").grep_cword, { noremap = true })

-- <leader>l buffers
vim.keymap.set("n", "<leader>l", require("fzf-lua").buffers, { noremap = true })

-- <leader>' marks  '
vim.keymap.set("n", "<leader>'", function()
    require("fzf-lua").marks({
        marks = "[a-z,A-Z]",
        winopts = { preview = { hidden = false, layout = "vertical" } },
    })
end, { noremap = true })

-- <c-x><x-f> complete file/dir
vim.keymap.set("i", "<c-x><c-f>", require("fzf-lua").complete_path, { noremap = true })

-------------------------------------------------------------------

-- Conform uses external tools to automatically format files.
-- It can also fallback to LSP formatting when needed/available.
-- see :h conform.format

require("conform").formatters.qmlformat = {
    command = "/Users/rvg/Qt/6.8.3/macos/bin/qmlformat",
    args = { "--inplace", "--indent-width", "4", "$FILENAME" },
    stdin = false,
}

require("conform").formatters.stylua = {
    prepend_args = { "--indent-width", "4", "--indent-type", "Spaces" },
}

require("conform").formatters.clang_format = {
    prepend_args = {"--style", "file", "--fallback-style", "file:/home/rvg/Cli/configs/clang-format"},
}

require("conform").setup({
    formatters_by_ft = {
        cpp = { "clang-format", lsp_format = "prefer" },
        json = { "prettierd" },
        javascript = { "prettierd" },
        html = { "prettierd" },
        markdown = { "prettierd" },
        lua = { "stylua" },
        qml = { "qmlformat" },
    },
})

-- Format a whole file with <leader>f
vim.keymap.set("n", "<leader>f", function()
    require("conform").format({ async = true })
end, { noremap = true })

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
vim.lsp.enable("clangd")
vim.lsp.enable("qmlls")

vim.lsp.config("qmlls", {
    cmd = { "/Users/rvg/Qt/6.8.3/macos/bin/qmlls" },
})

vim.keymap.set("n", "<leader>e", vim.diagnostic.setloclist)

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
        ["Folded"] = { fg = "${comment}", bg = "none" },
        ["htmlH1"] = { fg = "${red}", italic = true },
        ["Comment"] = { fg = "${comment}", italic = true },
        ["String"] = { fg = "${green}", italic = false },
        ["@string"] = { fg = "${green}", italic = false },
        ["@variable"] = { fg = "${white}" },
        ["@parameter"] = { fg = "${white}" },
        ["@property"] = { fg = bright_white },
        -- ["@property"] = {fg = "${bright_white}"},
        ["@lsp.typemod.variable.readonly.cpp"] = { fg = "${fg}" },
        Function = { fg = "${red}" },
    },
    colors = {
        bg = "#151515",
    },
    options = {
        -- transparency = true
    },
})
vim.cmd("colorscheme onedark_dark")

-------------------------------------------------------------------------------
