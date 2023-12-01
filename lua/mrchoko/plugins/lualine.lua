return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
        options = {
            icons_enabled = true,
            theme = 'auto',
            component_separators = { left = '', right = '' },
            section_separators = { left = '', right = '' },
            disabled_filetypes = {
                statusline = { 'neo-tree' },
                winbar = { 'neo-tree', 'Trouble' },
            },
            ignore_focus = {},
            always_divide_middle = true,
            globalstatus = true,
            refresh = {
                statusline = 1000,
                tabline = 1000,
                winbar = 1000,
            }
        },
        sections = {
            lualine_a = { 'mode' },
            lualine_b = { 'branch' },
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
                    symbols = { added = '+', modified = '~', removed = '-' }, -- Changes the symbols used by the diff.
                    -- A function that works as a data source for diff.
                    -- It must return a table as such:
                    -- or nil on failure. count <= 0 won't be displayed.
                },
            },
            lualine_x = {
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
                        error = 'red',    -- Changes diagnostics' error color.
                        warn  = 'yellow', -- Changes diagnostics' warn color.
                        info  = 'blue',   -- Changes diagnostics' info color.
                        hint  = 'green',  -- Changes diagnostics' hint color.
                    },
                    symbols = { error = 'Err ', warn = 'Warn ', info = 'Info ', hint = 'Hint ' },
                    colored = false,          -- Displays diagnostics status in color if set to true.
                    update_in_insert = false, -- Update diagnostics in insert mode.
                    always_visible = true,    -- Show diagnostics even if there are none.
                },
            },
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
        winbar = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {
                {
                    'filename',
                    file_status = true,     -- Displays file status (readonly status, modified status)
                    newfile_status = false, -- Display new file status (new file means no write after created)
                    path = 0,               -- 0: Just the filename
                    -- 1: Relative path
                    -- 2: Absolute path
                    -- 3: Absolute path, with tilde as the home directory
                    -- 4: Filename and parent dir, with tilde as the home directory

                    shorting_target = 40, -- Shortens path to leave 40 spaces in the window
                    -- for other components. (terrible name, any suggestions?)
                    symbols = {
                        modified = '[+]',      -- Text to show when the file is modified.
                        readonly = '[-]',      -- Text to show when the file is non-modifiable or readonly.
                        unnamed = '[No Name]', -- Text to show for unnamed buffers.
                        newfile = '[New]',     -- Text to show for newly created file before first write
                    }
                }
            },
            lualine_x = {},
            lualine_y = {},
            lualine_z = {}
        },
        inactive_winbar = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {
                {
                    'filename',
                    file_status = true, -- Displays file status (readonly status, modified status)
                    newfile_status = false, -- Display new file status (new file means no write after created)
                    path = 0,           -- 0: Just the filename
                    -- 1: Relative path
                    -- 2: Absolute path
                    -- 3: Absolute path, with tilde as the home directory
                    -- 4: Filename and parent dir, with tilde as the home directory

                    shorting_target = 40, -- Shortens path to leave 40 spaces in the window
                    -- for other components. (terrible name, any suggestions?)
                    symbols = {
                        modified = '[+]',  -- Text to show when the file is modified.
                        readonly = '[-]',  -- Text to show when the file is non-modifiable or readonly.
                        unnamed = '[No Name]', -- Text to show for unnamed buffers.
                        newfile = '[New]', -- Text to show for newly created file before first write
                    }
                }
            },
            lualine_x = {},
            lualine_y = {},
            lualine_z = {}
        },
        extensions = {}
    }
}
