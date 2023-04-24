vim.opt.ignorecase = true -- ignore case in search patterns

local lsp = require('lsp-zero').preset(
    {
        float_border = 'rounded',
        call_servers = 'local',
        configure_diagnostics = true,
        setup_servers_on_start = true,
        set_lsp_keymaps = {
            preserve_mappings = false,
            omit = {},
        },
        manage_nvim_cmp = {
            set_sources = 'recommended',
            set_basic_mappings = true,
            set_extra_mappings = false,
            use_luasnip = true,
            set_format = true,
            documentation_window = true,
        },
    }
)

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
    'cssls',
    'clangd'
})
lsp.skip_server_setup({
    'julials',
    'java',
    'javac',
    'phpactor'
})
lsp.setup()
