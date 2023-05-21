return {
    'nyngwang/nvimgelion',
    config = function ()
        vim.api.nvim_create_autocmd({ 'ColorScheme', 'FileType' }, {
            callback = function ()
              vim.cmd([[
                hi IndentBlanklineChar gui=nocombine guifg=#444C55
                hi IndentBlanklineSpaceChar gui=nocombine guifg=#444C55
                hi IndentBlanklineContextChar gui=nocombine guifg=#FB5E2A
                hi IndentBlanklineContextStart gui=underline guisp=#FB5E2A
              ]])
            end,
          })
    end
  }