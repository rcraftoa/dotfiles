require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

map("n", "<leader>fm", function()
  require("conform").format()
end, { desc = "File Format with conform" })

map("i", "jk", "<ESC>", { desc = "Escape insert mode" })

-- Telescope
map("n", "<leader>fP", 
  function()
    require("telescope.builtin").find_files ({
      cwd = "~/dotfiles/.config/nvim/lua/",
    })
  end, { desc = "Find Plugin File" }
)
map("n", "sf",
  function()
    local telescope = require "telescope"

    local function telescope_buffer_dir()
      return vim.fn.expand "%:p:h"
    end

    telescope.extensions.file_browser.file_browser {
      path = "%:p:h",
      cwd = telescope_buffer_dir(),
      respect_gitignore = false,
      hidden = true,
      grouped = true,
      previewer = false,
      initial_mode = "normal",
      layout_config = { height = 40 },
    }
  end, { desc = "Open File Browser with the path of the current buffer" }
)
