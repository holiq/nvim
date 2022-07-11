local actions = require("telescope.actions")
local telescope = require("telescope")

local options = {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--trim",
      "--hidden",
      "--no-ignore",
    },
    prompt_prefix = "   ",
    selection_caret = " > ",
    entry_prefix = " • ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "vertical",
    layout_config = {
      horizontal = {
        prompt_position = "bottom",
        preview_width = 0.4,
        results_width = 0.6,
      },
      vertical = {
        mirror = false,
        prompt_position = "bottom",
        preview_height = 0.4,
        results_height = 0.6,
      },
      width = 0.9,
      height = 0.80,
      preview_cutoff = 1, -- horizontal 80
    },
    file_sorter = require("telescope.sorters").get_fuzzy_file,
    file_ignore_patterns = { "node_modules", ".git" },
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    path_display = { "smart" },
    winblend = 0,
    border = true,
    borderchars = {
      { "—", "|", "—", "|", "+", "+", "+", "+" },
      prompt = { "—", "|", "—", "|", "+", "+", "+", "+" },
      results = { "—", "|", "—", "|", "+", "+", "+", "+" },
      preview = { "—", "|", "—", "|", "+", "+", "+", "+" },
    },
    -- borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    previewer = false,
    prompt_title = false,
    results_title = false,
    preview_title = false,
    dynamic_preview_title = false,
    color_devicons = true,
    hidden_files = true,
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<esc>"] = actions.close,
      },
    },
  },

  extensions_list = { "themes", "terms" },
  extensions = {
    project = {
      hidden_files = false, -- default: false
      theme = "dropdown",
      display_type = 'full'
    }
  }
}

telescope.setup(options)
telescope.load_extension('project')

vim.cmd([[
  autocmd User TelescopePreviewerLoaded setlocal wrap
]])
