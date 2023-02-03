require("mrchoko.remap")
require("mrchoko.packer")
require("mrchoko.nvim-tree-config")

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

--vim.opt.backup = false -- creates a backup file
--vim.opt.colorcolumn = "99999" -- fixes indentline for now
--vim.opt.completeopt = { "menuone", "noselect" }
--vim.opt.foldmethod = "manual" -- folding set to "expr" for treesitter based folding
--vim.opt.foldexpr = "" -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
--vim.opt.guifont = "monospace:h17" -- the font used in graphical neovim applications
--vim.opt.hidden = true -- required to keep multiple buffers and open multiple buffers
--vim.opt.hlsearch = true -- highlight all matches on previous search pattern
--vim.opt.ignorecase = true -- ignore case in search patterns
--vim.opt.mouse = "a" -- allow the mouse to be used in neovim
--vim.opt.pumheight = 10 -- pop up menu height
--vim.opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
--vim.opt.showtabline = 2 -- always show tabs
--vim.opt.smartcase = true -- smart case
--vim.opt.splitbelow = true -- force all horizontal splits to go below current window
--vim.opt.splitright = true -- force all vertical splits to go to the right of current window
--vim.opt.swapfile = false -- creates a swapfile
--vim.opt.timeoutlen = 100 -- time to wait for a mapped sequence to complete (in milliseconds)
--vim.opt.title = true -- set the title of window to the value of the titlestring
--vim.opt.titlestring = "%<%F%=%l/%L - nvim" -- what the title of the window will be set to
--vim.opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program) it is not allowed to be edited
--vim.opt.signcolumn = "yes" -- always show the sign column otherwise it would shift the text each time
--vim.opt.wrap = false -- display lines as one long line
--vim.opt.scrolloff = 8 -- is one of my fav
--vim.opt.sidescrolloff = 8



vim.opt.updatetime = 300 -- faster completion
vim.opt.undofile = true -- enable persistent undo
vim.opt.undodir = vim.fn.stdpath "cache" .. "/undo"

vim.opt.conceallevel = 0 -- so that `` is visible in markdown files
vim.opt.autoindent = true
vim.opt.smartindent = true -- make indenting smarter again
vim.opt.fileencoding = "utf-8"
vim.opt.cmdheight = 2
vim.opt.spelllang = "en"
vim.opt.spell = false
vim.opt.numberwidth = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.cursorline = true
vim.o.number = true
vim.opt.relativenumber = false -- set relative numbered lines
vim.opt.clipboard = "unnamedplus"
vim.o.fillchars = 'eob: '
