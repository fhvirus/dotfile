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
      { "<leader>w", proxy = "<c-w>", group = "windows" },
      { "<leader>y", ":%y+<enter>", desc = "yank file to clipboard", mode = "n"},
      { "<leader>y", "\"+y", desc = "yank selected to clipboard", mode = "v"}
    })
  end
}
