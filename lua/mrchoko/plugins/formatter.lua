return {
    'mhartington/formatter.nvim',
    enabled = false,
    dependencies = {
        { "ckipp01/stylua-nvim", build = "cargo install stylua" } 
},
    config = function()
     -- local util = require"formatter.util"
        return {
            -- Enable or disable logging
            logging = true,
            -- Set the log level
            log_level = vim.log.levels.WARN,
            -- All formatter configurations are opt-in
            filetype = {
                javascript = {
                    function()
                        local eslint = require("formatter.filetypes.javascript").eslint
                        eslint.try_node_modules = true
                        return eslint
                    end
                },
                lua = {
                    -- "lua" filetype
                    -- function()
                    --     vim.lsp.buf.format({ async = true })
                    -- end,
                    -- function()
                    -- Supports conditional formatting
                    -- if util.get_current_buffer_file_name() == "special.lua" then
                    --     return nil
                    -- end
                    --
                    -- Full specification of configurations is down below and in Vim help
                    -- files
                    --         return {
                    --             exe = "stylua",
                    --             args = {
                    --                 "--search-parent-directories",
                    --                 "--stdin-filepath",
                    --                 -- util.escape_path(util.get_current_buffer_file_path()),
                    -- "--",
                    --                 "-",
                    --             },
                    --             stdin = true,
                    --         }
                    -- end
                },
                ["*"] = {
                    require("formatter.filetypes.any").remove_trailing_whitespace
                }
            }
        }
    end
}
