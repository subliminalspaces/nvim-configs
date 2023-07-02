return {
    'edluffy/specs.nvim',
    name = 'specs',
    lazy = false,
    opts = {
    },
    init = function()
        require('specs').setup {
            show_jumps = true,
            min_jump = 7,
            popup = {
                delay_ms = 0,
                inc_ms = 22,
                blend = 70,
                width = 30,
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
