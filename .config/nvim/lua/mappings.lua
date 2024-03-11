require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

map("n", "<leader>fm", function()
  require("conform").format()
end, { desc = "File Format with conform" })

map("i", "jk", "<ESC>", { desc = "Escape insert mode" })

-- Dap
map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Add breakpoint at line"})
map("n", "<leader>dr", "<cmd> DapContinue <CR>", { desc = "Run or continue debugger"})

-- Oil
map("n", "-", "<cmd> Oil <CR>", { desc = "Open parent directory"})
