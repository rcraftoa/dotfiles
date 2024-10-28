return {
  {
    "williamboman/mason.nvim",
    opts = {
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
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
      ---@type lspconfig.options
      servers = {
        lua_ls = {
          -- enabled = false,
          single_file_support = true,
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                workspaceWord = true,
                callSnippet = "Both",
              },
              misc = {
                parameters = {
                  -- "--log-level=trace",
                },
              },
              hint = {
                enable = true,
                setType = false,
                paramType = true,
                paramName = "Disable",
                semicolon = "Disable",
                arrayIndex = "Disable",
              },
              doc = {
                privateName = { "^_" },
              },
              type = {
                castNumberToInteger = true,
              },
              diagnostics = {
                disable = { "incomplete-signature-doc", "trailing-space" },
                -- enable = false,
                groupSeverity = {
                  strong = "Warning",
                  strict = "Warning",
                },
                groupFileStatus = {
                  ["ambiguity"] = "Opened",
                  ["await"] = "Opened",
                  ["codestyle"] = "None",
                  ["duplicate"] = "Opened",
                  ["global"] = "Opened",
                  ["luadoc"] = "Opened",
                  ["redefined"] = "Opened",
                  ["strict"] = "Opened",
                  ["strong"] = "Opened",
                  ["type-check"] = "Opened",
                  ["unbalanced"] = "Opened",
                  ["unused"] = "Opened",
                },
                unusedLocalExclude = { "_*" },
              },
              format = {
                enable = false,
                defaultConfig = {
                  indent_style = "space",
                  indent_size = "2",
                  continuation_indent_size = "2",
                },
              },
            },
          },
        },
      },
    },
    config = function()
      require("nvchad.configs.lspconfig").defaults()

      local lspconfig = require "lspconfig"
      local nvlsp = require "nvchad.configs.lspconfig"
      local util = require "lspconfig/util"

      local servers = {
        "html",
        "cssls",
        "clangd",
        "csharp_ls",
        "pyright",
        "tailwindcss",
        "rust_analyzer",
        "lemminx",
      }

      for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup {
          on_attach = nvlsp.on_attach,
          on_init = nvlsp.on_init,
          capabilities = nvlsp.capabilities,
        }
      end

      lspconfig.svelte.setup {}
      lspconfig.astro.setup {}

      lspconfig.denols.setup {
        on_attach = nvlsp.on_attach,
        root_dir = util.root_pattern("deno.json", "deno.jsonc"),
      }

      lspconfig.ts_ls.setup {
        on_attach = nvlsp.on_attach,
        on_init = nvlsp.on_init,
        capabilities = nvlsp.capabilities,
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
        on_attach = nvlsp.on_attach,
        cmd = cmd,
        on_new_config = function(new_config)
          new_config.cmd = cmd
        end,
      }

      lspconfig.gopls.setup {
        on_attach = nvlsp.on_attach,
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
        capabilities = nvlsp.capabilities,
        init_options = {
          html = {
            options = {
              ["bem.enabled"] = true,
            },
          },
        },
      }

      lspconfig.volar.setup {
        init_options = {
          typescript = {
            tsdk = vim.fn.stdpath "data" .. "/mason/packages/typescript-language-server/node_modules/typescript/lib/",
          },
        },
      }
    end,
  },
}
