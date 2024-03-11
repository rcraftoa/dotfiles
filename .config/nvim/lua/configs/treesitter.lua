local options = {
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
    use_languagetree = true
  },

  check_ts = true,

  ts_config = {
    lua = { "string" }, -- it will not add a pair on that treesitter node
    javascript = { "template_string" },
  },

  autotag = {
    enable = true,
    enable_rename = true,
    enable_close = true,
    enable_close_on_slash = true,
  },
}

return options
