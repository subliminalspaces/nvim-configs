
local opts = { noremap = true, silent = true }

-- Committing vim heresy
vim.keymap.set("n", "h", "")
vim.keymap.set("v", "h", "")

vim.keymap.set("n", "j", "")
vim.keymap.set("v", "j", "")

vim.keymap.set("n", "k", "")
vim.keymap.set("v", "k", "")

vim.keymap.set("n", "l", "")
vim.keymap.set("v", "l", "")


vim.keymap.set("n", "<C-h>", "",opts)
vim.keymap.set("v", "<C-h>", "",opts)


--Move  to first/middle/last line of screen. Simply not useful.
vim.keymap.set("n", "H", "")
vim.keymap.set("v", "H", "")
vim.keymap.set("n", "L", "")
vim.keymap.set("v", "L", "")
vim.keymap.set("n", "M", "")
vim.keymap.set("v", "M", "")

-- Colemak directional binding

vim.keymap.set({ 'n', 't' }, '<C-n>', ':wincmd h<CR>', opts)
vim.keymap.set({ 'n', 't' }, '<C-e>', ':wincmd j<CR>', opts)
vim.keymap.set({ 'n', 't' }, '<C-u>', ':wincmd k<CR>', opts)
vim.keymap.set({ 'n', 't' }, '<C-i>', ':wincmd l<CR>', opts)

-- Neoscroll

vim.keymap.set({ 'n', 'v' }, '<C-l>', ":lua require('neoscroll').scroll(-32,true,200,sine)<CR>", opts)
vim.keymap.set({ 'n', 'v' }, '<C-y>', ":lua require('neoscroll').scroll(32,true,200,sine)<CR>", opts)

-- Create File
vim.keymap.set({ 'n', 'v' }, '<C-a>', ":e %:h/")

-- Cokeline
vim.keymap.set('n', '<C-r>', '<Plug>(cokeline-focus-prev)')
vim.keymap.set('n', '<C-t>', '<Plug>(cokeline-focus-next)')
vim.keymap.set("n", "<leader>l", 
function()
    require('cokeline.mappings').pick("focus")
end, { desc = "Pick a buffer to focus" })


vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
vim.keymap.set({ "n" }, "<leader>u", vim.cmd.UndotreeToggle)
vim.keymap.set({ "n" }, "<leader>n", ":Neotree toggle=true position=left<CR>", opts)
vim.keymap.set({ "n" }, "<leader>e", ":TroubleToggle<CR>")
vim.keymap.set({ "n" }
    ,
    "<leader>f"
    , vim.lsp.buf.format
)

--Color Picker


vim.keymap.set("n", "<leader>cc", "<cmd>PickColor<cr>", opts)

vim.keymap.set("", "<C-c>", "<cmd>PickColorInsert<cr>", opts)


vim.keymap.set('n', '<C-k>', ':vsplit<CR>', opts)
vim.keymap.set('n', '<C-h>', ':split<CR>', opts)


local opts = { buffer = 0 }
vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)

-- Telescope

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>tg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>tf', builtin.current_buffer_fuzzy_find, {})
vim.keymap.set('n', '<leader>ts', builtin.grep_string, {})
vim.keymap.set('n', '<leader>tc', ":Telescope neoclip<CR>")

vim.keymap.set('i', '<S-Tab>', "<Tab>")
