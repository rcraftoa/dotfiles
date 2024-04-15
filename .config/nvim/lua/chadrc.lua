local M = {}

M.ui = {
  theme = "solarized_osaka",

  tabufline = {
    enabled = false,
  },

  transparency = true,

  statusline = {
    theme = "vscode_colored"
  },

  nvdash = {
    load_on_startup = true,

    header = {
      "     ▄▄         ▄ ▄▄▄▄▄▄▄    ",
      "   ▄▀███▄     ▄██ █████▀     ",
      "   ██▄▀███▄   ███            ",
      "   ███  ▀███▄ ███            ",
      "   ███    ▀██ ███            ",
      "   ███      ▀ ███            ",
      "   ▀██ █████▄▀█▀▄██████▄     ",
      "     ▀ ▀▀▀▀▀▀▀ ▀▀▀▀▀▀▀▀▀▀    ",
    },

    buttons = {
      { "  Find File", "Spc f f", "Telescope find_files" },
      { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
      { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
      { "  Bookmarks", "Spc m a", "Telescope marks" },
      { "  Themes", "Spc t h", "Telescope themes" },
      { "  Mappings", "Spc c h", "NvCheatsheet" },
      --[[
      function()
        local stats = require("lazy").stats()
        local plugins = "  Loaded " .. stats.count .. " plugins in "
        local time = math.floor(stats.startuptime) .. " ms  "
        return plugins .. time
      end,
 ]]
    },
  },
}

return M
