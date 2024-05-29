local M = {}

local highlights = require "configs.highlights"
local nvdash = require "configs.nvdash"

M.ui = {
  theme = "solarized_osaka",

  tabufline = {
    enabled = false,
  },

  hl_override = highlights.override,

  transparency = true,
--[[ 
  statusline = {
    theme = "vscode_colored"
  },
 ]]
  nvdash = nvdash,
}

return M
