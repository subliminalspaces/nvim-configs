local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- `addArray` sums all values of the array
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local lazyopts = {
    lazy = true
}
vim.keymap.set("n", " ", "<nop>")
vim.g.mapleader = " "
require("lazy").setup({
    spec = {
        { import = 'mrchoko.plugins' }
        , { import = 'mrchoko.plugins.themes' }
    },
    lazyopts
})

vim.g.indent_guides_enable_on_vim_startup = 1
require('telescope').load_extension('neoclip')
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

--Cursor colors

vim.opt.termguicolors = true
vim.opt.guicursor =
    "n-v-c:block-Cursor/lCursor,"
    .. "ve:ver35-Cursor,"
    .. "o:hor50-Cursor,"
    .. "i-ci:ver25-Cursor/lCursor,"
    .. "r-cr:hor20-Cursor/lCursor,"
    .. "sm:block-Cursor-blinkwait175-blinkoff150-blinkon175,"
    .. "a:blinkwait1000-blinkon200-blinkoff300"

augroup('SpecsOnEnter', {
    clear = true
})
autocmd({ 'BufEnter' }, {
    group = 'SpecsOnEnter',
    pattern = '*',
    command = 'lua require("specs").show_specs()'
})
augroup('TreesitterUpdate', { clear = true })
autocmd({ 'VimEnter' }, {
    group = 'TreesitterUpdate',
    pattern = '*',
    command = 'TSUpdate'
})

augroup('FormatOptionsOnEnter', { clear = true })
autocmd({ 'FileType' }, {
    group = 'FormatOptionsOnEnter',
    pattern = '*',
    command = "lua vim.opt.formatoptions:remove({'c','r','o'})"
})
augroup('ResetCursor', { clear = true })
autocmd({ 'VimLeave', 'VimSuspend' },
    {
        group = 'ResetCursor',
        pattern = '*',
        command = "set guicursor=a:ver25-blinkon750-blinkoff750"
    })
vim.filetype.add({
    pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})
--Clipboard, backups, swaps, and undos
vim.opt.clipboard = "unnamedplus"
vim.opt.backup = true      -- creates a backup file
vim.opt.writebackup = true -- if a file is being edited by another program (or was written to file while editing with another program) it is not allowed to be edited
local backupdir = vim.fn.stdpath("data") .. "/backups//"
vim.opt.backupdir = backupdir
if vim.fn.finddir(backupdir) == "" then
    vim.fn.mkdir(backupdir)
end
vim.opt.backupext = ".bak"
vim.opt.backupcopy = "yes"
vim.opt.swapfile = false -- creates a swapfile
vim.opt.undofile = true  -- enable persistent undo
vim.opt.undodir = "~/.local/share/nvim/undo//"
local undodir = vim.fn.stdpath("data") .. "/undo//"
vim.opt.undodir = undodir
if vim.fn.finddir(undodir) == "" then
    vim.fn.mkdir(undodir)
end

--Cursor
-- vim.o.autoindent = true
vim.opt.autoindent = true
vim.opt.smartindent = true -- make indenting smarter again
vim.opt.breakindent = true
vim.opt.fileencoding = "utf-8"
vim.opt.spelllang = "en"
vim.opt.spell = false
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.o.fillchars = 'eob: '
--Window settings
vim.o.guifont = "monospace:h17"            -- the font used in graphical neovim applications
vim.opt.mouse = "a"                        -- allow the mouse to be used in neovim
vim.opt.hidden = true                      -- required to keep multiple buffers and open multiple buffers
vim.opt.title = true                       -- set the title of window to the value of the titlestring
vim.opt.titlestring = "%<%F%=%l/%L - nvim" -- what the title of the window will be set to
vim.opt.timeoutlen = 700                   -- time to wait for a mapped sequence to complete (in milliseconds)
--UI Configs
vim.opt.showmode = false                   -- we don't need to see things like -- INSERT -- anymore
vim.opt.showtabline = 2                    -- always show tabs
vim.opt.pumheight = 10                     -- pop up menu height
-- vim.opt.scrolloff = 8     -- is one of my fav
vim.opt.sidescrolloff = 8
vim.opt.updatetime = 300  -- faster completion
vim.opt.splitbelow = true -- force all horizontal splits to go below current window
vim.opt.splitright = true -- force all vertical splits to go to the right of current window
vim.opt.wrap = true       -- display lines as one long line
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.o.number = true           -- set absolute numbered lines
vim.o.relativenumber = true
vim.opt.signcolumn = "number" -- always show the sign column otherwise it would shift the text each time
vim.opt.conceallevel = 0      -- so that `` is visible in markdown files
vim.opt.cmdheight = 2
vim.opt.numberwidth = 4
vim.opt.expandtab = true
vim.o.autoread = true
vim.opt.list = true
vim.opt.listchars:append "eol:↴"
--Other Stuff
vim.g.border = "rounded"
vim.opt.hlsearch = true   -- highlight all matches on previous search pattern
vim.opt.ignorecase = true -- ignore case in search patterns

-- vim.o.foldcolumn = '1'    -- '0' is not bad
-- vim.o.foldlevel = 99      -- Using ufo provider need a large value, feel free to decrease the value
-- vim.o.foldlevelstart = 99
-- vim.o.foldenable = true
vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
-- vim.opt.formatoptions:remove('r')
require("mrchoko.lsp")
require("mrchoko.dap")
require("mrchoko.remap")
require("mrchoko.theme")
-- require("mrchoko.llm")
