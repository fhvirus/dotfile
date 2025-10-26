return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPost", "BufWritePost", "BufNewFile" },
  keys = {
    {
      "<leader>l",
      function()
        require("lint").try_lint()
      end,
      mode = "",
      desc = "Lint buffer",
    },
  },
  config = function()
    require("lint").linters_by_ft = {
      -- python = { "pylint" },
      ["*"] = { "typos" },
    }

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
      callback = function()
        require("lint").try_lint()
      end,
    })
  end
}
