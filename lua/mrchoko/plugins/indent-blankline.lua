 vim.opt.list = true
vim.opt.listchars:append "eol:↴"
vim.opt.listchars:append "space"
return {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
    },
     version = "3.3.2",
     main = "ibl"
}
