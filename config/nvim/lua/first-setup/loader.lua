local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

local load_cwd = { "~/code" }
local load_dirs = { "~/code/nontoi/codebook" }
local function load_func ()
  require('telescope.builtin').find_files(require('telescope.themes').get_cursor{
    previewer = false,
    cwd = load_cwd,
    search_dirs = load_dirs,
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        local text = vim.fn.system("cpp -P -w -fpreprocessed -dD " .. selection[1] .. " | clang-format")
        vim.api.nvim_put(vim.split(text, '\n'), "l", true, true)
      end)
      return true
    end,
  })
end

vim.api.nvim_create_user_command('Load', load_func, {})
