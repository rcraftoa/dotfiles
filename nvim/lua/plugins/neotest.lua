return {
  "nvim-neotest/neotest",
  lazy = false,
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    -- "nvim-neotest/neotest-jest",
    "marilari88/neotest-vitest",
    -- 'thenbe/neotest-playwright',
  },
  config = function()
    require("neotest").setup({
      library = { plugins = { "neotest-jest" } }, -- Example if specific plugin loading is needed, usually not required
      adapters = {
        require("neotest-vitest") {
          -- vitest_command = "npm run test:unit --", -- Custom command if needed
          -- vitest_config = "vite.config.ts", -- Custom config file if needed
          cwd = function(path)
            return vim.fn.getcwd() -- Or logic to find the project root
          end,
        }
        -- require("neotest-playwright").setup({
        --   -- playwright_command = "npm run test:e2e --", -- Custom command if needed
        --   -- playwright_config = "playwright.config.ts", -- Custom config file if needed
        --   get_playwright_command = function(path)
        --     -- Logic to determine the command based on the file path or project structure if needed
        --     return "npx playwright test"
        --   end,
        --   get_playwright_config = function(path)
        --     -- Logic to find the config file if it's not standard
        --     return "playwright.config.ts" -- Or return nil to let Playwright find it
        --   end,
        --   cwd = function(path)
        --     return vim.fn.getcwd() -- Or logic to find the project root
        --   end,
        -- }),
        -- require("neotest-jest").setup({
        --   jest_command = "npm test --", -- Custom command if needed
        --   jest_config = "jest.config.js", -- Custom config file if needed
        --   env = { CI = true },
        --   cwd = function(path)
        --     return vim.fn.getcwd() -- Or logic to find the project root based on the test file path
        --   end,
        -- }),
      },
    })
  end
}
