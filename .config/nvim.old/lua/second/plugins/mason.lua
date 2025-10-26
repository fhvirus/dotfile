return {
  "williamboman/mason.nvim",
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  cmd = "Mason",
  build = ":MasonUpdate",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
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
        "tinymist",
      },
      automatic_installation = true,
    })
    -- https://forum.typst.app/t/tinymist-vs-typst-vim-vs-typst-preview-nvim/1775/4
    local lspconfig = require("lspconfig")
    lspconfig.tinymist.setup{
      single_file_support = true,
      settings = {
        exportPdf = "onSave",
      },
    }
  end,
}
