local highlights = require "configs.highlights"

local nvdash = require "configs.nvdash"

return {
	ui = {
		theme = "solarized_osaka",

		tabufline = {
			enabled = false,
		},

		hl_override = highlights.override,

		transparency = true,

    nvdash = nvdash,
	},
}
