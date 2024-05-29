require("nvchad.options")

local autocmd = vim.api.nvim_create_autocmd

-- add yours here!
vim.opt.relativenumber = true

vim.opt.shell = "fish"

-- vim.opt.laststatus = 0
vim.opt.scrolloff = 10
vim.opt.wrap = false

autocmd("LspAttach", {
	callback = function(args)
		vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
	end,
})

local global = {
	random_header = true,
}

for name, value in pairs(global) do
	vim.g[name] = value
end
