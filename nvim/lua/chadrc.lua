local highlights = require "configs.highlights"

local nvdash = require "configs.nvdash"

return {
  base64 = {
		theme = "solarized_osaka",
		hl_override = highlights.override,
  },

	ui = {
		tabufline = {
			enabled = false,
		},

		transparency = true,

    nvdash = nvdash,
	},
}
