-- shut up :checkhealth
vim.g.loaded_python3_provider = 0
vim.g.loaded_node_provider    = 0
vim.g.loaded_perl_provider    = 0
vim.g.loaded_ruby_provider    = 0

vim.g.mapleader               = " "
vim.g.maplocalleader          = " "

vim.opt.autoread              = true
vim.opt.autowrite             = true
vim.opt.swapfile              = false
vim.opt.undofile              = true

vim.opt.tabstop               = 2
vim.opt.shiftwidth            = 2
vim.opt.expandtab             = true
vim.opt.shiftround            = true

vim.opt.signcolumn            = "yes"
vim.opt.termguicolors         = true
vim.opt.wrap                  = false

vim.opt.splitright            = true
vim.opt.splitbelow            = true

require("load_lazy")
require("fcitx5-input-toggle")
