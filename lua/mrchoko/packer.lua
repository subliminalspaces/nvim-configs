local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  vim.cmd [[packadd packer.nvim]]
end
return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use { 'sitiom/nvim-numbertoggle' }
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    }
  }
  use { "akinsho/toggleterm.nvim", tag = "*", config = function()
    require("toggleterm").setup ({ 
      direction = 'horizontal',
      open_mapping=[[<c-\>]],
--      insert_mappings = true,
        terminal_mappings = true,
        auto_scroll = true,
        shade_terminals = false,
   --     winhighlight = "none",
        highlights = {
	  Normal = {
            guibg="none",
            bg="none"
          },
	      }	
    })
    end
  }
  use{'nvim-treesitter/nvim-treesitter', {run =':TSUpdate'}}
  use {"/xiyaowong/nvim-transparent", config = function()
      require("transparent").setup({
        enable = true, -- boolean: enable transparent
        extra_groups = { -- table/string: additional groups that should be cleared
        -- In particular, when you set it to 'all', that means all available groups

        -- example of akinsho/nvim-bufferline.lua
        "BufferLineTabClose",
        "BufferlineBufferSelected",
        "BufferLineFill",
        "BufferLineBackground",
        "BufferLineSeparator",
        "BufferLineIndicatorSelected",
  	},
	exclude = {}, -- table: groups you don't want to clear
      })
      end 
    }
  use({
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
      vim.cmd('colorscheme rose-pine')
    end
  })
end)
