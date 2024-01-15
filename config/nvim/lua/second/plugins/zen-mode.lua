return {
  "folke/zen-mode.nvim",
  dependencies = { "folke/twilight.nvim" },
  opts = {
    plugins = {
      tmux = { enabled = true },
      wezterm = { enabled = true },
    }
  },
  keys = {
    { "<leader>z", "<cmd>ZenMode<cr>", desc = "Toggle Zen Mode" }
  }
}
