-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
---@type ChadrcConfig
local M = {}

M.ui = {
	theme = "bearded-arc",

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
	},
}

M.mason = {
    pkgs = {
        "lua-language-server",
        "intelephense",
        "prettier",
        "php-cs-fixer",
        "stylua",
        "html-lsp",
        "css-lsp",
    }
}

return M
