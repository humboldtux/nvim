local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Use a protected call so we don't error out on first use
-- pcall == protected call
-- au lieu de
---- local packer = require("packer")
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]])

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("lewis6991/impatient.nvim")
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
	use("kyazdani42/nvim-web-devicons")
	use("antoinemadec/FixCursorHold.nvim") -- This is needed to fix lsp doc highlight

	-- Themes
	use({
		"nvim-lualine/lualine.nvim",
		config = "require('plugins.lualine')",
	})
	use({
		"akinsho/bufferline.nvim",
		requires = "moll/vim-bbye", -- BDelete command
		wants = "vim-bbye", -- BDelete command
		config = "require('plugins.bufferline')",
	})
	-- barbar: lualine + bbye
	use("shaunsingh/nord.nvim")
	-- use 'joshdick/onedark.vim'
	-- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
	-- use "lunarvim/darkplus.nvim"

	use({
		"kyazdani42/nvim-tree.lua",
		config = "require('plugins.nvim-tree')",
	})

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		config = "require('plugins.telescope')",
		requires = {
			"nvim-telescope/telescope-file-browser.nvim",
			"nvim-telescope/telescope-media-files.nvim",
		},
		wants = {
			"telescope-file-browser.nvim",
			"telescope-media-files.nvim",
		},
	})

	-- Treesitter
	-- Highlight, edit, and navigate code using a fast incremental parsing library
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = "require('plugins.treesitter')",
		requires = {
			"p00f/nvim-ts-rainbow", -- treesitter rainbow plugin
			"JoosepAlviste/nvim-ts-context-commentstring",
			"nvim-treesitter/playground",
		},
		wants = {
			"nvim-ts-rainbow", -- treesitter rainbow plugin
			"nvim-ts-context-commentstring",
			"playground",
		},
	})

	-- LSP
	use({
		"neovim/nvim-lspconfig",
		config = "require('plugins.lsp')",
		requires = {
			"williamboman/nvim-lsp-installer", -- simple to use language server installer
			"tamago324/nlsp-settings.nvim", -- language server settings defined in json for
			"jose-elias-alvarez/null-ls.nvim",
		},
		wants = {
			"nvim-lsp-installer", -- simple to use language server installer
			"nlsp-settings.nvim", -- language server settings defined in json for
			"null-ls.nvim",
		},
	})

	-- Completion
	-- --https://github.com/neovim/nvim-lspconfig/wiki/Snippets
	use({
		"hrsh7th/nvim-cmp",
		config = "require('plugins.completions')",
		after = "nvim-lspconfig",
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer", -- buffer completions
			"hrsh7th/cmp-path", -- path completions
			"hrsh7th/cmp-cmdline", -- cmdline completions
			"hrsh7th/cmp-nvim-lua", -- cmdline completions
			"onsails/lspkind-nvim",
			"L3MON4D3/LuaSnip", --snippet engine
			"rafamadriz/friendly-snippets", -- a bunch of snippets to use
			"saadparwaiz1/cmp_luasnip", -- snippet completions
			"hrsh7th/cmp-vsnip",
			"hrsh7th/vim-vsnip",
			"simrat39/rust-tools.nvim",
			{
				"windwp/nvim-autopairs",
				config = "require('plugins.autopairs')",
			},
		},
		wants = {
			"rust-tools.nvim",
			"cmp-nvim-lsp",
			"cmp-buffer", -- buffer completions
			"cmp-path", -- path completions
			"cmp-cmdline", -- cmdline completions
			"cmp-nvim-lua", -- cmdline completions
			"lspkind-nvim",
			"LuaSnip", --snippet engine
			"friendly-snippets", -- a bunch of snippets to use
			"cmp_luasnip", -- snippet completions
			"cmp-vsnip",
			"vim-vsnip",
			"nvim-autopairs",
		},
	}) -- The completion plugin

	use({
		"lukas-reineke/indent-blankline.nvim",
		config = "require('plugins.indentline')",
	})

	-- Dashboard
	--use 'mhinz/vim-startify'
	--use 'glepnir/dashboard-nvim'
	use("goolord/alpha-nvim")
	use("ahmedkhalf/project.nvim")
	-- vim-obsession

	--https://github.com/akinsho/toggleterm.nvim#custom-terminals
	use({
		"akinsho/toggleterm.nvim",
		config = "require('plugins.toggleterm')",
	})
	--https://github.com/voldikss/vim-floaterm
	use({
		"folke/which-key.nvim",
		config = "require('plugins.whichkey')",
	})

	-- GIT
	use({
		"lewis6991/gitsigns.nvim",
		config = "require('plugins.gitsigns')",
	})

	--MOTIONS
	--use 'ggandor/lightspeed.nvim'
	--use 'unblevable/quick-scope'

	use({
		"AckslD/nvim-neoclip.lua",
		config = function()
			require("neoclip").setup()
		end,
	})

	-- https://github.com/tami5/lspsaga.nvim

	use("ellisonleao/glow.nvim")

	use("NTBBloodbath/rest.nvim")

	use("norcalli/nvim-colorizer.lua")

	use({
		"numToStr/Comment.nvim",
		config = "require('plugins.comment')",
	}) -- Easily comment stuff

	-- task
	-- vimwiki
	-- https://github.com/nvim-neorg/neorg

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)

--use 'ludovicchabant/vim-gutentags' -- Automatic tags management
--'sheerun/vim-polyglot'
-- https://github.com/folke/lua-dev.nvim
--'dense-analysis/ale'
--'ray-x/lsp_signature.nvim'
--'jiangmiao/auto-pairs'
--'junegunn/goyo.vim' "distraction free writing
--'junegunn/limelight.vim' "distraction, free writing with goyo
--'vimwiki/vimwiki', { 'branch': 'dev' }
-- https://github.com/sjl/gundo.vim

--Terminal
--https://github.com/voldikss/vim-floaterm

--'haishanh/night-owl.vim'
--'tomasiser/vim-code-dark'
--'dylanaraps/wal'

--Debugger
--https://github.com/mfussenegger/nvim-dap"
-- https://github.com/whatsthatsmell/dots
-- https://github.com/nvim-telescope/telescope-vimspector.nvim
-- https://github.com/tpope/vim-fugitive
