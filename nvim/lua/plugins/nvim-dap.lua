return {
  "mfussenegger/nvim-dap",
  lazy = false,
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",

    "stevearc/overseer.nvim",

    "jbyuki/one-small-step-for-vimkind",

    -- NOTE: for Go.
    -- "leoluz/nvim-dap-go",
  },
  config = function()
    require("configs.dap")
  end,
}
