return {
    'mikesmithgh/kitty-scrollback.nvim',
    enabled = true,
    version = '*',
    lazy = true,
    cmd = { 'KittyScrollbackGenerateKittens', 'KittyScrollbackCheckHealth' },
    event = { 'User KittyScrollbackLaunch' },
    -- version = '*', -- latest stable version, may have breaking changes if major version changed
    -- version = '^2.0.0', -- pin major version, include fixes and features that do not have breaking changes
    config = function()
        local prefix = 'ksb_builtin_'
        require('kitty-scrollback').setup({

            [prefix .. 'get_text_all_plain'] = function()

                return {
                    paste_window = {
                        winbled = 50,
                        yank_register = '*',
                        yank_register_enabled = true
                    },
                    kitty_get_text = {
                        extent = 'all',
                        ansi = false,
                    },
                }
            end,
            [prefix .. 'get_text_last_non_empty_output_plain'] = function()
                return {
                    paste_window = {
                        winbled = 50,
                        yank_register = '*',
                        yank_register_enabled = true
                    },
                    kitty_get_text = {
                        extent = 'last_non_empty_output',
                        ansi = false,
                    },
                }
            end,
            -- [prefix .. 'last_visited_cmd_output'] = function()
            --     return {
                    -- paste_window = {
                    --     yank_register = '_',
                    --     yank_register_enabled = true
                    -- },
            --         kitty_get_text = {
            --             extent = 'last_visited_cmd_output',
            --             ansi = true,
            --         },
            --     }
            -- end,
            [prefix .. 'checkhealth'] = function()
                return {
                    checkhealth = true,
                }
            end,
        })
    end,
}
