return {
  'chomosuke/typst-preview.nvim',
  ft = 'typst',
  version = '1.*',
  opts = {
    dependencies_bin = { ["tinymist"] = "tinymist" },
    extra_args = { "--input=mode=preview" },
    open_cmd = "firefox --new-window %s -P default-release --class typst-preview",
  },
}
