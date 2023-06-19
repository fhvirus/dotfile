vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local o = vim.opt

o.number = true
o.relativenumber = true
o.cursorline = true
o.ruler = false
o.laststatus = 2
o.showcmd = true
o.showmode = false
o.autoread = true
o.autowrite = true
o.fillchars = 'eob: '
o.lazyredraw = true
o.autochdir = true
o.signcolumn = 'yes:1'
o.scrolloff = 4

-- Tab related
o.cindent = true
o.tabstop = 2
o.shiftwidth = 2
o.softtabstop = 2
o.expandtab = true
o.shiftround = true

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so ~/.config/nvim/init.lua")
end)
vim.keymap.set("n", "<leader>z", function()
    vim.cmd("ZenMode")
end)
