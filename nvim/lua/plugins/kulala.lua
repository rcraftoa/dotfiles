return {
	"mistweaverco/kulala.nvim",
	ft = "http",
	config = function()
		local kulala = require("kulala")
		kulala.setup({
			default_view = "body",
			default_env = "dev",
			debug = false,

			vim.api.nvim_create_autocmd("FileType", {
				pattern = "http",
				callback = function()
					local buff = tonumber(vim.fn.expand("<abuf>"), 10)
					vim.keymap.set("n", "<leader>rp", function()
						kulala.run(true)
					end, { noremap = true, buffer = buff })
				end,
			}),
			vim.keymap.set("n", "<leader>rr", kulala.run, { desc = "Run kulala" }),
			vim.keymap.set("n", "<leader>rl", kulala.toggle_view, { desc = "Toggle" }),
		})
	end,
}
