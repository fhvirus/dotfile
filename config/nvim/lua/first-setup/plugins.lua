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
  {
    'lukas-reineke/headlines.nvim',
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = true,
  },
  'nvim-tree/nvim-web-devicons',
  'nvim-lualine/lualine.nvim',
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
    dependencies = { {'nvim-lua/plenary.nvim'} }
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
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
  {
    'iamcco/markdown-preview.nvim',
    build = function() vim.fn["mkdp#util#install"]() end,
  },
  'jghauser/follow-md-links.nvim',
  'folke/zen-mode.nvim',
  'tpope/vim-fugitive',

  {
    "L3MON4D3/LuaSnip",
    version = "2.*",
    build = "make install_jsregexp"
  },

  'nvim-treesitter/nvim-treesitter',
  'nvim-treesitter/playground',
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'neovim/nvim-lspconfig',
  'norcalli/nvim-colorizer.lua',
  'searleser97/cpbooster.vim',
  'godlygeek/tabular'
}

local opts = {
  ui = {
    border = "rounded",
  },
}

require("lazy").setup(plugins, opts)
