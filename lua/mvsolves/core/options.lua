-- Disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Nvim setup
vim.cmd('syntax on')
-- vim.cmd('colorscheme materialbox')
vim.cmd('colorscheme jellybeans')

vim.opt.number = true -- enable line number
vim.cmd('highlight LineNr ctermfg=black ctermbg=grey')
vim.opt.numberwidth = 4 -- tighten the line number width

vim.opt.showcmd = false -- hide the commands
vim.opt.showmode = false -- hide the --INSERT--
vim.opt.cmdheight = 1

vim.opt.timeoutlen = 1000 -- for mapping delays,
vim.opt.ttimeoutlen = 0 -- used for key code delays

vim.cmd("autocmd BufWinLeave * silent! mkview!")
vim.cmd("autocmd BufWinEnter * silent! loadview")

-- Rename tmux window to current file. Rename to 'zsh' when quitting vim
vim.cmd([[autocmd BufEnter * silent execute "!tmux rename-window " . expand("%:t")]])
vim.cmd([[autocmd VimLeave * call system("tmux rename-window zsh")]])

-- Changes colorscheme only on .css file extensions
-- vim.cmd('BufReadPost *.css colorscheme default')

-- Turns ejs files to follow the html syntax
vim.cmd('au BufNewFile,BufRead *.ejs set filetype=html')

-- Contains MV custom snippets
vim.cmd('source $HOME/.snippets/snippets.vim')

-- Vimwiki plugin setup
vim.g.vimwiki_list = { { path = '~/Documents/vimwiki', syntax = 'markdown', ext = '.md' } }

-- Emmet-vim setup
vim.g.user_emmet_install_global = 0
vim.cmd([[autocmd FileType html,css EmmetInstall]])
