-- Committing vim heresy
vim.keymap.set("n", "h", "")
vim.keymap.set("v", "h", "")

vim.keymap.set("n", "j", "")
vim.keymap.set("v", "j", "")

vim.keymap.set("n", "k", "")
vim.keymap.set("v", "k", "")

vim.keymap.set("n", "l", "")
vim.keymap.set("v", "l", "")
--Same as CR, would rather just use CR
vim.keymap.set("n", "<C-M>", "")
vim.keymap.set("v", "<C-M>", "")


--Move  to first/middle/last line of screen. Simply not useful.
vim.keymap.set("n", "H", "")
vim.keymap.set("v", "H", "")
vim.keymap.set("n", "L", "")
vim.keymap.set("v", "L", "")
vim.keymap.set("n", "M", "")
vim.keymap.set("v", "M", "")

-- Colemak directional binding

vim.keymap.set({ 'n', 't' }, '<C-n>', ':wincmd h<CR>')
vim.keymap.set({ 'n', 't' }, '<C-e>', ':wincmd j<CR>')
vim.keymap.set({ 'n', 't' }, '<C-u>', ':wincmd k<CR>')
vim.keymap.set({ 'n', 't' }, '<C-i>', ':wincmd l<CR>')

-- Neoscroll

vim.keymap.set({ 'n', 'v' }, '<C-l>', ":lua require('neoscroll').scroll(-32,true,200,sine)<CR>")
vim.keymap.set({ 'n', 'v' }, '<C-y>', ":lua require('neoscroll').scroll(32,true,200,sine)<CR>")

-- Cokeline
vim.keymap.set('n', '<C-m>', '<Plug>(cokeline-focus-prev)')
vim.keymap.set('n', '<C-o>', '<Plug>(cokeline-focus-next)')

vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
vim.keymap.set({ "n" }, "<leader>u", vim.cmd.UndotreeToggle)
vim.keymap.set({ "n" }, "<leader>e", ":Neotree toggle=true position=left<CR>")
vim.keymap.set({ "n" }, "<leader>t", ":TroubleToggle<CR>")
vim.keymap.set({ "n" }
    ,
    "<leader>i"
    , vim.lsp.buf.format
)

--Color Picker

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>cc", "<cmd>PickColor<cr>", opts)

vim.keymap.set("", "<C-c>", "<cmd>PickColorInsert<cr>", opts)


vim.keymap.set('n', '<leader>wy', ':vsplit<CR>')
vim.keymap.set('n', '<leader>wm', ':split<CR>')


local opts = { buffer = 0 }
vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)

-- Telescope

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fd', builtin.current_buffer_fuzzy_find, {})
vim.keymap.set('n', '<leader>fs', builtin.grep_string, {})
vim.keymap.set('n', '<leader>fa', ":Telescope neoclip<CR>")

