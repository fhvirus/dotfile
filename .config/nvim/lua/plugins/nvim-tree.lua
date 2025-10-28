return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<leader>ee", "<cmd>NvimTreeToggle<CR>",   desc = "Toggle file explorer" },
    { "<leader>ef", "<cmd>NvimTreeFindFile<CR>", desc = "Toggle file explorer on current file" },
  },
  lazy = false,
  init = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
  end,
  opts = {}
}
