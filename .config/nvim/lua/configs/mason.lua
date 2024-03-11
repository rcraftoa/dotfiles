local options = {
	ensure_installed = {
		-- lua stuff
		"lua-language-server",

		-- web dev stuff
		"css-lsp",
		"html-lsp",
		"typescript-language-server",
		"deno",
		"vue-language-server",
		"emmet-ls",
		"json-lsp",
		"tailwindcss-language-server",

		"gopls",

		"shfmt",
		"shellcheck",
		"codespell",

		-- linting
		"eslint_d",
		-- formatting
		"black",
		"isort",
		"prettier",
		"stylua",
		"pylint",
	},
}

return options
