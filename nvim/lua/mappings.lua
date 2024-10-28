require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle Explorer" })
map("n", "<leader>i", function()
  require("rcraftzy.lsp").toggleInlayHints()
end)

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
