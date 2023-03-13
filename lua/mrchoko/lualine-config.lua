return {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
        require('lualine').setup {
            options = {
                icons_enabled = true,
                theme = 'molokai',
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
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
                lualine_a = { 'mode' },
                lualine_b = { 'branch' },
                lualine_c = {'filename',
                    {
                        'diff',
                        colored = true, -- Displays a colored diff status if set to true
                        --  diff_color = {
                        -- Same color values as the general color option can be used here.
                        -- added    = 'AddChange',    -- Changes the diff's added color
                        -- modified = 'DiffChange', -- Changes the diff's modified color
                        -- removed  = 'DiffDelete', -- Changes the diff's removed color you
                        -- },
                        symbols = { added = '+', modified = '~', removed = '-' }, -- Changes the symbols used by the diff.
                        -- A function that works as a data source for diff.
                        -- It must return a table as such:
                        -- or nil on failure. count <= 0 won't be displayed.
                    },
                    {
                    'diagnostics',

      -- Table of diagnostic sources, available sources are:
      --   'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic', 'coc', 'ale', 'vim_lsp'.
      -- or a function that returns a table as such:
      --   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
      sources = { 'nvim_diagnostic', 'coc', 'nvim_lsp' },

      -- Displays diagnostics for the defined severity types
      sections = { 'error', 'warn', 'info', 'hint' },

      diagnostics_color = {
        -- Same values as the general color option can be used here.
        error = 'red', -- Changes diagnostics' error color.
        warn  = 'yellow',  -- Changes diagnostics' warn color.
        info  = 'blue',  -- Changes diagnostics' info color.
        hint  = 'green',  -- Changes diagnostics' hint color.
      },
      symbols = {error = 'E', warn = 'W', info = 'I', hint = 'H'},
      colored = true,           -- Displays diagnostics status in color if set to true.
      update_in_insert = false, -- Update diagnostics in insert mode.
      always_visible = true,   -- Show diagnostics even if there are none.
    },
                },
                lualine_x = { 'ObsessionStatus' },
                lualine_y = { 'progress' },
                lualine_z = { 'location' }
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { 'filename' },
                lualine_x = { 'location' },
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = { 'fugitive' }
        }
    end
}
