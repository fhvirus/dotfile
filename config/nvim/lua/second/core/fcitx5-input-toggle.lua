-- Modified from https://zhuanlan.zhihu.com/p/558359369
vim.opt.ttimeoutlen = 150
vim.g.input_toggle = 0
local function get_fcitx5_state()
  local f = assert(io.popen('fcitx5-remote', 'r'))
  local s = assert(f:read('*a'))
  f:close()
  return tonumber(s)
end

vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  callback = function()
    if get_fcitx5_state() == 2 then
      vim.g.input_toggle = 1
      os.execute("fcitx5-remote -c")
    end
  end
})

vim.api.nvim_create_autocmd("InsertEnter", {
  pattern = '*',
  callback = function()
    if get_fcitx5_state() ~= 2 and vim.g.input_toggle == 1 then
      os.execute("fcitx5-remote -o")
      vim.g.input_toggle = 0
    end
  end
})
