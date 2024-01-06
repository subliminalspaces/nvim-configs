local highlight = {
    'RainbowDelimiterRed',
    'RainbowDelimiterYellow',
    'RainbowDelimiterBlue',
    'RainbowDelimiterOrange',
    'RainbowDelimiterGreen',
    'RainbowDelimiterViolet',
    'RainbowDelimiterCyan',
}
return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    dependencies = {
        'HiPhish/rainbow-delimiters.nvim',
    },
    config = function()
        local opts = {
            indent = {
                highlight = highlight,
                char = "▎", -- "▋"
                -- tab_char = "",     Default: uses |lcs-tab| if |'list'| is set, otherwise, uses |ibl.config.indent.char| ~
                smart_indent_cap = true,
                priority = 1,
                repeat_linebreak = true
            },
            whitespace = {
                highlight = {
                    "CursorColumn",
                    "Whitespace",
                },
                remove_blankline_trail = false,
            },
            scope = {
                enabled = false,
                char = "▎",
                show_start = true,
                show_end = true,
                show_exact_scope = false,
                injected_languages = true,
                highlight = {
                    -- 'hl-IblScope'
                    'Function',
                    -- 'Label'
                },
                priority = 1024,
            },
        }
        require('ibl').setup(opts)
    end
}
