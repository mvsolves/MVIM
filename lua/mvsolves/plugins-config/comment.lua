require('Comment').setup()

local ft = require('Comment.ft')

-- Set both line and block commentstring
ft.set('javascriptreact', {'//%s', '{/*%s*/}'})
