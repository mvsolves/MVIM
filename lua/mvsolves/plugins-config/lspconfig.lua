require("mason").setup()
require('mason-lspconfig').setup {
  ensure_installed = {'tailwindcss', 'lua_ls'}
}
require("neodev").setup{}

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local on_attach = function(_, bufnr)
  -- Jump to errors
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }

  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {buffer=0})
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0})
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)

  -- Test keymap
  vim.keymap.set('n', 'gT', function()
    print("Testing to see if key mappings work")
  end, bufopts)

  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format {async = true} end, bufopts)

  -- vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})



end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}




---- Per language configurations --------

require('lspconfig').lua_ls.setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,

  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua
        -- you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },

      diagnostics = { globals = {'vim', 'opts', 'use'}, },

      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false, -- This removes the annoying 'luv' pop-up
      },

      telemetry = { enable = false, },
    }
  }
}

require('lspconfig').pyright.setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
}

require('lspconfig').clangd.setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
}

require('lspconfig').tailwindcss.setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,

  -- Path to executable
  -- cmd = {'/usr/local/bin/tailwindcss-language-server'},

  -- Find root directory based off file types
  root_dir = vim.fs.dirname(vim.fs.find({'tailwind.config.js', 'tailwind.config.ts', 'postcss.config.js', 'postcss.config.ts', 'package.json', 'node_modules', '.git'}, { upward = true })[3]),

  name = 'tailwindcss',

  tailwindCSS = {
    filetypes = { "html", "djangohtml" },
    classAttributes = { "class", "className", "classList", "ngClass" },
    lint = {
      cssConflict = "warning",
      invalidApply = "error",
      invalidConfigPath = "error",
      invalidScreen = "error",
      invalidTailwindDirective = "error",
      invalidVariant = "error",
      recommendedVariantOrder = "warning"
    },
    validate = true
  },
}
  -- Help debug per LSP??
  -- local workspace_path = vim.lsp.buf.list_workspace_folders()[1]
  -- print(workspace_path)
  -- local file_path = vim.fn.expand('%:' .. workspace_path .. ':.')
