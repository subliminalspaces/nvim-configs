local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup({function(use)
  -- Packer can manage itself
  use {'wbthomason/packer.nvim'}
  use(require 'mrchoko.nvim-tree-config')
  use(require 'mrchoko.toggleterm-config')
  use{'nvim-treesitter/nvim-treesitter', {run =':TSUpdate'}}
  use{'tree-sitter/tree-sitter-css'}
  use{'tree-sitter/tree-sitter-html'}
  
  use{'tree-sitter/tree-sitter-javascript'}
  use{'ikatyang/tree-sitter-yaml'}  
  use{'rest-nvim/tree-sitter-http'}
  use{'camdencheek/tree-sitter-dockerfile'}
  use{'the-mikedavis/tree-sitter-diff'}
  
  use(require 'mrchoko.comment-config')
  use{'the-mikedavis/tree-sitter-git-rebase'}
  use{'ObserverOfTime/tree-sitter-gitattributes'}
  use{'gbprod/tree-sitter-gitcommit'}
  use{'shunsambongi/tree-sitter-gitignore'}
  use{'bkegley/tree-sitter-graphql'}
  use{'tree-sitter/tree-sitter-jsdoc'}
  use{'DerekStride/tree-sitter-sql'}
  use{'ikatyang/tree-sitter-toml'}
  use{'tree-sitter/tree-sitter-regex'}
  use{'tree-sitter/tree-sitter-json'}
  use{'Joakker/tree-sitter-json5'}
  use{'tree-sitter/tree-sitter-typescript'}
  use{'tree-sitter/tree-sitter-python'}
  use(require('mrchoko.which-key-config'))
  use (require('mrchoko.nvim-transparent-config'))
  use(require('mrchoko.alpha-nvim-config')) 
  use({
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
      vim.cmd('colorscheme rose-pine')
    end
  })
  use({
    'mbbill/undotree'
  })
  use({'tpope/vim-fugitive'})
  use(require 'mrchoko.lualine-config')
  use{'folke/neodev.nvim', config= function()
    require("neodev").setup({
  library = {
    enabled = true, -- when not enabled, neodev will not change any settings to the LSP server
    -- these settings will be used for your Neovim config directory
    runtime = true, -- runtime path
    types = true, -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
    plugins = true, -- installed opt or start plugins in packpath
    -- you can also specify the list of plugins to make available as a workspace library
    -- plugins = { "nvim-treesitter", "plenary.nvim", "telescope.nvim" },
  },
  setup_jsonls = true, -- configures jsonls to provide completion for project specific .luarc.json files
  -- for your Neovim config directory, the config.library settings will be used as is
  -- for plugin directories (root_dirs having a /lua directory), config.library.plugins will be disabled
  -- for any other directory, config.library.enabled will be set to false
  override = function(root_dir, options) end,
  -- With lspconfig, Neodev will automatically setup your lua-language-server
  -- If you disable this, then you have to set {before_init=require("neodev.lsp").before_init}
  -- in your lsp start options
  lspconfig = true,
  -- much faster, but needs a recent built of lua-language-server
  -- needs lua-language-server >= 3.6.0
  pathStrict = true,
  })
  end
  }
  use(require'mrchoko.telescope-config') 
  use {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v1.x',
  requires = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},             -- Required
    {'williamboman/mason.nvim'},           -- Optional
    {'williamboman/mason-lspconfig.nvim'}, -- Optional

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},         -- Required
    {'hrsh7th/cmp-nvim-lsp'},     -- Required
    {'hrsh7th/cmp-buffer'},       -- Optional
    {'hrsh7th/cmp-path'},         -- Optional
    {'saadparwaiz1/cmp_luasnip'}, -- Optional
    {'hrsh7th/cmp-nvim-lua'},     -- Optional

    -- Snippets
    {'L3MON4D3/LuaSnip'},             -- Required
    {'rafamadriz/friendly-snippets'}, -- Optional
  }
  }
  use (require 'mrchoko.smart-splits-config')
  use(require 'mrchoko.trouble-config')
end,
config ={
      git = {
        clone_timeout = 150
      }
    }
}
)
