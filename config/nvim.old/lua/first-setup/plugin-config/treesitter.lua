require('nvim-treesitter.configs').setup {
  ensure_installed = { 'c', 'lua', 'vim', 'rust', 'markdown', 'cpp' },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = false,
  },
}
