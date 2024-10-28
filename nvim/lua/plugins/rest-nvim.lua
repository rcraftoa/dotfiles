return {
  {
    "rest-nvim/rest.nvim",
    event = "BufRead",
    config = function()
      require("rest-nvim").setup {
        response = {
          decode_url = true,
          format = "true"
        },
      }
      vim.keymap.set("n", "<leader>rr", "<cmd>Rest run<CR>", { desc = "Run rest command" })
      vim.keymap.set("n", "<leader>rl", "<cmd>Rest run last<CR>", { desc = "Run last rest command" })
    end,
  },
}
