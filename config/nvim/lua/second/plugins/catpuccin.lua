return {
  "catppuccin/nvim",
  name = "catppuccin",
  enabled = false,
  lazy = true,
  priority = 1000,
  init = function()
    vim.cmd.colorscheme "catppuccin"
  end,
  opts = {
    flavour = "frappe",
  }
}
