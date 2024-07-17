return {
	"epwalsh/obsidian.nvim",
  cmd = { "Obsidian", 'ObsidianNew', 'ObsidianFollowLink', 'ObsidianToggleCheckbox', 'ObsidianTemplate' },
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("configs.obsidian")
	end,
}
