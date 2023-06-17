vim.g.nord_italic = false
vim.g.nord_bold = false
vim.g.nord_borders = true
vim.g.mkdp_markdown_css = '/home/lemon/markdown.css'
vim.g.mkdp_highlight_css = '/home/lemon/highlight.css'

vim.g.tex_flavor = 'latex'
vim.g.vimtex_view_general_viewer = 'zathura'
vim.g.vimtex_view_method = 'zathura'
vim.g.vimtex_quickfix_mode = 0
vim.g.vimtex_compiler_method = 'latexmk'
vim.g.vimtex_compiler_latexmk = {
	build_dir = '',
	callback = 1,
	continuous = 1,
	executable = 'latexmk',
	hooks = {},
	options = {
		'-pdfxe',
		'-shell-escape',
		'-verbose',
		'-file-line-error',
		'-synctex=1',
		'-interaction=nonstopmode',
	},
}

require('first-setup.options')
require('first-setup.plugins')
require('first-setup.plugin-config')
