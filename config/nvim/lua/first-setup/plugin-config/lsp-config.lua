require("mason").setup {
  ui = {
    border = "single",
  },
}
require("mason-lspconfig").setup {
  ensure_installed = {
    "clangd",
    "lua_ls",
    "rust_analyzer",
    "texlab",
    "pyright",
  },
}

-- require("lspconfig").clangd.setup {}
-- require("lspconfig").lua_ls.setup {}
-- require("lspconfig").rust_analyzer.setup {}
-- require("lspconfig").texlab.setup {}
-- require("lspconfig").pyright.setup {}
