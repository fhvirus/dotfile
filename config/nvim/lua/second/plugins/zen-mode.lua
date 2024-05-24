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
        signcolumn = "no",
        scrolloff = 7,
      }
    },
    plugins = {
      twilight = { enabled = false },
      tmux = { enabled = true },
      wezterm = {
        enabled = true,
        font = "+6"
      },
    }
  },
  keys = {
    { "<leader>z", "<cmd>ZenMode<cr>", desc = "Toggle Zen Mode" }
  }
}
