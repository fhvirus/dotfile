return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  config = function()
    require("which-key").setup({})
    local wk = require("which-key")
    wk.add({
      { "<leader>e", group = "nvim-tree" },
      { "<leader>l", group = "vimtex" },
    })
  end
}
