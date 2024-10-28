-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "onedark",
  transparency = true,

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },

  hl_add = {
    InclineNormal = { bg = "pink", fg = "one_bg" },
    InclineNormalNC = { bg = "dark_purple", fg = "one_bg2" },
  },
}

M.ui = {
  cmp = {
    icons_left = true,
    format_colors = {
      tailwind = true,
    },
  },

  tabufline = {
    enabled = false,
  },
}

M.nvdash = require "rcraftzy.nvdash"

return M
