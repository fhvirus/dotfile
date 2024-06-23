return {
  "nvim-lualine/lualine.nvim",
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    options = {
      icons_enabled = true,
      theme = 'nord',
      disabled_filetypes = { 'NvimTree' }
    },
    sections = {
      lualine_a = {
        {
          'filename',
          path = 1,
        }
      }
    }
  }
}
