-- Disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup {
  remove_keymaps = true,

  view = {
      width = 30,
      mappings = {
        list = {
          -- { key = "u", action = "dir_up" },
          -- { key = "d", action = "dir_down" },
          -- { key = "<CR>", action = "dir_up" },
          -- { key = "d", cb = function() end },

          -- { key = "<BS>", action = "dir_down" },
          -- { key = "<CR>", action = "edit_in_place" },
          { key = "<CR>", action = "edit" },
        },
      },
    },

    actions = {
      open_file = {
        quit_on_open = true,
      },
    },

  renderer = {
    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true
      }
    },
  }
}


-- Define leader key
vim.api.nvim_set_var('d_leader', 'd/')

-- Open tree
vim.api.nvim_set_keymap('n', vim.g.d_leader .. 'a', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
