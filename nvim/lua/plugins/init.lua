return {
	{
		"folke/twilight.nvim",
	},

  { import = "nvchad.blink.lazyspec" },
  { "folke/which-key.nvim", enabled = false },

	{
		"toppair/peek.nvim",
		event = { "VeryLazy" },
		build = "deno task --quiet build:fast",
		config = function()
			require("peek").setup()
			vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
			vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
		end,
	},
	{
		"OXY2DEV/markview.nvim",
		ft = "markdown",
		config = function()
			require("markview").setup()
		end,
	},
	{
		"folke/ts-comments.nvim",
		opts = {},
		event = "VeryLazy",
		enabled = vim.fn.has("nvim-0.10.0") == 1,
	},

	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			require("nvchad.configs.nvimtree")
			require("configs.nvim-tree")
		end,
	},

	{
		"axelvc/template-string.nvim",
		lazy = true,
		event = { "BufReadPre" },
		config = true,
	},
	{
		"stevearc/oil.nvim",
		cmd = { "Oil" },
		config = true,
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-telescope/telescope-file-browser.nvim",
		},
		keys = { "sf", "<leader>fP" },
		opts = function()
			return require("nvchad.configs.telescope")
		end,
		config = function(_, opts)
			dofile(vim.g.base46_cache .. "telescope")
			local telescope = require("telescope")
			telescope.setup(opts)

			for _, ext in ipairs(opts.extensions_list) do
				telescope.load_extension(ext)
			end
			require("configs.telescope")
		end,
	},

	{
		"tris203/precognition.nvim",
		event = "VeryLazy",
		config = {
			startVisible = false,
			showBlankVirtLine = true,
			highlightColor = { link = "Comment" },
			hints = {
				Caret = { text = "^", prio = 2 },
				Dollar = { text = "$", prio = 1 },
				MatchingPair = { text = "%", prio = 5 },
				Zero = { text = "0", prio = 1 },
				w = { text = "w", prio = 10 },
				b = { text = "b", prio = 9 },
				e = { text = "e", prio = 8 },
				W = { text = "W", prio = 7 },
				B = { text = "B", prio = 6 },
				E = { text = "E", prio = 5 },
			},
			gutterHints = {
				G = { text = "G", prio = 10 },
				gg = { text = "gg", prio = 9 },
				PrevParagraph = { text = "{", prio = 8 },
				NextParagraph = { text = "}", prio = 8 },
			},
		},
	},
}
