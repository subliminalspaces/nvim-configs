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
vim.keymap.set("n", "<C-h>", "", opts)
vim.keymap.set("v", "<C-h>", "", opts)

--Move  to first/middle/last line of screen. Simply not useful.
vim.keymap.set("n", "H", "")
vim.keymap.set("v", "H", "")
vim.keymap.set("n", "L", "")
vim.keymap.set("v", "L", "")
vim.keymap.set("n", "M", "")
vim.keymap.set("v", "M", "")

vim.keymap.set("v", "<C-m>", "", opts)
vim.keymap.set("n", "r", ":redo<CR>", opts)
--Splits
vim.keymap.set('n', '<C-k>', ':vsplit<CR>', opts)
vim.keymap.set('n', '<C-h>', ':split<CR>', opts)

-- Colemak directional binding
vim.keymap.set({ 'n', 't' }, '<C-n>', ':wincmd h<CR>', opts)
vim.keymap.set({ 'n', 't' }, '<C-e>', ':wincmd j<CR>', opts)
vim.keymap.set({ 'n', 't' }, '<C-u>', ':wincmd k<CR>', opts)
vim.keymap.set({ 'n', 't' }, '<C-i>', ':wincmd l<CR>', opts)

-- moving between splits
vim.keymap.set('n', '<C-n>', require('smart-splits').move_cursor_left)
vim.keymap.set('n', '<C-e>', require('smart-splits').move_cursor_down)
vim.keymap.set('n', '<C-u>', require('smart-splits').move_cursor_up)
vim.keymap.set('n', '<C-i>', require('smart-splits').move_cursor_right)

-- Neoscroll
vim.keymap.set({ 'n', 'v' }, '<C-l>', ":lua require('neoscroll').scroll(-32,true,200,sine)<CR>", opts)
vim.keymap.set({ 'n', 'v' }, '<C-y>', ":lua require('neoscroll').scroll(32,true,200,sine)<CR>", opts)

-- Create File
vim.keymap.set({ 'n', 'v' }, '<C-a>', ":e %:h/")

-- Cokeline
vim.keymap.set('n', '<C-r>', '<Plug>(cokeline-focus-prev)')
vim.keymap.set('n', '<C-t>', '<Plug>(cokeline-focus-next)')
-- Neotree
vim.keymap.set('n', '<C-j>', ':Neotree action=focus<CR>')


--Color Picker
vim.keymap.set("", "<C-c>", "<cmd>PickColorInsert<cr>", opts)
vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], { buffer = 0 })

--Leader Bindings
vim.keymap.set("n", "<leader>l",
    function()
        require('cokeline.mappings').pick("focus")
    end, { desc = "Pick a buffer to focus" }
)
local kopts = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', 'n',
    [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
    kopts)
vim.api.nvim_set_keymap('n', 'N',
    [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
    kopts)
vim.api.nvim_set_keymap('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)

vim.api.nvim_set_keymap('n', '<esc>', '<Cmd>noh<CR>', kopts)
-- resizing splits

vim.keymap.set('n', '<leader>wn', require('smart-splits').resize_left)
vim.keymap.set('n', '<leader>we', require('smart-splits').resize_down)
vim.keymap.set('n', '<leader>wu', require('smart-splits').resize_up)
vim.keymap.set('n', '<leader>wi', require('smart-splits').resize_right)


vim.keymap.set({ 'n' }, 's', '<Plug>(leap-forward-to)')
vim.keymap.set({ 'n' }, 'S', '<Plug>(leap-backward-to)')

vim.keymap.set({ 'x', 'o' }, 'j', '<Plug>(leap-forward-till)')
vim.keymap.set({ 'x', 'o' }, 'J', '<Plug>(leap-backward-till)')

vim.keymap.set({ 'n' }, 'gs', '<Plug>(leap-from-window)')

vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
vim.keymap.set({ "n" }, "<leader>u", vim.cmd.UndotreeToggle)
vim.keymap.set({ "n" }, "<leader>n", ":Neotree toggle=true position=left<CR>", opts)
vim.keymap.set({ "n" }, "<leader>e", ":TroubleToggle<CR>")
vim.keymap.set({ "n" }, "<leader>f", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>c", "<cmd>PickColor<cr>", opts)

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>tg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>tf', builtin.current_buffer_fuzzy_find, {})
vim.keymap.set('n', '<leader>ts', builtin.grep_string, {})
vim.keymap.set('n', '<leader>tc', ":Telescope neoclip<CR>")

local cmp = require('cmp')
cmp.setup({
    mapping =
    {
        ['<S-Tab>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ['<Esc>'] = cmp.mapping.abort(),
        ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
        ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
    }
})
local surround = require("nvim-surround")
surround.setup(
    {
        keymaps = {
            insert = "<C-g>s",
            insert_line = "<C-g>S",
            normal = "ys",
            normal_cur = "yss",
            normal_line = "yS",
            normal_cur_line = "ySS",
            visual = "S",
            visual_line = "gS",
            delete = "ds",
            change = "cs",
            change_line = "cS",
        },
    }
)
