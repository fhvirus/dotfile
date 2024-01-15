return {
  "nvim-treesitter/nvim-treesitter",
  version = false,
  build = ":TSUpdate",
  event = { "VeryLazy", "BufReadPost", "BufNewFile", "BufWritePre" },
  init = function(plugin)
    require("lazy.core.loader").add_to_rtp(plugin)
    require("nvim-treesitter.query_predicates")
  end,
  dependencies = {
    {
      "nvim-treesitter/nvim-treesitter-textobjects",
      config = function()
        -- When in diff mode, we want to use the default
        -- vim text objects c & C instead of the treesitter ones.
        local move = require("nvim-treesitter.textobjects.move") ---@type table<string,fun(...)>
        local configs = require("nvim-treesitter.configs")
        for name, fn in pairs(move) do
          if name:find("goto") == 1 then
            move[name] = function(q, ...)
              if vim.wo.diff then
                local config = configs.get_module("textobjects.move")[name] ---@type table<string,string>
                for key, query in pairs(config or {}) do
                  if q == query and key:find("[%]%[][cC]") then
                    vim.cmd("normal! " .. key)
                    return
                  end
                end
              end
              return fn(q, ...)
            end
          end
        end
      end,
    },
    {
      "nvim-treesitter/nvim-treesitter-context",
      event = { "BufReadPost", "BufNewFile", "BufWritePre" },
      opts = { mode = "cursor", max_lines = 3 },
    }
  },
  cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "bash", "c", "cpp", "diff", "html", "javascript", 
        "json", "latex", "lua", "markdown", "markdown_inline", "python",
        "regex", "rust", "toml", "vim", "vimdoc", "yaml" },
      sync_install = false,
      auto_install = true,
      highlight = { enable = false, },
    })
  end,
}

