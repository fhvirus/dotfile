return {
  "williamboman/mason.nvim",
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  cmd = "Mason",
  build = ":MasonUpdate",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    mason.setup()
    mason_lspconfig.setup({
      ensure_installed = {
        "clangd",
        "csharp_ls",
        "lua_ls",
        "rust_analyzer",
        "texlab",
        "pyright",
        "html",
        "ts_ls",
      },
      automatic_installation = true,
    })
  end,
}
