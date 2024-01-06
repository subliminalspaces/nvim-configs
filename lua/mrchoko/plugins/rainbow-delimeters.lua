return {
    'HiPhish/rainbow-delimiters.nvim',
    enabled= true,
    config = function()
    local rainbow_delimiters = require 'rainbow-delimiters'
        vim.g.rainbow_delimiters = {
            strategy = {
                [''] = rainbow_delimiters.strategy['global'],
            },
            query = {
                [''] = 'rainbow-delimiters',
                lua = 'rainbow-blocks',
                -- javascript = 'rainbow-delimiters-react',
                -- tsx = 'rainbow-parens'
            },
            highlight = {
                'RainbowDelimiterRed',
                'RainbowDelimiterYellow',
                'RainbowDelimiterBlue',
                'RainbowDelimiterOrange',
                'RainbowDelimiterGreen',
                'RainbowDelimiterViolet',
                'RainbowDelimiterCyan',
            },
            blacklist = { },
        }

        local hooks = require "ibl.hooks"
        -- create the highlight groups in the highlight setup hook, so they are reset
        -- every time the colorscheme changes
        hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
            vim.api.nvim_set_hl(0, "RainbowDelimiterRed", { fg = "#E06C75" })
            vim.api.nvim_set_hl(0, "RainbowDelimiterYellow", { fg = "#E5C07B" })
            vim.api.nvim_set_hl(0, "RainbowDelimiterBlue", { fg = "#61AFEF" })
            vim.api.nvim_set_hl(0, "RainbowDelimiterOrange", { fg = "#D19A66" })
            vim.api.nvim_set_hl(0, "RainbowDelimiterGreen", { fg = "#98C379" })
            vim.api.nvim_set_hl(0, "RainbowDelimiterViolet", { fg = "#C678DD" })
            vim.api.nvim_set_hl(0, "RainbowDelimiterCyan", { fg = "#56B6C2" })
        end)
    end
}
