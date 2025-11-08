return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {},
  keys = {
    {
      "<leader>fb",
      "<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>",
      desc = "Buffers"
    },
    { "<leader>fB", "<cmd>FzfLua buffers<cr>",   desc = "Buffers (all)" },
    {
      "<leader>fc",
      "<cmd>FzfLua files cwd='~/.dotfile/.config/'<cr>",
      desc = "Find Config File"
    },
    { "<leader>ff", "<cmd>FzfLua files<cr>",     desc = "Find Files (cwd)" },
    { "<leader>fF", "<cmd>FzfLua files<cr>",     desc = "Find Files (root)" },
    { "<leader>fg", "<cmd>FzfLua live_grep<cr>", desc = "Live grep (cwd)" },
    { "<leader>fo", "<cmd>FzfLua oldfiles<cr>",  desc = "Recent" },
  },
}
