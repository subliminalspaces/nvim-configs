local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup({ function(use)
  -- Packer can manage itself
  use { 'wbthomason/packer.nvim' }

  use(require 'mrchoko.nvim-tree-config')
  use(require 'mrchoko.toggleterm-config')
  use(require 'mrchoko.comment-config')
  
  use { 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' } }
  use { 'tree-sitter/tree-sitter-css' }
  use { 'tree-sitter/tree-sitter-html' }
  use { 'tree-sitter/tree-sitter-javascript' }
  use { 'ikatyang/tree-sitter-yaml' }
  use { 'rest-nvim/tree-sitter-http' }
  use { 'camdencheek/tree-sitter-dockerfile' }
  use { 'the-mikedavis/tree-sitter-diff' }
  use { 'the-mikedavis/tree-sitter-git-rebase' }
  use { 'ObserverOfTime/tree-sitter-gitattributes' }
  use { 'gbprod/tree-sitter-gitcommit' }
  use { 'shunsambongi/tree-sitter-gitignore' }
  use { 'bkegley/tree-sitter-graphql' }
  use { 'tree-sitter/tree-sitter-jsdoc' }
  use { 'DerekStride/tree-sitter-sql' }
  use { 'ikatyang/tree-sitter-toml' }
  use { 'tree-sitter/tree-sitter-regex' }
  use { 'tree-sitter/tree-sitter-json' }
  use { 'Joakker/tree-sitter-json5' }
  use { 'tree-sitter/tree-sitter-typescript' }
  use { 'tree-sitter/tree-sitter-python' }

  use(require('mrchoko.which-key-config'))
  use(require('mrchoko.nvim-transparent-config'))
  use(require('mrchoko.alpha-nvim-config'))
  use(require('mrchoko.themes.rose-pine'))
  use(require('mrchoko.themes.tokyonight'))
  use({'mbbill/undotree'})
  use({ 'tpope/vim-fugitive' })
  use(require 'mrchoko.lualine-config')
  use(require('mrchoko.neodev'))
  use(require 'mrchoko.telescope-config')
  use(require 'mrchoko.lsp-zero-config') 
  use(require 'mrchoko.smart-splits-config')
  use(require 'mrchoko.trouble-config')
end,
  config = {
    git = {
      clone_timeout = 150
    }
  }
}
)
