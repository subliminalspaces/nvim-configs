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
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    }
  }
  use { "akinsho/toggleterm.nvim", tag = "*", config = function()
    require("toggleterm").setup ({ 
      direction = 'vertical',
      size = vim.o.columns * 0.3,
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
  use{'tree-sitter/tree-sitter-css'}
  use{'tree-sitter/tree-sitter-html'}
  
  use{'tree-sitter/tree-sitter-javascript'}
  use{'ikatyang/tree-sitter-yaml'}  
  use{'rest-nvim/tree-sitter-http'}
  use{'camdencheek/tree-sitter-dockerfile'}
  use{'the-mikedavis/tree-sitter-diff'}
  
  use {
    'numToStr/Comment.nvim',
    branch = 'jsx',
    config = function()
        require('Comment').setup(
{
    ---Add a space b/w comment and the line
    padding = true,
    ---Whether the cursor should stay at its position
    sticky = true,
    ---Lines to be ignored while (un)comment
    ignore = nil,
    ---LHS of toggle mappings in NORMAL mode
    toggler = {
        ---Line-comment toggle keymap
        line = 'gcc',
        ---Block-comment toggle keymap
        block = 'gbc',
    },
    ---LHS of operator-pending mappings in NORMAL and VISUAL mode
    opleader = {
        ---Line-comment keymap
        line = 'gc',
        ---Block-comment keymap
        block = 'gb',
    },
    ---LHS of extra mappings
    extra = {
        ---Add comment on the line above
        above = 'gcO',
        ---Add comment on the line below
        below = 'gco',
        ---Add comment at the end of line
        eol = 'gcA',
    },
    ---Enable keybindings
    ---NOTE: If given `false` then the plugin won't create any mappings
    mappings = {
        ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
        basic = true,
        ---Extra mapping; `gco`, `gcO`, `gcA`
        extra = true,
    },
    ---Function to call before (un)comment 
          pre_hook = function(ctx)
          return require('Comment.jsx').calculate(ctx)
          end,
    ---Function to call after (un)comment
    post_hook = nil,


        })
    end
  }
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
  use {"xiyaowong/nvim-transparent", name="transparent", config = function()
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
  'nvim-lualine/lualine.nvim', 
  requires = { 'kyazdani42/nvim-web-devicons', opt = true},
  config = function()
  require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'onelight',
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
    lualine_b = {'branch'},
    lualine_c = {
      {
      'diff',
      colored = true, -- Displays a colored diff status if set to true
    --  diff_color = {
        -- Same color values as the general color option can be used here.
       -- added    = 'AddChange',    -- Changes the diff's added color
       -- modified = 'DiffChange', -- Changes the diff's modified color
       -- removed  = 'DiffDelete', -- Changes the diff's removed color you
     -- },
      symbols = {added = '+', modified = '~', removed = '-'}, -- Changes the symbols used by the diff.
                    -- A function that works as a data source for diff.
                    -- It must return a table as such:
                    -- or nil on failure. count <= 0 won't be displayed.
      },
      'diagnostics',
      'filename',
    },
    lualine_x = {'encoding', 'filetype'},
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
  extensions = {'fugitive'}
  }
  end
}
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
  use{'mrjones2014/smart-splits.nvim', config = function()
    require('smart-splits').setup({
  -- Ignored filetypes (only while resizing)
  ignored_filetypes = {
    'nofile',
    'quickfix',
    'prompt',
  },
  -- Ignored buffer types (only while resizing)
  ignored_buftypes = { 'NvimTree' },
  -- the default number of lines/columns to resize by at a time
  default_amount = 10,
  -- whether to wrap to opposite side when cursor is at an edge
  -- e.g. by default, moving left at the left edge will jump
  -- to the rightmost window, and vice versa, same for up/down.
  wrap_at_edge = true,
  -- when moving cursor between splits left or right,
  -- place the cursor on the same row of the *screen*
  -- regardless of line numbers. False by default.
  -- Can be overridden via function parameter, see Usage.
  move_cursor_same_row = false,
  -- resize mode options
  resize_mode = {
    -- key to exit persistent resize mode
    quit_key = '<ESC>',
    -- keys to use for moving in resize mode
    -- in order of left, down, up' right
    resize_keys = { 'j', 'k', 'i', 'l' },
    -- set to true to silence the notifications
    -- when entering/exiting persistent resize mode
    silent = false,
    -- must be functions, they will be executed when
    -- entering or exiting the resize mode
    hooks = {
      on_enter = nil,
      on_leave = nil,
    },
  },
  -- ignore these autocmd events (via :h eventignore) while processing
  -- smart-splits.nvim computations, which involve visiting different
  -- buffers and windows. These events will be ignored during processing,
  -- and un-ignored on completed. This only applies to resize events,
  -- not cursor movement events.
  ignored_events = {
    'BufEnter',
    'WinEnter',
  },
  -- enable or disable the tmux integration
  tmux_integration = false,
  -- disable tmux navigation if current tmux pane is zoomed
  disable_tmux_nav_when_zoomed = true,

  })

  end
  }
  use {
  "folke/trouble.nvim",
  requires = "nvim-tree/nvim-web-devicons",
  config = function()
    require("trouble").setup { 
    position = "bottom", -- position of the list can be: bottom, top, left, right
    height = 10, -- height of the trouble list when position is top or bottom
    width = 50, -- width of the list when position is left or right
    icons = true, -- use devicons for filenames
    mode = "workspace_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
    fold_open = "", -- icon used for open folds
    fold_closed = "", -- icon used for closed folds
    group = true, -- group results by file
    padding = true, -- add an extra new line on top of the list
    action_keys = { -- key mappings for actions in the trouble list
        -- map to {} to remove a mapping, for example:
        -- close = {},
        close = "q", -- close the list
        cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
        refresh = "r", -- manually refresh
        jump = {"<cr>", "<tab>"}, -- jump to the diagnostic or open / close folds
        open_split = { "<c-x>" }, -- open buffer in new split
        open_vsplit = { "<c-v>" }, -- open buffer in new vsplit
        open_tab = { "<c-t>" }, -- open buffer in new tab
        jump_close = {"o"}, -- jump to the diagnostic and close the list
        toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
        toggle_preview = "P", -- toggle auto_preview
        hover = "K", -- opens a small popup with the full multiline message
        preview = "p", -- preview the diagnostic location
        close_folds = {"zM", "zm"}, -- close all folds
        open_folds = {"zR", "zr"}, -- open all folds
        toggle_fold = {"zA", "za"}, -- toggle fold of current file
        previous = "k", -- previous item
        next = "j" -- next item
    },
    indent_lines = true, -- add an indent guide below the fold icons
    auto_open = false, -- automatically open the list when you have diagnostics
    auto_close = false, -- automatically close the list when you have no diagnostics
    auto_preview = true, -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
    auto_fold = false, -- automatically fold a file trouble list at creation
    auto_jump = {"lsp_definitions"}, -- for the given modes, automatically jump if there is only a single result
    signs = {
        -- icons / text used for a diagnostic
        error = "",
        warning = "",
        hint = "",
        information = "",
        other = "﫠"
    },
    use_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
    }
  end
}
end,
config ={
      git = {
        clone_timeout = 150
      }
    }
}
)
