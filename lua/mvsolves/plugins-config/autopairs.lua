local status_ok, npairs = pcall(require, "nvim-autopairs")
if not status_ok then
    return
end


-- npairs.setup({
  -- disable_filetype = {'js'},
  -- setup = function()
  -- end,
  -- map_char = '',
-- })


npairs.setup({
    -- setup = function()
    -- end;

    disable_filetype = {},

    -- rules = {},
    map_char = '',

    pairs = {
        -- ['<div>'] = '</div>',
        -- ['('] = ')',
        -- ['{'] = '}',
        -- ['['] = ']'
    },

    fast_wrap = {
        -- map = '(',
        map = '?',
        chars = {'(', ')', '{', '}', '[', ']', '<div>', '</div>'}
        -- chars = {'(', ')', '{', '}', '[', ']'}
    }
})


-- npairs.clear_rules() -- clear all rules

-- local Rule   = require'nvim-autopairs.rule'
-- local bracket = bracket_creator(opt)



-- npairs.add_rules({
  -- Rule to insert <div> tag
  -- { '"', '"', '*' },
  -- bracket("(", ")"),

  -- { "'", "'", 'html' },
  -- { '<div>', '</div>', 'html' },
  -- Rule("%w", "</%1>", { "<div[^>]*>", }, nil, 1),
-- })
