require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle Explorer" })
map("n", "<leader>i", function()
  require("rcraftzy.lsp").toggleInlayHints()
end, { desc = "Toggle Inlay Hints" })


local prefix = "<leader>t"
local opts = { noremap = true, silent = true }

map("n", prefix .. "n", function() require("neotest").run.run() end, opts)
-- Ejecutar el archivo actual
map("n", prefix .. "f", function() require("neotest").run.run(vim.fn.expand('%')) end, opts)
-- Ejecutar el último test ejecutado
map("n", prefix .. "l", function() require("neotest").run.run_last() end, opts)
-- Abrir/cerrar el resumen
map("n", prefix .. "s", function() require("neotest").summary.toggle() end, opts)
-- Ver la salida del test más cercano
map("n", prefix .. "o", function() require("neotest").output.open({ enter = true }) end, opts)
-- Detener la ejecución
map("n", prefix .. "x", function() require("neotest").run.stop() end, opts)



-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
