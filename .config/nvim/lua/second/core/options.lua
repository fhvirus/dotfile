-- tell checkhealth to shutup
vim.g.loaded_node_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local o = vim.opt

o.cursorline = true
o.number = true
o.relativenumber = true
o.ruler = false
o.laststatus = 2
o.showcmd = true
o.showmode = false
o.fillchars = { eob = ' ' }
o.signcolumn = 'yes:1'
o.scrolloff = 4
o.wrap = false
-- o.conceallevel = 2

o.autoread = true
o.autowrite = true
-- o.autochdir = true

o.mouse = ''
o.splitright = true
o.splitbelow = true

o.ignorecase = true
o.smartcase = true

o.termguicolors = true
o.swapfile = false

o.cindent = true
o.tabstop = 2
o.shiftwidth = 2
o.softtabstop = 2
o.expandtab = true
o.shiftround = true

o.undofile = true
o.undodir = { os.getenv("HOME") .. "/.config/nvim/undodir" }
