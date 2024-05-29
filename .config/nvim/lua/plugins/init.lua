return {

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
		"vhyrro/luarocks.nvim",
		priority = 1000,
		config = true,
		opts = {
			rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua" },
		},
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
		"hrsh7th/nvim-cmp",
		dependencies = {
			{
				"Exafunction/codeium.nvim",
				cmd = "Codeium",
				build = ":Codeium Auth",
				opts = {},
			},
			"luckasRanarison/tailwind-tools.nvim",
			"onsails/lspkind-nvim",
		},
		opts = function(_, opts)
			table.insert(opts.sources, 1, {
				name = "codeium",
				group_index = 1,
				priority = 100,
			})
		end,
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
		"jpmcb/nvim-llama",
		cmd = { "Llama" },
		config = true,
	},
}
