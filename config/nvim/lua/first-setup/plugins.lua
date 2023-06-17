local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  'shaunsingh/nord.nvim',
  'lukas-reineke/headlines.nvim',
  'nvim-tree/nvim-web-devicons',
  'nvim-lualine/lualine.nvim',
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    dependencies = { {'nvim-lua/plenary.nvim'} }
  },
  'numToStr/Comment.nvim',
  'folke/which-key.nvim',
  'lervag/vimtex',
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
  },
  'iamcco/markdown-preview.nvim',
  'jghauser/follow-md-links.nvim',

  'nvim-treesitter/nvim-treesitter',
  'nvim-treesitter/playground',
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'neovim/nvim-lspconfig',
}

local opts = {
  ui = {
    border = "rounded",
  },
}

require("lazy").setup(plugins, opts)
