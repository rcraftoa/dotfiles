return {
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = { "BufReadPost", "BufNewFile" },
    enabled = true,
    opts = { mode = "cursor", max_lines = 3 },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "vue",
        "astro",
        "svelte",
        "json",
        "jsonc",
        "yaml",
        "python",
        "c",
        "markdown",
        "markdown_inline",
      },

      indent = {
        enable = true,
      },

      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
        use_languagetree = true,
      },

      check_ts = true,

      ts_config = {
        lua = { "string" }, -- it will not add a pair on that treesitter node
        javascript = { "template_string" },
      },

      autotag = {
        enable = true,
        -- enable_rename = true,
        enable_close = true,
        enable_close_on_slash = true,
      },

      lang = {
        astro = "<!-- %s -->",
        c = "// %s",
        cpp = "// %s",
        css = "/* %s */",
        cue = "// %s",
        c_sharp = "// %s",
        gleam = "// %s",
        glimmer = "{{! %s }}",
        handlebars = "{{! %s }}",
        hcl = "# %s",
        html = "<!-- %s -->",
        ini = "; %s",
        javascript = {
          "// %s", -- default commentstring when no treesitter node matches
          "/* %s */",
          call_expression = "// %s", -- specific commentstring for call_expression
          jsx_attribute = "// %s",
          jsx_element = "{/* %s */}",
          jsx_fragment = "{/* %s */}",
          spread_element = "// %s",
          statement_block = "// %s",
        },
        lua = { "-- %s", "--- %s" }, -- langs can have multiple commentstrings
        php = "// %s",
        rego = "# %s",
        rescript = "// %s",
        rust = { "// %s", "/* %s */", "/// %s" },
        svelte = "<!-- %s -->",
        terraform = "# %s",
        tsx = {
          "// %s", -- default commentstring when no treesitter node matches
          "/* %s */",
          call_expression = "// %s", -- specific commentstring for call_expression
          jsx_attribute = "// %s",
          jsx_element = "{/* %s */}",
          jsx_fragment = "{/* %s */}",
          spread_element = "// %s",
          statement_block = "// %s",
        },
        twig = "{# %s #}",
        typescript = "// %s",
        vim = '" %s',
        vue = "<!-- %s -->",
      },
    },
  },
}
