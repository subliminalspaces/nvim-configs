
vim.opt.ignorecase = true -- ignore case in search patterns

local lsp = require('lsp-zero').preset({
    name = 'minimal',
    set_lsp_keymaps = true,
    manage_nvim_cmp = true,
    suggest_lsp_servers = false,
})

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()
lsp.ensure_installed({
    'tsserver',
    'eslint',
    'html',
    'graphql',
    'jsonls',
    'lua_ls',
    'pyright',
    'sqlls',
    'tflint',
    'tailwindcss',
    'yamlls',
    'prismals',
    'cssls'
})
lsp.setup()
