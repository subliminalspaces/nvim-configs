local opts = { noremap = true, silent = true }
-- Committing vim heresy
vim.keymap.set({ "n", "v" }, "h", "")
vim.keymap.set({ "n", "v" }, "j", "")
vim.keymap.set({ "n", "v" }, "k", "")
vim.keymap.set({ "n", "v" }, "l", "")
vim.keymap.set({ "n", "v" }, "<C-h>", "", opts)

--Move  to first/middle/last line of screen. Simply not useful.
vim.keymap.set({ "n", "v" }, "H", "")
vim.keymap.set({ "n", "v" }, "L", "")
vim.keymap.set({ "n", "v" }, "M", "")

vim.keymap.set("v", "<C-m>", "", opts)
vim.keymap.set("n", "r", ":redo<CR>", opts)
--Splits
vim.keymap.set('n', '<C-k>', ':vsplit<CR>', opts)
vim.keymap.set('n', '<C-h>', ':split<CR>', opts)

-- Global bindings, opening sidebars, enabling/disabling plugins
local wk = require("which-key")
local wkopts = {
    mode = "n",     -- NORMAL mode
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
        a = { "DAP" },
        l = { "LSP" },
        -- b = { "DAP" },
        f = { "Conform" }
    },
}, wkopts)
vim.keymap.set({ "n" }, "<leader>gu", vim.cmd.UndotreeToggle)
vim.keymap.set({ "n" }, "<leader>gn", ":Neotree toggle=true position=left<CR>", opts)
vim.keymap.set({ "n" }, "<leader>gt", ":TroubleToggle<CR>", opts)
vim.keymap.set({ "n" }, "<leader>gl", ":HlSearchLensToggle<CR>")
vim.keymap.set({ "n" }, "<leader>gc", ":ColorizerToggle<CR>")
vim.keymap.set({ "n" }, "<leader>gg", ":DiffviewOpen<CR>")
vim.keymap.set({ "n" }, "<leader>gf", ":NnnPicker<CR>")
vim.keymap.set({ 'n' }, '<leader>ga', require 'dapui'.toggle)
wk.register({
    g = {
        name = "Global",
        u = { "Undo Tree Toggle" },
        n = { "NeoTree Toggle", },
        t = { "Toggle Trouble" },
        l = { "HlLens Toggle" },
        c = { "Colorizer Toggle" },
        g = { "DiffviewOpen" },
        f = { "NNN" },
        a = { "DAPUI toggle" },
        -- x = { "LLM" }
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

vim.keymap.set('n', '<leader>ff', ":Format<CR>")
vim.keymap.set('n', '<leader>fF', ":FormatWrite<CR>")
-- vim.keymap.set('n', '<leader>ff',
--     function()
--         require("conform").format({ async = true})
--     end, {})
-- vim.keymap.set('n', '<leader>fg',
--     function()
--         require("conform").format({ async = true, lsp_fallback = true, formatters = "format_repo" })
--     end, { })

wk.register({
    f = {
        name = "Formatter",
        f = { ":Format" },
        F = { ":FormatWrite" },
    },
}, wkopts)

-- Leap
vim.keymap.set({ 'n' }, 'l', '<Plug>(leap-forward-to)')
vim.keymap.set({ 'n' }, 'j', '<Plug>(leap-backward-to)')
vim.keymap.set({ 'x', 'o' }, 'J', '<Plug>(leap-backward-till)')
vim.keymap.set({ 'n' }, 'L', '<Plug>(leap-from-window)')


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

wk.register({
    a = {
        name = "DAP",
        p = { "DAP Continue" },
        b = { "DAP Step Over", },
        g = { "DAP Step Into" },
        w = { "DAP Step Out" },
        r = { "DAP Toggle Breakpoint" },
    },
}, wkopts)
-- vim.keymap.set({ 'n', 'v' }, '<leader>aa', ':Gen Review_Code<CR>')
--
-- vim.keymap.set({ 'n', 'v' }, '<leader>ac', ':Gen Commit_Message<CR>')
-- wk.register({
--     a = {
--         name = "Gen",
--         a = { "Review Code" },
--     },
-- }, wkopts)

local ollama = require("mrchoko.llm")

vim.keymap.set("n", "<leader>x", function ()
  ollama.run("wizard-math:latest","","Tell me a random fun fact about the Roman Empire\n")
end)
