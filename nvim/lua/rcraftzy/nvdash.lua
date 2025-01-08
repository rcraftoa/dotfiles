local headers = require "rcraftzy.headers"

local get_header = function()
  return headers[math.random(1, #headers)]
end

return {
  load_on_startup = true,

  header = get_header(),

  buttons = {
    { txt = "  Find File", keys = "Spc f f", cmd = "Telescope find_files" },
    { txt = "  Recent Files", keys = "Spc f o", cmd = "Telescope oldfiles" },
    { txt = "  Config", keys = "Spc f P", cmd = ":lua require('telescope.builtin').find_files ({ cwd = '~/dotfiles/nvim/lua/', })"},
    -- more... check nvconfig.lua file for full list of buttons
  },
}
