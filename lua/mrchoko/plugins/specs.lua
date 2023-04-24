return {
    'edluffy/specs.nvim',
    name = 'specs',
    lazy = false,
    opts = {
    },
    init = function()
        require('specs').setup {
            show_jumps = true,
            min_jump = 9,
            popup = {
                delay_ms = 0,
                inc_ms = 11,
                blend = 70,
                width = 25,
                winhl = "NormalFloat",
                fader = require('specs').exp_fader,
                resizer = require('specs').slide_resizer
            },
            ignore_filetypes = {
            },
            ignore_buftypes = {
                nofile = true,
            }
        }
    end
}
