return {
    'willothy/nvim-cokeline',
    name = 'cokeline',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = function()
        local is_picking_focus = require("cokeline/mappings").is_picking_focus
        local is_picking_close = require("cokeline/mappings").is_picking_close
        local get_hex = require("cokeline/utils").get_hex

        local red = vim.g.terminal_color_1
        local yellow = vim.g.terminal_color_4
        local space = { text = " " }
        local dark = get_hex("Normal", "bg")
        local text = get_hex("Comment", "fg")
        local grey = get_hex("ColorColumn", "bg")
        local light = get_hex("Comment", "fg")
        local high = "#a6d120"
        return
        {
            show_if_buffers_are_at_least = 1,

            buffers = {
                filter_valid = function(buffer)
                    return true
                end,

                filter_visible = function(buffer)
                    return true
                end,

                -- default: 'next'.
                focus_on_delete = 'prev',

                -- options 'last, next directory, number'.
                new_buffers_position = 'next',

                delete_on_right_click = true,
            },

            mappings = {
                cycle_prev_next = true,
            },

            rendering = {
                max_buffer_width = 30,
            },

            pick = {
                use_filename = true,
                letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERTYQP',
            },

            -- The default highlight group values.
            -- The `fg` and `bg` keys are either colors in hexadecimal format or
            -- functions taking a `buffer` parameter and returning a color in
            -- hexadecimal format. Similarly, the `style` key is either a string
            -- containing a comma separated list of items in `:h attr-list` or a
            -- function returning one.
            default_hl = {
                fg = function(buffer)
                    if buffer.is_focused then
                        return light
                    end
                    return dark
                end,
                bg = function(buffer)
                    if buffer.is_focused then
                        return dark
                    end
                    return light
                end
            },
            components = {
                space,
                {
                    text = function(buffer)
                        if is_picking_focus() or is_picking_close() then
                            return buffer.pick_letter .. " "
                        end

                        return buffer.devicon.icon
                    end,
                    fg = function(buffer)
                        if is_picking_focus() then
                            return grey
                        end
                        if is_picking_close() then
                            return grey
                        end

                        if buffer.is_focused then
                            return grey
                        else
                            return grey
                        end
                    end,
                    style = function(_)
                        return (is_picking_focus() or is_picking_close()) and "italic,bold" or nil
                    end
                },
                {
                    text = function(buffer)
                        return buffer.unique_prefix .. buffer.filename .. "⠀"
                    end,
                    style = function(buffer)
                        return buffer.is_focused and "bold" or nil
                    end
                },
                space
            },
            sidebar = {
                filetype = 'neo-tree',
                components = {
                    {
                        text = '  NvimTree',
                        fg = vim.g.terminal_color_3,
                        bg = vim.g.terminal_color_4,
                        style = 'bold',
                    },
                }
            },
        }
    end
}
