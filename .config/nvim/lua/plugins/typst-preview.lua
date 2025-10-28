return {
  "chomosuke/typst-preview.nvim",
  ft = "typst",
  version = "1.*",
  keys = {
    { "<leader>tp", "<cmd>TypstPreview<CR>", desc = "Start Typst Preview" },
  },
  opts = {
    dependencies_bin = { ["tinymist"] = "tinymist" },
  }
}
