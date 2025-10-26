return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    spec = {
      { "<leader>e", group = "nvim-tree", icon = { icon = "", color = "cyan" } },
      { "<leader>w", proxy = "<c-w>", group = "windows" },
      { "<leader>y", ":%y+<enter>", desc = "yank file to clipboard", mode = "n" },
      { "<leader>y", "\"+y", desc = "yank selected to clipboard", mode = "v" }
    }
  }
}
