require('nvim-ts-autotag').setup({
  filetypes = { "html" , "xml", "javascriptreact", "jsx", "markdown" },
  skip_tags = {
  'area', 'base', 'br', 'col', 'command', 'embed', 'hr', 'img', 'slot',
  'input', 'keygen', 'link', 'meta', 'param', 'source', 'track', 'wbr','menuitem'
	}
})
