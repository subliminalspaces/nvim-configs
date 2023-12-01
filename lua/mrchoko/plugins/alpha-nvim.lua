return {
    'goolord/alpha-nvim',
    name = 'alpha',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local startify = require'alpha.themes.startify'
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
        -- disable MRU
        -- startify.section.mru = {
        --         type = "group",
        --         val = {
        --     { type = "padding", val = 1 },
        --     { type = "text", val = "MRU", opts = { hl = "SpecialComment" } },
        --     { type = "padding", val = 1 },
        --     {
        --         type = "group",
        --         val = function()
        --             return { mru(10) }
        --         end,
        --     },
        -- },
    -- }
        --
            -- disable MRU
            startify.section.mru.val = { { type = "padding", val = 0 } }
        -- disable MRU cwd
        -- startify.section.mru_cwd.val = { { type = "padding", val = 0 } }
        -- disable nvim_web_devicons
        -- startify.nvim_web_devicons.enabled = false
        -- startify.nvim_web_devicons.highlight = false
        -- startify.nvim_web_devicons.highlight = 'Keyword'
        -- local query = require('possession.query')
        -- local workspaces = {
        --     {
        --         'Workspace A', -- title
        --         'a',           -- shortcuts prefix
        --         {
        --             '/root/directory/a',
        --             '/other/root/directory/',
        --         },
        --     }, {
        --     'Workspace B',
        --     'b',
        --     '/root/directory/b',
        -- }
        -- }
        -- e.g. https://github.com/goolord/alpha-nvim/blob/8a1477d8b99a931530f3cfb70f6805b759bebbf7/lua/alpha/themes/startify.lua#L28
        -- local create_button = function(shortcut, text, keymap)
        --     return require 'alpha.themes.startify'.button(shortcut, text, keymap)
        -- end
        --
        -- local get_layout = function()
        --     return query.alpha_workspace_layout(workspaces, create_button, {
        --         others_name = 'Sessions Without Workspace',
        --     })
        -- end
        --
        -- local utils = require('possession.utils')
        -- startify.section.sessions = {
        --     type = 'group',
        --     val = utils.throttle(get_layout, 5000)
        -- }
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

        -- use with the rest of sections for alpha.nvim, with throttling to avoid reading files on each redraw
    end
}
