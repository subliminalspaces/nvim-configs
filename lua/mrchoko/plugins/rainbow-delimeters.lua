return {
    'HiPhish/rainbow-delimiters.nvim',
    config = function()
    local rainbow_delimiters = require 'rainbow-delimiters'
        vim.g.rainbow_delimiters = {
            strategy = {
                [''] = rainbow_delimiters.strategy['global'],
            },
            query = {
                [''] = 'rainbow-delimiters',
                lua = 'rainbow-blocks',
                javascript = 'rainbow-delimiters-react',
                tsx = 'rainbow-parens'
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
    end
}
