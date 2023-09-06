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
o.mouse = ''

-- vim.cmd('set clipboard+=unnamedplus')

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

-- Modified from https://zhuanlan.zhihu.com/p/558359369
vim.cmd [[
let g:input_toggle = 0
function! Fcitx2normal()
   let s:input_status = system("fcitx5-remote")
   if s:input_status == 2
      let g:input_toggle = 1
      let l:a = system("fcitx5-remote -c")
   endif
endfunction

function! Fcitx2insert()
   let s:input_status = system("fcitx5-remote")
   if s:input_status != 2 && g:input_toggle == 1
      let l:a = system("fcitx5-remote -o")
      let g:input_toggle = 0
   endif
endfunction

set ttimeoutlen=150
autocmd InsertLeave * call Fcitx2normal()
autocmd InsertEnter * call Fcitx2insert()
]]

vim.cmd [[
nmap <buffer> <F4> :%d<CR>:r ~/code/owo/templates/template.cpp<CR>kJ19zF23G
nmap <buffer> <F5> :%d<CR>:r ~/code/owo/templates/minimum.cpp<CR>kJ5G
nmap <buffer> <F6> :vs ~/code/owo/in.in<CR>:vert res 30<CR>
nmap <buffer> <F7> :w<CR>:!g++ -Wall -Wconversion -Wfatal-errors -g -std=c++20 -fsanitize=undefined,address -DOWO -DNONTOI "%" -o ~/code/owo/run<CR>
nmap <buffer> <F8> :w<CR>:!echo "\t\tinput\n" && cat ~/code/owo/in.in && echo "\n\t\toutput\n" && ~/code/owo/run < ~/code/owo/in.in<CR>
]]
