require("mrchoko.remap")
require("mrchoko.packer")
require("mrchoko.nvim-tree-config")

local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Cursor colors 
vim.opt.termguicolors = true
vim.opt.guicursor=
"n-v-c:block-Cursor/lCursor,"
.. "ve:ver35-Cursor,"
.. "o:hor50-Cursor,"
.. "i-ci:ver25-Cursor/lCursor,"
.. "r-cr:hor20-Cursor/lCursor,"
.. "sm:block-Cursor-blinkwait175-blinkoff150-blinkon175,"
.. "a:blinkwait1000-blinkon200-blinkoff300"

augroup('ResetCursor', {clear = true})
autocmd({ 'VimLeave', 'VimSuspend'}, 
        {group = 'ResetCursor',
        pattern = '*',
        command = "set guicursor=a:ver25-blinkon750-blinkoff750"
        })


--Clipboard, backups, swaps, and undos

vim.opt.clipboard = "unnamedplus"
vim.opt.backup = true -- creates a backup file
vim.opt.writebackup = true -- if a file is being edited by another program (or was written to file while editing with another program) it is not allowed to be edited
local backupdir = vim.fn.stdpath("data") .. "/backups//"
vim.opt.backupdir =  backupdir
if vim.fn.finddir(backupdir) == "" then
 vim.fn.mkdir(backupdir)
end
vim.opt.backupext = ".bak"
vim.opt.backupcopy="yes"
vim.opt.swapfile = false -- creates a swapfile
vim.opt.undofile = true -- enable persistent undo
vim.opt.undodir = "~/.local/share/nvim/undo//"
local undodir = vim.fn.stdpath("data") .. "/undo//"
vim.opt.undodir =  undodir
if vim.fn.finddir(undodir) == "" then
 vim.fn.mkdir(undodir)
end

--Cursor

vim.opt.autoindent = true
vim.opt.smartindent = true -- make indenting smarter again
vim.opt.fileencoding = "utf-8"
vim.opt.spelllang = "en"
vim.opt.spell = false
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.o.fillchars = 'eob: '

--Window settings

vim.opt.mouse = "a" -- allow the mouse to be used in neovim
vim.opt.hidden = true -- required to keep multiple buffers and open multiple buffers
vim.opt.title = true -- set the title of window to the value of the titlestring
vim.opt.titlestring = "%<%F%=%l/%L - nvim" -- what the title of the window will be set to


--UI Configs
vim.opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
vim.opt.showtabline = 2 -- always show tabs
vim.opt.pumheight = 10 -- pop up menu height
vim.opt.scrolloff = 8 -- is one of my fav
vim.opt.sidescrolloff = 8
vim.opt.updatetime = 300 -- faster completion
vim.opt.splitbelow = true -- force all horizontal splits to go below current window
vim.opt.splitright = true -- force all vertical splits to go to the right of current window
vim.opt.wrap = true -- display lines as one long line
vim.opt.cursorline = true
vim.o.number = true  -- set absolute numbered lines
vim.opt.relativenumber = true -- set relative numbered lines
vim.opt.signcolumn = "yes" -- always show the sign column otherwise it would shift the text each time
vim.opt.conceallevel = 0 -- so that `` is visible in markdown files
vim.opt.cmdheight = 2
vim.opt.numberwidth = 4
vim.opt.expandtab = true


--Other Stuff

vim.opt.ignorecase = true -- ignore case in search patterns
--vim.opt.colorcolumn = "99999" -- fixes indentline for now
--vim.opt.completeopt = { "menuone", "noselect" }
--vim.opt.foldmethod = "manual" -- folding set to "expr" for treesitter based folding
--vim.opt.foldexpr = "" -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
--vim.opt.guifont = "monospace:h17" -- the font used in graphical neovim applications
--vim.opt.hlsearch = true -- highlight all matches on previous search pattern
--vim.opt.smartcase = true -- smart case
--vim.opt.timeoutlen = 100 -- time to wait for a mapped sequence to complete (in milliseconds)
