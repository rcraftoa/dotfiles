return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		{
			"MunifTanjim/nui.nvim",
		},
	},
	config = function()
		require("configs.noice")
	end,
}
