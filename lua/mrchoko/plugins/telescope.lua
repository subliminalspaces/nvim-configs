return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    lazy = true,
    dependencies = {
        { 'nvim-lua/plenary.nvim' },
        { 'AckslD/nvim-neoclip.lua' } },
    opts = {
        defaults = {
            border = true,
            mappings = {
                n = {
                    ["h"] = "which_key"
                },
                i = {
                    ["<C-h>"] = "which_key"
                }
            }
        },
        pickers = {
            colorscheme = {
                enable_preview = true
            }
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
