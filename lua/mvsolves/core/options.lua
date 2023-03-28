-- Nvim setup
vim.opt.showcmd = false -- hide the commands
vim.opt.showmode = false -- hide the --INSERT--
vim.opt.cmdheight = 1

vim.opt.timeoutlen = 300 -- for mapping delays,
vim.opt.ttimeoutlen = 0 -- used for key code delays

-- The autocmds automatically save and update buffer if changes made externally
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

-- Set tab space for lua
vim.cmd('autocmd FileType lua setlocal tabstop=2 shiftwidth=2 softtabstop=2')

-- Set tab space for markdown
vim.cmd('autocmd FileType markdown setlocal tabstop=4 shiftwidth=4 softtabstop=4')
vim.cmd('autocmd FileType vimwiki setlocal tabstop=4 shiftwidth=4 softtabstop=4')
