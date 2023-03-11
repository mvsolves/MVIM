local cmd = vim.cmd
local opt = vim.opt

-- Colorscheme
-- vim.cmd('colorscheme afterglow')
cmd('colorscheme hybrid')

-- Line number
opt.number = true -- enable line number
cmd('highlight LineNr ctermfg=black ctermbg=grey')
opt.numberwidth = 4 -- tighten the line number width

function updateColorScheme()
  if vim.bo.filetype == 'vimwiki' then
    cmd('colorscheme purify')
  else
    cmd('colorscheme hybrid')
    opt.number = true -- enable line number
    cmd('highlight LineNr ctermfg=black ctermbg=grey')
    opt.numberwidth = 4 -- tighten the line number width
  end
end

cmd('autocmd BufEnter * lua updateColorScheme()')
