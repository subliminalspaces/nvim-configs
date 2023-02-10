vim.keymap.set("n", " ", "<nop>")
vim.g.mapleader = " "


vim.keymap.set("n", "j", "")
vim.keymap.set("n", "k", "")
vim.keymap.set("n", "l", "")
vim.keymap.set("n", "h", "")


vim.keymap.set("v", "j", "")
vim.keymap.set("v", "k", "")
vim.keymap.set("v", "l", "")
vim.keymap.set("v", "h", "")

--vim.keymap.set("n", "h", "<nop>")
--vim.keymap.set("n", "j", "<nop>")
--vim.keymap.set("n", "k", "<nop>")
--vim.keymap.set("n", "l", "<nop>")
--vim.keymap.set("v", "h", "<nop>")
--vim.keymap.set("v", "j", "<nop>")
--vim.keymap.set("v", "k", "<nop>")
--vim.keymap.set("v", "l", "<nop>")


vim.keymap.set({ "n"}, "<leader>u", vim.cmd.UndotreeToggle)
vim.keymap.set({ "n"}, "<leader>t", ":ToggleTerm<CR>")
vim.keymap.set({ "n" }, "<leader>e", ":NvimTreeToggle<CR>")
vim.keymap.set({ "n" }, "<leader>r", ":TroubleToggle<CR>")

vim.keymap.set('n', '<leader>wj', require('smart-splits').resize_left)
vim.keymap.set('n', '<leader>wk', require('smart-splits').resize_down)
vim.keymap.set('n', '<leader>wi', require('smart-splits').resize_up)
vim.keymap.set('n', '<leader>wl', require('smart-splits').resize_right)
