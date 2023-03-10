local actions = require "telescope.actions"

require('telescope').setup {
  defaults = {

    -- Default configuration for telescope goes here:
    -- config_key = value,
    -- file_sorter = require('telescope.sorters').get_fuzzy_file,
    color_devicons = true,
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--hidden',
    },

    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key"
      },

      n = {
        ["j"] = actions.move_selection_next,
        ["k"] = actions.move_selection_previous,
      }

    }
  },

  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker

    find_files = {
      search_dirs = {".", "~/.config/nvim" },
      hidden = true, -- show hidden files
    },

    live_grep = {
    },
  },

  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
}


-- Define leader key
vim.api.nvim_set_var('t_leader', 't/')

-- Keybindings

-- Open telescope
vim.api.nvim_set_keymap('n', vim.g.t_leader .. 'o', ':Telescope<CR>', { noremap = true, silent = true })

-- Find files
vim.api.nvim_set_keymap('n', vim.g.t_leader .. 'f', '<cmd>lua require("telescope.builtin").find_files(require("telescope.themes").get_dropdown({previewer = false}))<CR>',
  { noremap = true, silent = true }
)

-- Live grep
vim.api.nvim_set_keymap('n', vim.g.t_leader .. 'g', '<cmd>lua require("telescope.builtin").live_grep(require("telescope.themes").get_dropdown({previewer = false}))<CR>',
  { noremap = true, silent = true }
)
