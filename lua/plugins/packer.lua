local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
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
vim.cmd [[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]]

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use 'kyazdani42/nvim-web-devicons'
  use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight

  -- Themes
  -- use 'shaunsingh/nord.nvim'
  -- use 'joshdick/onedark.vim'
  -- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
  use "lunarvim/darkplus.nvim"
  use 'nvim-lualine/lualine.nvim'

  use {
    'kyazdani42/nvim-tree.lua',
    config = function() require'nvim-tree'.setup {} end
  }

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use 'nvim-telescope/telescope-media-files.nvim'

  use "akinsho/bufferline.nvim"

  -- Treesitter
  -- Highlight, edit, and navigate code using a fast incremental parsing library
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use 'p00f/nvim-ts-rainbow' -- treesitter rainbow plugin
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  -- Completion
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "hrsh7th/cmp-nvim-lua" -- cmdline completions
  use 'onsails/lspkind-nvim'

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  use "jose-elias-alvarez/null-ls.nvim"

  use 'tpope/vim-fugitive' -- Git commands in nvim
  use 'tpope/vim-rhubarb' -- Fugitive-companion to interact with github
  use 'tpope/vim-commentary' -- "gc" to comment visual regions/lines
  use "lewis6991/gitsigns.nvim"

  -- Dashboard
  --use 'mhinz/vim-startify'
  --use 'glepnir/dashboard-nvim'
  use 'goolord/alpha-nvim'
  use "ahmedkhalf/project.nvim"

  use "akinsho/toggleterm.nvim"
  use "folke/which-key.nvim"

  --use 'ggandor/lightspeed.nvim'
  --use 'unblevable/quick-scope'
  use 'lewis6991/impatient.nvim'

  ---- MORE
  -----------
  use 'simrat39/rust-tools.nvim'

  use {
    "AckslD/nvim-neoclip.lua",
    config = function()
      require("neoclip").setup()
    end,
  }

  use 'sbdchd/neoformat'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'ellisonleao/glow.nvim'

  use 'NTBBloodbath/rest.nvim'

  use 'norcalli/nvim-colorizer.lua'
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use "numToStr/Comment.nvim" -- Easily comment stuff
  use "moll/vim-bbye"

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
--'nvim-telescope/telescope-fzy-native.nvim'
--'jiangmiao/auto-pairs'
--'junegunn/goyo.vim' "distraction free writing
--'junegunn/limelight.vim' "distraction, free writing with goyo
--'vimwiki/vimwiki', { 'branch': 'dev' }
-- https://github.com/sjl/gundo.vim

--Terminal
--https://github.com/akinsho/toggleterm.nvim
--https://github.com/voldikss/vim-floaterm

--'haishanh/night-owl.vim'
--'tomasiser/vim-code-dark'
--'dylanaraps/wal'

--Debugger
--https://github.com/mfussenegger/nvim-dap"
-- https://github.com/whatsthatsmell/dots
-- https://github.com/nvim-telescope/telescope-vimspector.nvim
-- https://github.com/tpope/vim-fugitive
