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

-- Global bindings, opening sidebars, enabling/disabling plugins

local wk = require("which-key")
local wkopts = {
    mode = "n", -- NORMAL mode
    -- prefix: use "<leader>f" for example for mapping everything related to finding files
    -- the prefix is prepended to every mapping part of `mappings`
    -- prefix = "",
    buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true,  -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
    expr = false,   -- use `expr` when creating keymaps
}


wkopts.prefix = "<leader>"
wk.register({
    [""] = {
        name = "Leader",
        g = { "Global" },
        s = { "Smart Splits", },
        t = { "Telescope" },
        m = { "Possession" },
        a = { "Gen" },
        l = { "LSP" },
        b = { "DAP" },
        f = { "Conform" }
    },
}, wkopts)
vim.keymap.set({ "n" }, "<leader>gu", vim.cmd.UndotreeToggle)
vim.keymap.set({ "n" }, "<leader>gn", ":Neotree toggle=true position=left<CR>", opts)
vim.keymap.set({ "n" }, "<leader>gt", ":TroubleToggle<CR>", opts)
vim.keymap.set({ "n" }, "<leader>gl", ":HlSearchLensToggle<CR>")
vim.keymap.set({ "n" }, "<leader>gc", ":ColorizerToggle<CR>")
vim.keymap.set({ "n" }, "<leader>gg", ":LazyGit<CR>")
vim.keymap.set({ "n" }, "<leader>gf", ":NnnPicker<CR>")
vim.keymap.set('n', '<leader>gi', require 'dapui'.toggle)
wk.register({
    g = {
        name = "Global",
        u = { "Undo Tree Toggle" },
        n = { "NeoTree Toggle", },
        t = { "Toggle Trouble" },
        l = { "HlLens Toggle" },
        c = { "Colorizer Toggle" },
        g = { "LazyGit" },
        f = { "NNN" },
        i = { "DAPUI toggle" },
        a = { "LLM" }
    },
}, wkopts)
-- Movement bindings
-- moving between splits
vim.keymap.set('n', '<C-n>', require('smart-splits').move_cursor_left)
vim.keymap.set('n', '<C-e>', require('smart-splits').move_cursor_down)
vim.keymap.set('n', '<C-u>', require('smart-splits').move_cursor_up)
vim.keymap.set('n', '<C-i>', require('smart-splits').move_cursor_right)
vim.keymap.set('n', '<C-S-n>', require('smart-splits').swap_buf_left)
vim.keymap.set('n', '<C-S-e>', require('smart-splits').swap_buf_down)
vim.keymap.set('n', '<C-S-u>', require('smart-splits').swap_buf_up)
vim.keymap.set('n', '<C-S-i>', require('smart-splits').swap_buf_right)


-- Neoscroll
vim.keymap.set({ 'n', 'v' }, '<C-l>', ":lua require('neoscroll').scroll(-32,true,200,sine)<CR>", opts)
vim.keymap.set({ 'n', 'v' }, '<C-y>', ":lua require('neoscroll').scroll(32,true,200,sine)<CR>", opts)


-- Cokeline
vim.keymap.set('n', '<C-r>', '<Plug>(cokeline-focus-prev)')
vim.keymap.set('n', '<C-t>', '<Plug>(cokeline-focus-next)')
-- Neotree
vim.keymap.set('n', '<C-j>', ':Neotree action=focus<CR>')


-- vim.keymap.set("n", "<leader>l",
--     function()
--         require('cokeline.mappings').pick("focus")
--     end, { desc = "Pick a buffer to focus" }
-- )

vim.api.nvim_set_keymap('n', 'n',
    [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]], opts)
vim.api.nvim_set_keymap('n', 'N',
    [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]], opts)
vim.api.nvim_set_keymap('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], opts)
vim.api.nvim_set_keymap('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], opts)
vim.api.nvim_set_keymap('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], opts)
vim.api.nvim_set_keymap('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], opts)
vim.api.nvim_set_keymap('n', '<esc>', '<Cmd>noh<CR>', opts)

-- resizing splits

vim.keymap.set('n', '<leader>sn', require('smart-splits').resize_left)
vim.keymap.set('n', '<leader>se', require('smart-splits').resize_down)
vim.keymap.set('n', '<leader>su', require('smart-splits').resize_up)
vim.keymap.set('n', '<leader>si', require('smart-splits').resize_right)

wk.register({
    s = {
        name = "Smart-Splits",
        n = { "Resize left" },
        e = { "Resize Down", },
        u = { "Resize Up" },
        i = { "Resize Right" },
    },
}, wkopts)


-- keys = {
--         {
--             -- Customize or remove this keymap to your liking
--             "<leader>f",
--             function()
--                 require("conform").format({ async = true, lsp_fallback = true })
--             end,
--             mode = "",
--             desc = "Format buffer",
--         },
--     },
--
vim.keymap.set('n', '<leader>ff',
    function()
        require("conform").format({ async = true, lsp_fallback = true })
    end, {})
-- vim.keymap.set('n', '<leader>fg',
--     function()
--         require("conform").format({ async = true, lsp_fallback = true, formatters = "format_repo" })
--     end, { })

wk.register({
    f = {
        name = "Conform",
        f = { "Format" },
    },
}, wkopts)

-- vim.keymap.set({ 'n' }, 's', '<Plug>(leap-forward-to)')
--
-- vim.keymap.set({ 'n' }, 'S', '<Plug>(leap-backward-to)')

-- vim.keymap.set({ 'x', 'o' }, 'j', '<Plug>(leap-forward-till)')
-- vim.keymap.set({ 'x', 'o' }, 'J', '<Plug>(leap-backward-till)')

-- vim.keymap.set({ 'n' }, 'gs', '<Plug>(leap-from-window)')


-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>tg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>tf', builtin.current_buffer_fuzzy_find, {})
vim.keymap.set('n', '<leader>ts', builtin.grep_string, {})
vim.keymap.set('n', '<leader>tc', ":Telescope neoclip<CR>")
vim.keymap.set('n', '<leader>tp', ":Telescope possession list<CR>")
vim.keymap.set('n', '<leader>ta', ":Telescope colorscheme<CR>")

wk.register({
    t = {
        name = "Telescope",
        g = { "Live Grep" },
        f = { "Current Buffer Fuzzy Find", },
        s = { "Grep String" },
        c = { "Neoclip" },
        p = { "Possession List" },
        a = { "Colorscheme" },
    },
}, wkopts)
vim.keymap.set('n', '<leader>ms', ":PossessionSave!" .. vim.fn.tr(vim.fn.finddir('.git/..', ';'), '/', "_") .. "<CR>")
vim.keymap.set('n', '<leader>ml', ":PossessionLoad<CR>")
vim.keymap.set('n', '<leader>mr', ":PossessionRename<CR>")
vim.keymap.set('n', '<leader>md', ":PossessionDelete<CR>")
vim.keymap.set('n', '<leader>mc', ":PossessionClose<CR>")

wk.register({
    m = {
        name = "Possession",
        s = { "Save" },
        l = { "Load" },
        r = { "Rename", },
        d = { "Delete" },
        c = { "Close" },
    },
}, wkopts)
vim.keymap.set({ 'n', 'v' }, '<leader>aa', ':Gen Review_Code<CR>')

wk.register({
    a = {
        name = "Gen",
        a = { "Review Code" },
    },
}, wkopts)
