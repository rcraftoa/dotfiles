return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    formatters_by_ft = {
      javascript = { "biome" },
      typescript = { "biome" },
      javascriptreact = { "biome" },
      typescriptreact = { "biome" },
      --[[ 
				javascript = { "eslint_d" },
				typescript = { "eslint_d" },
				javascriptreact = { "eslint_d" },
				typescriptreact = { "eslint_d" },

 ]]
      astro = { "biome" },
      svelte = { "prettier" },
      css = { "prettier" },
      html = { "biome" },
      json = { "biome" },
      yaml = { "prettier" },
      markdown = { "prettier" },
      graphql = { "prettier" },
      liquid = { "prettier" },
      lua = { "stylua" },
      python = { "isort", "black" },
      xml = { "xmlformatter" },
    },
    --[[ 
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			},
 ]]
  },
}
