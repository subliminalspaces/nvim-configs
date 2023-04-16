return {
    'wfxr/minimap.vim',
    name = "minimap",
    enabled = false,
    init = function()
        vim.g.minimap_width = 10
        vim.g.minimap_auto_start = 0
        vim.g.minimap_auto_start_win_enter = 0
        vim.g.minimap_window_width_override_for_scaling = 2147483647
        vim.g.minimap_base_highlight = 'Normal'
        vim.g.minimap_block_filetypes = {
            'fugitive',
            'tagbar',
            'fxf',
            'alpha',
            'nvim-tree',
            'NvimTree'
        }
        vim.g.minimap_block_buftypes = {
            'nofile',
            'nowrite',
            'quickfix',
            'terminal',
            'prompt',
            'scratch',
            'nvimtree',
            'alpha',
            'NvimTree'
        }
        vim.g.minimap_close_filetypes = {
            'fugitive',
            'tagbar',
            'fxf',
            'alpha',
            'nvim-tree',
            'NvimTree'
        }

        vim.g.minimap_close_buftypes = {
            'nofile',
            'nowrite',
            'quickfix',
            'terminal',
            'prompt',
            'scratch',
            'nvimtree',
            'alpha',
            'NvimTree'
        }
        vim.g.minimap_left = 0
        vim.g.minimap_highlight_range = 1
        vim.g.minimap_highlight_search = 0
        vim.g.minimap_background_processing = 0
        vim.g.minimap_git_colors = 1
        vim.g.minimap_enable_highlight_colorgroup = 1
    end
}
