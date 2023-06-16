-- vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- https://github.com/shaunsingh/nord.nvim
	-- Requires more setup, such as markdown coloring.
	use {
		'shaunsingh/nord.nvim',
		-- after = {'headlines.nvim'},
		config = function()
			require('nord').set()
		end,
	}

	-- https://github.com/lukas-reineke/headlines.nvim
	use {
		'lukas-reineke/headlines.nvim',
		after = {'nvim-treesitter'},
		config = function()
			require('headlines').setup({
				markdown = {
					headline_highlights = {
						"Headline1",
						"Headline2",
						"Headline3",
						"Headline4",
						"Headline5",
						"Headline6",
					},
					codeblock_highlight = "CodeBlock",
					dash_highlight = "Dash",
					quote_highlight = "Quote",
				},
			})
		end,
	}

	-- https://github.com/nvim-lualine/lualine.nvim
	-- Requires more setup, currently using default settings.
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true },
		after = 'nord.nvim',
		config = function()
			require('lualine').setup {
				options = {
					theme = 'nord'
				}
			}
		end
	}

	-- https://github.com/nvim-telescope/telescope.nvim
	-- Learn to use it.
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- https://github.com/nvim-tree/nvim-tree.lua
	-- Needs keymap config.
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional
		},
		config = function()
			require("nvim-tree").setup()
		end
	}

	-- https://github.com/iamcco/markdown-preview.nvim
	-- Needs keymap config.
	use {
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	}

	-- https://github.com/jghauser/follow-md-links.nvim
	use { 'jghauser/follow-md-links.nvim' }

	-- from https://github.com/ThePrimeagen/init.lua/blob/master/lua/theprimeagen/packer.lua
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end
	}
	use { 'nvim-treesitter/playground' }

	-- use {
	-- 	'VonHeikemen/lsp-zero.nvim',
	-- 	branch = 'v1.x',
	-- 	requires = {
	-- 		-- LSP Support
	-- 		{'neovim/nvim-lspconfig'},
	-- 		{'williamboman/mason.nvim'},
	-- 		{'williamboman/mason-lspconfig.nvim'},

	-- 		-- Autocompletion
	-- 		{'hrsh7th/nvim-cmp'},
	-- 		{'hrsh7th/cmp-buffer'},
	-- 		{'hrsh7th/cmp-path'},
	-- 		{'saadparwaiz1/cmp_luasnip'},
	-- 		{'hrsh7th/cmp-nvim-lsp'},
	-- 		{'hrsh7th/cmp-nvim-lua'},

	-- 		-- Snippets
	-- 		{'L3MON4D3/LuaSnip'},
	-- 		{'rafamadriz/friendly-snippets'},
	-- 	}
	-- }
end)
