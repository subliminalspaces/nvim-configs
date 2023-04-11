vim.opt.list = true
vim.opt.listchars:append "eol:↴"
vim.opt.listchars:append "space:⋅"
return {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
        show_current_context = true,
        show_current_context_start = true,
        show_end_of_line = true,
        space_char_blankline = " "
    }
}
