return {
	{
		"folke/twilight.nvim",
	},
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

		"echasnovski/mini.animate",
		event = "VeryLazy",
		opts = function(_, opts)
			opts.scroll = {
				enable = false,
			}
		end,
	},
	{
		"folke/ts-comments.nvim",
		opts = {},
		event = "VeryLazy",
		enabled = vim.fn.has("nvim-0.10.0") == 1,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function()
			return require("configs.treesitter")
		end,
	},

	{
		"williamboman/mason.nvim",
		opts = function()
			return require("configs.mason")
		end,
	},

	{
		"neovim/nvim-lspconfig",
		opts = {
			inlay_hints = { enabled = true },
		},
		config = function()
			require("nvchad.configs.lspconfig").defaults()
			require("configs.lspconfig")
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			require("nvchad.configs.nvimtree")
			require("configs.nvim-tree")
		end,
	},
	{
		"sveltejs/language-tools",
		config = function()
			require("configs.lspconfig").svelte.setup()
		end,
	},

	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("configs.linting")
		end,
	},

	{
		"mg979/vim-visual-multi",
		event = "BufRead",
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

	-- UI/UX
	{
		"craftzdog/solarized-osaka.nvim",
		lazy = true,
		priority = 1000,
		opts = function()
			return {
				transparent = true,
			}
		end,
	},
	{
		"b0o/incline.nvim",
		event = "BufReadPre",
		priority = 1200,
		dependencies = { "craftzdog/solarized-osaka.nvim" },
		config = function()
			require("configs.incline")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		event = { "BufReadPost", "BufNewFile" },
		enabled = true,
		opts = { mode = "cursor", max_lines = 3 },
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			{
				"MunifTanjim/nui.nvim",
			},
			{
				"rcarriga/nvim-notify",
				config = function()
					require("notify").setup({
						render = "minimal",
						background_colour = "#000000",
					})
				end,
			},
		},
		config = function()
			require("configs.noice")
		end,
	},
	{
		"j-hui/fidget.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("fidget").setup({})
		end,
	},
	{
		"grapp-dev/nui-components.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
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
