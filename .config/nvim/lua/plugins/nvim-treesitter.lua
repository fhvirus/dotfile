return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  version = false,
  build = ":TSUpdate",
  event = { "BufReadPost", "BufWritePost", "BufNewFile", "VeryLazy" },
  cmd = { "TSUpdate", "TSInstall", "TSLog", "TSUninstall" },
  dependencies = {
    {
      "nvim-treesitter/nvim-treesitter-context",
      event = { "BufReadPost", "BufNewFile", "BufWritePre" },
      opts = { mode = "cursor", max_lines = 3 },
    }
  },
  opts = {
    ensure_installed = { "bash", "c", "cpp", "diff",
      "latex", "lua", "markdown", "markdown_inline",
      "python", "regex", "typst", "vim", "vimdoc", },
    highlight = { enable = true, },
  },
}
