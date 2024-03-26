return {
    'kevinhwang91/nvim-ufo',
    enabled = true,
    dependencies = {
        'kevinhwang91/promise-async',
        'nvim-treesitter/nvim-treesitter'
    },
    config = function()
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities.textDocument.foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true
        }
        local language_servers = require("lspconfig").util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
        for _, ls in ipairs(language_servers) do
            require('lspconfig')[ls].setup({
                capabilities = capabilities
                -- you can add other fields for setting up lsp server in this table
            })
        end
        require('ufo').setup(
            {
                open_fold_hl_timeout = 400,
                provider_selector = nil,
                close_fold_kinds_for_ft = {},

                fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
                    local newVirtText = {}
                    local suffix = (' 󰁂 %d '):format(endLnum - lnum)
                    local sufWidth = vim.fn.strdisplaywidth(suffix)
                    local targetWidth = width - sufWidth
                    local curWidth = 0
                    for _, chunk in ipairs(virtText) do
                        local chunkText = chunk[1]
                        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
                        if targetWidth > curWidth + chunkWidth then
                            table.insert(newVirtText, chunk)
                        else
                            chunkText = truncate(chunkText, targetWidth - curWidth)
                            local hlGroup = chunk[2]
                            table.insert(newVirtText, { chunkText, hlGroup })
                            chunkWidth = vim.fn.strdisplaywidth(chunkText)
                            -- str width returned from truncate() may less than 2nd argument, need padding
                            if curWidth + chunkWidth < targetWidth then
                                suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
                            end
                            break
                        end
                        curWidth = curWidth + chunkWidth
                    end
                    table.insert(newVirtText, { suffix, 'MoreMsg' })
                    return newVirtText
                end,
                enable_get_fold_virt_text = false,
                preview = {
                    win_config = {
                        border = 'rounded',
                        winblend = 12,
                        winhighlight = 'Normal:Normal',
                        maxheight = 20,
                    },
                }
            }
        -- {
        --     provider_selector = function(bufnr, filetype, buftype)
        --         return { 'treesitter', 'indent' }
        --     end
        -- }
        )
        vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
        vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
        vim.keymap.set('n', 'zr', require('ufo').openFoldsExceptKinds)
        vim.keymap.set('n', 'zm', require('ufo').closeFoldsWith) -- closeAllFolds == closeFoldsWith(0)
        vim.keymap.set('n', 'K', function()
            local winid = require('ufo').peekFoldedLinesUnderCursor()
            if not winid then
                -- choose one of coc.nvim and nvim lsp
                vim.fn.CocActionAsync('definitionHover') -- coc.nvim
                vim.lsp.buf.hover()
            end
        end)
    end
}
