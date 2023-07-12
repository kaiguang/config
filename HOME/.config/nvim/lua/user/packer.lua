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

-- Autocommand that reloads neovim whenever you save the packer.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  print("Not able to load packer")
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
  git = {
    clone_timeout = 300, -- Timeout, in seconds, for git clones
  },
}

-- Install your plugins here
return packer.startup(function(use)
  use "wbthomason/packer.nvim"                                                                       -- Packer can manage itself
  use "nvim-lua/plenary.nvim"                                                                        -- Lua functions
  use "nvim-tree/nvim-web-devicons"                                                                  -- Colored icons
  use "godlygeek/tabular"                                                                            -- Align text
  use "JoosepAlviste/nvim-ts-context-commentstring"                                                  -- Set commentstring based on cursor location in file
  use "numToStr/Comment.nvim"                                                                        -- Smart comment
  use "nvim-treesitter/nvim-treesitter-context"                                                      -- Show code context
  use "lukas-reineke/indent-blankline.nvim"                                                          -- Indentation guides
  use "rebelot/kanagawa.nvim"                                                                        -- Colorscheme
  use "nvim-tree/nvim-tree.lua"                                                                      -- File explorer
  use { "nvim-telescope/telescope.nvim", tag = "0.1.1", requires = { { "nvim-lua/plenary.nvim" } } } -- Fuzzy finder
  use { "nvim-lualine/lualine.nvim", requires = { "nvim-tree/nvim-web-devicons", opt = true } }      -- Statusline
  use { "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" }          -- Tabline
  use { "windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup {} end }        -- Autopair
  use "tpope/vim-surround"                                                                           -- Surrounding pairs
  use "github/copilot.vim"                                                                           -- GitHub Copilot
  use "sbdchd/neoformat"                                                                             -- Code formatter
  use "ggandor/leap.nvim"                                                                            -- Easy motion in the current buffer

  -- LSP
  use "neovim/nvim-lspconfig"             -- Configs for Neovim LSP
  use "jose-elias-alvarez/null-ls.nvim"   -- Use LSP for others, like linters and formatters
  use "williamboman/mason.nvim"           -- Neovim package manager for LSP servers, DAP servers, linters, and formatters
  use "williamboman/mason-lspconfig.nvim" -- Bridges mason and nvim-lspconfig

  -- Syntax tree, support highlighting, incremental selection, indentation, folding, etc.
  use {
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  }

  -- Completion
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "hrsh7th/nvim-cmp"
  use "L3MON4D3/LuaSnip"
  use "saadparwaiz1/cmp_luasnip"

  -- Git
  use "f-person/git-blame.nvim"
  use { "lewis6991/gitsigns.nvim", config = function() require("gitsigns").setup() end }
  use { "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
