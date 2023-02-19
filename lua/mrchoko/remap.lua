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
vim.keymap.set("n", "w", "")


--Comment

vim.keymap.set({ "n" }, "<leader>u", vim.cmd.UndotreeToggle)
vim.keymap.set({ "n" }, "<leader>t", ":ToggleTerm<CR>")
vim.keymap.set({ "n" }, "<leader>e", ":NvimTreeToggle<CR>")
vim.keymap.set({ "n" }, "<leader>r", ":TroubleToggle<CR>")
vim.keymap.set({ "n" }
  ,
  "<leader>i"
  , vim.lsp.buf.format
)

vim.keymap.set({ "n", }, "<C-j>", "<C-W>h", { noremap = true })
vim.keymap.set({ "n", }, "<C-i>", "<C-W>k", { noremap = true })
vim.keymap.set({ "n", }, "<C-k>", "<C-W>j", { noremap = true })
vim.keymap.set({ "n", }, "<C-l>", "<C-W>l", { noremap = true })

vim.keymap.set('n', '<leader>wo', ":horizontal split<CR>")
vim.keymap.set('n', '<leader>wu', ":vertical split<CR>")

vim.keymap.set('n', '<leader>wj', require('smart-splits').resize_left)
vim.keymap.set('n', '<leader>wk', require('smart-splits').resize_down)
vim.keymap.set('n', '<leader>wi', require('smart-splits').resize_up)
vim.keymap.set('n', '<leader>wl', require('smart-splits').resize_right)
