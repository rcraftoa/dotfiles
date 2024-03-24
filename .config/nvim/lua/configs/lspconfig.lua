local configs = require("nvchad.configs.lspconfig")

local on_attach = configs.on_attach
local on_init = configs.on_init
local capabilities = configs.capabilities

local util = require "lspconfig/util"

local lspconfig = require "lspconfig"

local servers = {
  "html",
  "cssls",
  "clangd",
  "svelte",
  "svelte",
  "pyright",
  "tailwindcss",
  "rust_analyzer",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_init = on_init,
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.astro.setup {}

lspconfig.denols.setup {
  on_attach = on_attach,
  root_dir = util.root_pattern("deno.json", "deno.jsonc"),
}

lspconfig.tsserver.setup {
  on_attach = on_attach,
  root_dir = util.root_pattern "package.json",
  single_file_support = false,
}

local install_path = vim.fn.stdpath "data" .. "/mason/packages/angular-language-server/node_modules"
local ang = install_path .. "/@angular/language-server/node_modules"
local cmd = {
  "ngserver",
  "--stdio",
  "--tsProbeLocations",
  install_path,
  "--ngProbeLocations",
  ang,
}

lspconfig.angularls.setup {
  on_attach = on_attach,
  cmd = cmd,
  on_new_config = function(new_config)
    new_config.cmd = cmd
  end,
}

lspconfig.gopls.setup {
  on_attach = on_attach,
  cmd = { "gopls", "serve" },
  filetypes = { "go", "gomod" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
}

lspconfig.emmet_ls.setup {
  capabilities = capabilities,
  init_options = {
    html = {
      options = {
        ["bem.enabled"] = true,
      },
    },
  },
}
