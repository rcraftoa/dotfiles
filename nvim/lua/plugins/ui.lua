return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      {
        "MunifTanjim/nui.nvim",
      },
    },
    config = function()
      require("noice").setup {
        lsp = {
          signature = {
            enabled = false,
          },
          hover = {
            enabled = false,
          },
          progress = {
            enabled = false,
          },
        },
      }
    end,
  },
  {
    "b0o/incline.nvim",
    event = "BufReadPre",
    priority = 1200,
    config = function()
      require("incline").setup {
        window = { margin = { vertical = 0, horizontal = 1 } },
        hide = {
          cursorline = true,
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          if vim.bo[props.buf].modified then
            filename = "[+]" .. filename
          end
          local icon, color = require("nvim-web-devicons").get_icon_color(filename)
          return { { icon, guifg = color }, { " " }, { filename } }
        end,
      }
    end,
  },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      scroll = {
        enable = false,
      },
      notifier = {
        enabled = true,
        timeout = 3000,
      },
      lazygit = {
        enabled = true,
      },
      zen = {
        enabled = true,
      },
      toggle = {
        enabled = true,
        map = vim.keymap.set,
        which_key = true,
        notify = true,
      },
      image = {
        enable = true
      }
    },
    keys = {
      {
        "<leader>lg",
        function()
          require("snacks").lazygit()
        end,
        desc = "Lazygit",
      },
      {
        "<leader>z",
        function()
          require("snacks").zen()
        end,
        desc = "Toggle Zen Mode",
      },
      {
        "<leader>Z",
        function()
          require("snacks").zen.zoom()
        end,
        desc = "Toggle Zoom",
      },
    },
  },
  {
    "grapp-dev/nui-components.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
  },
}
