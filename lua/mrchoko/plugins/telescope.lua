return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.1",
    lazy = true,
    dependencies = { { 'nvim-lua/plenary.nvim' }, { 'AckslD/nvim-neoclip.lua' } },
    opts = {
        defaults = {
            -- Default configuration for telescope goes here:
            -- config_key = value,
            mappings = {
                i = {
                    -- map actions.which_key to <C-h> (default: <C-/>)
                    -- actions.which_key shows the mappings for your picker,
                    -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                    ["<C-h>"] = "which_key"
                }
            }
        },
        pickers = {
            -- Default configuration for builtin pickers goes here:
            -- picker_name = {
            --   picker_config_key = value,
            --   ...
            -- }
            -- Now the picker_config_key will be applied every time you call this
            -- builtin picker
        },
        extensions = {
            -- Your extension configuration goes here:
            extension_name = {
                neoclip = {
                    history = 1000,
                    enable_persistent_history = true,
                    length_limit = 1048576,
                    continuous_sync = true,
                    db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3",
                    filter = nil,
                    preview = true,
                    prompt = nil,
                    default_register = '"',
                    extra = 'unnamedplus',
                    default_register_macros = 'q',
                    enable_macro_history = false,
                    content_spec_column = false,
                    on_select = {
                        move_to_front = false,
                        close_telescope = true,
                    },
                    on_paste = {
                        set_reg = false,
                        move_to_front = false,
                        close_telescope = true,
                    },
                    on_replay = {
                        set_reg = false,
                        move_to_front = false,
                        close_telescope = true,
                    },
                    on_custom_action = {
                        close_telescope = true,
                    },
                    keys = {
                        telescope = {
                            -- i = {
                            --     select = '<cr>',
                            --     paste = '<c-p>',
                            --     paste_behind = '<c-k>',
                            --     replay = '<c-q>', -- replay a macro
                            --     delete = '<c-d>', -- delete an entry
                            --     edit = '<c-e>', -- edit an entry
                            --     custom = {},
                            -- },
                            n = {
                                select = '<cr>',
                                paste = 'p',
                                --- It is possible to map to more than one key.
                                -- paste = { 'p', '<c-p>' },
                                paste_behind = 'P',
                                replay = 'q',
                                delete = 'd',
                                edit = 'e',
                                custom = {},
                            },
                        },
                    },
                }
            }
        }
        -- please take a look at the readme of the extension you want t eo configure
    }
}
