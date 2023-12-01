return {
    'nyoom-engineering/oxocarbon.nvim',
    lazy = true,
    name = 'oxocarbon',
    config = function()
        vim.opt.background = "dark"
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end
}
