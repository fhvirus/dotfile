return {
  "folke/zen-mode.nvim",
  dependencies = {
    {
      "folke/twilight.nvim",
      opts = { treesitter = false }
    },
  },
  opts = {
    window = {
      width = 80,
      options = {
        signcolumn = "no"
      }
    },
    plugins = {
      tmux = { enabled = true },
      wezterm = { enabled = true },
    }
  },
  keys = {
    { "<leader>z", "<cmd>ZenMode<cr>", desc = "Toggle Zen Mode" }
  }
}
