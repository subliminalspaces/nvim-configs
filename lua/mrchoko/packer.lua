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
      open_mapping=[[<C-\>]],
      insert_mappings = true,
      terminal_mappings = true,
      auto_scroll = true,
      shade_terminals = false,
      start_in_insert = true,
      persist_size = true, 
      persist_mode = true,
      -- winh    winhighlight = "none", makes -- makes terminal darker
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
  use({
    'mbbill/undotree'
  })
  use({'tpope/vim-fugitive'})
  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup({
          padding = true,
          sticky = true,
          ignore = nil,
          toggler = {
            line = 'gcc',
            block = 'gbc'
          },
          extra = {},
          mappings = {
            basic = true,
            extra = true
          }

        })
    end
  }
  use {
  'nvim-lualine/lualine.nvim', 
  requires = { 'kyazdani42/nvim-web-devicons', opt = true},
  config = function()
  require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
  }
  end
  }
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
  
end)
