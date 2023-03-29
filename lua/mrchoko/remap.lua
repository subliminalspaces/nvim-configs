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

vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
vim.keymap.set({ "n" }, "<leader>u", vim.cmd.UndotreeToggle)
--vim.keymap.set({ "n" }, "<leader>t", ":ToggleTerm<CR>")
vim.keymap.set({ "n" }, "<leader>e", ":NvimTreeToggle<CR>")
vim.keymap.set({ "n" }, "<leader>r", ":TroubleToggle<CR>")
vim.keymap.set({ "n" }
  ,
  "<leader>i"
  , vim.lsp.buf.format
)
-- vim.keymap.set({ "n", }, "<C-j>", "<C-W>h", { noremap = true })
-- vim.keymap.set({ "n", }, "<C-i>", "<C-W>k", { noremap = true })
-- vim.keymap.set({ "n", }, "<C-k>", "<C-W>j", { noremap = true })
-- vim.keymap.set({ "n", }, "<C-l>", "<C-W>l", { noremap = true })
vim.keymap.set('n', '<leader>to', ":horizontal split<CR>")
vim.keymap.set('n', '<leader>th', ":vertical split<CR>")

vim.keymap.set('t', '<leader>wo', "")
vim.keymap.set('t', '<leader>wu', "")

vim.keymap.set({'n','t'}, '<C-j>', require('smart-splits').move_cursor_left)
vim.keymap.set({'n','t'}, '<C-k>', require('smart-splits').move_cursor_down)
vim.keymap.set({'n','t'}, '<C-i>', require('smart-splits').move_cursor_up)
vim.keymap.set({'n','t'}, '<C-l>', require('smart-splits').move_cursor_right)

vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

vim.keymap.set('n', '<leader>wj', require('smart-splits').resize_left)
vim.keymap.set('n', '<leader>wk', require('smart-splits').resize_down)
vim.keymap.set('n', '<leader>wi', require('smart-splits').resize_up)
vim.keymap.set('n', '<leader>wl', require('smart-splits').resize_right)

vim.keymap.set({'n','v'}, '<C-u>', ":lua require('neoscroll').scroll(-16,true,150)<CR>")
vim.keymap.set({'n','v'}, '<C-o>', ":lua require('neoscroll').scroll(16,true,150)<CR>")

local opts = {buffer = 0}
vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
-- vim.keymap.set('t', '<VC-j>', [[<Cmd>wincmd j<CR>]], opts)
-- vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
-- vim.keymap.set('t', '<C-i>', [[<Cmd>wincmd i<CR>]], opts)
-- vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)


local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})

vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fp', ":Telescope neoclip<CR>")
