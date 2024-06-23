return {
  "shaunsingh/nord.nvim",
  priority = 1000,
  config = function()
    -- vim.g.nord_italic = false
    vim.g.nord_bold = false
    -- vim.g.nord_borders = true
    vim.g.nord_disable_background = true
    require("nord").set()
  end,
}
