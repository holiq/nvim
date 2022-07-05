local actions = require("telescope.actions")
local telescope = require('telescope')

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close
      },
    },
  },
  pickers = {
    find_files = {
      theme = "dropdown",
    }
  },
  extensions = {

  }
})

vim.cmd([[
  autocmd User TelescopePreviewerLoaded setlocal wrap
]])

