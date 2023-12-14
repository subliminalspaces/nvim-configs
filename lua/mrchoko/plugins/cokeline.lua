return {
    'willothy/nvim-cokeline',
    name = 'cokeline',
    lazy = false,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = function()
        local is_picking_focus = require("cokeline/mappings").is_picking_focus
        local is_picking_close = require("cokeline/mappings").is_picking_close
        local get_hl_attr = require("cokeline.hlgroups").get_hl_attr
        local red = vim.g.terminal_color_1
        local yellow = vim.g.terminal_color_3
        local space = { text = " " }
        local dark = get_hl_attr("Normal", "bg")
        local text = get_hl_attr("Comment", "fg")
        local grey = get_hl_attr("Normal", "bg")
        local light = get_hl_attr("Comment", "fg")
        local high = vim.g.terminal_color_6
        return
        {
            show_if_buffers_are_at_least = 0,
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

                    if buffer.diagnostics.errors > 0 then
                        return get_hl_attr("LspDiagnosticsDefaultError", "fg")
                    end

                    if buffer.diagnostics.warnings > 0 then
                        return get_hl_attr("LSPDiagnosticsDefaultWarning", "fg")
                    end
                    if buffer.is_focused then
                        return dark
                    end
                    return light
                end,
                bg = function(buffer)
                    if buffer.is_focused then
                        return light
                    end
                    return dark
                end
            },
            components = {
                -- {
                --     text = function(buffer)
                --         -- if is_picking_focus() or is_picking_close() then
                --         return buffer.pick_letter .. " "
                --         -- end
                --
                --         -- return buffer.devicon.icon
                --     end,
                --     fg = function(buffer)
                --         if is_picking_focus() then
                --             return grey
                --         end
                --         if is_picking_close() then
                --             return grey
                --         end
                --
                --         if buffer.is_focused then
                --             return grey
                --         else
                --             return grey
                --         end
                --     end,
                --     style = function(_)
                --         return (is_picking_focus() or is_picking_close()) and "italic,bold" or nil
                --     end
                -- },
                {
                    text = function(buffer)
                        if buffer.is_modified then
                            return "[+]"
                        else
                            return ""
                        end
                    end,
                    style = function(buffer)
                        return buffer.is_focused and "grey" or "grey"
                    end
                },
                space,
                {
                    text = function(buffer)
                        return buffer.unique_prefix .. buffer.filename .. "⠀"
                    end,
                    style = function(buffer)
                        return buffer.is_focused and "bold" or nil
                    end
                },
                -- space
            },
            sidebar = {
                filetype = 'neo-tree',
                components = {
                    {
                        text = function(buf)
                            return buf.filetype
                        end,
                        fg = grey,
                        bg = dark,
                        style = 'bold',
                    },
                }
            },
        }
    end
}
