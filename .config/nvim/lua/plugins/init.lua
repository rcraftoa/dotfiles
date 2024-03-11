return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      return require "configs.treesitter"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = function ()
      return require "configs.mason"
    end,
  },

  {
    "stevearc/conform.nvim",
    config = function()
      require "configs.conform"
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "configs.linting"
    end,
  },

  {
    "NTBBloodbath/rest.nvim",
    ft = "http",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require "configs.rest"
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
    "windwp/nvim-ts-autotag",
    lazy = true,
    event = "InsertEnter",
    config = true,
  },

  {
    "mfussenegger/nvim-dap",
    config = function()
      require "configs.dap"
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-telescope/telescope-file-browser.nvim",
    },
    cmd = "Telescope",
    opts = function()
      return require "nvchad.configs.telescope"
    end,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "telescope")
      local telescope = require "telescope"
      telescope.setup(opts)

      for _, ext in ipairs(opts.extensions_list) do
        telescope.load_extension(ext)
      end
      require "configs.telescope"
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
      require "configs.incline"
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
          require("notify").setup {
            render = "minimal",
            background_colour = "#000000",
          }
        end,
      },
    },
    config = function()
      require "configs.noice"
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      require "configs.dap-ui"
    end,
  },
}
