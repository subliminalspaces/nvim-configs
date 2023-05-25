-- Committing vim heresy

vim.keymap.set("n", "j", "")
vim.keymap.set("v", "j", "")
vim.keymap.set("n", "<C-N>", "")
vim.keymap.set("v", "<C-N>", "")
vim.keymap.set("n", "<C-J>", "")
vim.keymap.set("v", "<C-J>", "")

vim.keymap.set("n", "k", "")
vim.keymap.set("v", "k", "")
vim.keymap.set("n", "<C-P>", "")
vim.keymap.set("v", "<C-P>", "")

vim.keymap.set("n", "l", "")
vim.keymap.set("v", "l", "")

vim.keymap.set("n", "h", "")
vim.keymap.set("v", "h", "")

vim.keymap.set("n", "h", "")
vim.keymap.set("n", "<C-H>", "")
vim.keymap.set("v", "<C-H>", "")

--Same as CR, would rather just use CR
vim.keymap.set("n", "<C-M>", "")
vim.keymap.set("v", "<C-M>", "")

--Unbinding some things that just aren't useful. Rationale provided.

--Move  to first/middle/last line of screen. Simply not useful.
vim.keymap.set("n", "H", "")
vim.keymap.set("v", "H", "")
vim.keymap.set("n", "L", "")
vim.keymap.set("v", "L", "")
vim.keymap.set("n", "M", "")
vim.keymap.set("v", "M", "")



vim.keymap.set("n", "k", "")
vim.keymap.set("n", "l", "")
vim.keymap.set("n", "h", "")

vim.keymap.set("v", "k", "")
vim.keymap.set("v", "l", "")
vim.keymap.set("v", "h", "")
vim.keymap.set("n", "w", "")

-- Colemak directional binding

vim.keymap.set({ 'n', 't' }, '<C-n>', ':wincmd h<CR>')
vim.keymap.set({ 'n', 't' }, '<C-e>', ':wincmd j<CR>')
vim.keymap.set({ 'n', 't' }, '<C-u>', ':wincmd k<CR>')
vim.keymap.set({ 'n', 't' }, '<C-i>', ':wincmd l<CR>')

-- Neoscroll

vim.keymap.set({ 'n', 'v' }, '<C-l>', ":lua require('neoscroll').scroll(-32,true,200,sine)<CR>")
vim.keymap.set({ 'n', 'v' }, '<C-y>', ":lua require('neoscroll').scroll(32,true,200,sine)<CR>")

-- Cokeline

vim.keymap.set('n', '<C-j>',   '<Plug>(cokeline-focus-prev)',  { silent = true })
vim.keymap.set('n', '<C-m>',     '<Plug>(cokeline-focus-next)',  { silent = true })

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

vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

vim.keymap.set('t', '<leader>wo', "")
vim.keymap.set('t', '<leader>wu', "")

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

local api = require('nvim-tree.api')
