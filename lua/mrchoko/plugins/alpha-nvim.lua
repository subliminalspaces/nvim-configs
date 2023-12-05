return {
    'goolord/alpha-nvim',
    name = 'alpha',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local startify = require 'alpha.themes.startify'
        startify.section.header.val = {
            [[                                   __                ]],
            [[      ___     ___    ___   __  __ /\_\    ___ ___    ]],
            [[     / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
            [[    /\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
            [[    \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
            [[     \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
        }
        startify.section.top_buttons.val = {
            startify.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
        }
        -- disable MRU cwd
        -- startify.section.mru_cwd.val = { { type = "padding", val = 0 } }
        startify.nvim_web_devicons.enabled = true
        startify.nvim_web_devicons.highlight = true
        startify.nvim_web_devicons.highlight = 'Keyword'
        local query = require('possession.query')
        local workspaces = {
            {
                'Workspace A', -- title
                'a',           -- shortcuts prefix
                {
                    '/root/directory/a',
                    '/other/root/directory/',
                },
            },
            {
                'Workspace B',
                'b',
                '/root/directory/b',
            }
        }

        local create_button = function(shortcut, text, keymap)
            return require 'alpha.themes.startify'.button(shortcut, text, keymap)
        end

        local get_layout = function()
            return query.alpha_workspace_layout(workspaces, create_button, {
                others_name = 'Sessions Without Workspace',
            })
        end

        local utils = require('possession.utils')
        startify.section.mru.val = {
            { type = "padding", val = 0 },
            {
                type = 'group',
                val = utils.throttle(get_layout, 5000)
            }
        }
        startify.section.bottom_buttons.val = {
            startify.button("q", "󰅚  Quit NVIM", ":qa<CR>"),
        }
        startify.section.footer.val = {
            { type = "padding", val = 0 },
        }
        -- ignore filetypes in MRU
        -- startify.mru_opts.ignore = function(path, ext)
        --     return
        --         (string.find(path, "COMMIT_EDITMSG"))
        --         or (vim.tbl_contains(startify.default_mru_ignore, ext))
        -- end
        require 'alpha'.setup(startify.config)
    end
}
