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
  }
}

-- local on_attach = function(_, _)
--   vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
-- end

-- require("lspconfig").clangd.setup {}
-- require("lspconfig").lua_ls.setup {}
-- require("lspconfig").rust_analyzer.setup {}
-- require("lspconfig").texlab.setup {}
