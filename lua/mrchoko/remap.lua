vim.keymap.set("n", " ", "<nop>")
vim.g.mapleader = " "

vim.keymap.set("n", "h", "<nop>")
vim.keymap.set("n", "j", "<nop>")
vim.keymap.set("n", "k", "<nop>")
vim.keymap.set("n", "l", "<nop>")
vim.keymap.set("v", "h", "<nop>")
vim.keymap.set("v", "j", "<nop>")
vim.keymap.set("v", "k", "<nop>")
vim.keymap.set("v", "l", "<nop>")


vim.keymap.set({ "n"}, "<leader>u", vim.cmd.UndotreeToggle)
vim.keymap.set({ "n"}, "<leader>t", ":ToggleTerm<CR>")
vim.keymap.set({ "n" }, "<leader>e", ":NvimTreeToggle<CR>")
vim.keymap.set({ "n" }, "<leader>r", ":TroubleToggle<CR>")

vim.keymap.set({ "n", }, "<C-j>","<C-W>h", {noremap=true})
vim.keymap.set({ "n", }, "<C-i>","<C-W>k", {noremap=true})
vim.keymap.set({ "n", }, "<C-k>","<C-W>j", {noremap=true})
vim.keymap.set({ "n", }, "<C-l>","<C-W>l", {noremap=true})
