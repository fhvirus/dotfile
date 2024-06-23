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
    wk.register({
      e = { name = "nvim-tree", },
      l = { name = "vimtex", },
    }, { prefix = "<leader>" })
  end
}
