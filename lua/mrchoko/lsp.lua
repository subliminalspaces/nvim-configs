vim.opt.ignorecase = true -- ignore case in search patterns
local lsp_zero = require('lsp-zero')

lsp_zero.set_sign_icons({
    error = '✘',
    warn = '▲',
    hint = '⚑',
    info = ''
})


vim.g.lsp_zero_signcolumn = 1
vim.g.lsp_zero_extend_lspconfig = 1
vim.g.lsp_zero_extend_cmp = 1
vim.g.lsp_zero_api_warnings = 1

vim.diagnostic.config({
    virtual_text = false,
    severity_sort = true,
    float = {
        style = 'minimal',
        border = 'double',
        source = 'always',
        header = '',
        prefix = '',
    },
})
local _border = "double"

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
    vim.lsp.handlers.hover, {
        border = _border
    }
)
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
    vim.lsp.handlers.signature_help, {
        border = _border
    }
)

vim.diagnostic.config {
    float = { border = _border }
}
require('lspconfig.ui.windows').default_options = {
    border = _border
}


local lua_opts = lsp_zero.nvim_lua_ls()

lsp_zero.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr }
    local bind = vim.keymap.set
    bind({ "n" }, "<leader>lf",
        function()
            vim.lsp.buf.format { async = true }
        end
    )
    bind('n', '<leader>lh', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    bind('n', '<leader>ld', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    bind('n', '<leader>lD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    bind('n', '<leader>li', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    bind('n', '<leader>lt', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    bind('n', '<leader>lr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    bind('n', '<leader>ls', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    bind('n', '<leader>le', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    bind('n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
    bind('n', '<leader>ll', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
    bind('n', '<leader>lw', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
    bind('n', '<leader>lp', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)

    local wk = require("which-key")
    local wkopts = {
        mode = "n", -- NORMAL mode
        buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
        silent = true, -- use `silent` when creating keymaps
        noremap = true, -- use `noremap` when creating keymaps
        nowait = false, -- use `nowait` when creating keymaps
        expr = false, -- use `expr` when creating keymaps
    }
    wkopts.prefix = "<leader>"
    wk.register({
        l = {
            name = "LSP",
            f = { "Format." },
            h = { "Show hover information." },
            d = { "Jump to definition. " },
            D = { "Jump to declaration. " },
            i = { "Jump to implementation." },
            t = { "Jump to type definition." },
            r = { "Show all references." },
            s = { "Show signature help." },
            m = { "Rename." },
            a = { "Select a code action." },
            l = { "Open float." },
            w = { "Go to previous diagnostic." },
            p = { "Go to next diagnostic." },
        },
    }, wkopts)
end)

require('lspconfig').lua_ls.setup(lua_opts)

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
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
        'clangd',
        'rust_analyzer'
    },
    handlers = {
        lsp_zero.default_setup,
    }
})

-- local opts = {
--     tools = {
--         runnables = {
--             use_telescope = true,
--         },
--         inlay_hints = {
--             auto = true,
--             show_parameter_hints = false,
--             parameter_hints_prefix = "",
--             other_hints_prefix = "",
--         },
--     },
--     -- all the opts to send to nvim-lspconfig
--     -- these override the defaults set by rust-tools.nvim
--     -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
--     server = {
--         -- on_attach is a callback called when the language server attachs to the buffer
--         -- on_attach = on_attach,
--         settings = {
--             -- to enable rust-analyzer settings visit:
--             -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
--             ["rust-analyzer"] = {
--                 -- enable clippy on save
--                 checkOnSave = {
--                     command = "clippy",
--                 },
--             },
--         },
--     }
-- }
local cmp = require('cmp')
require("luasnip.loaders.from_vscode").lazy_load()
local lspkind = require('lspkind')
-- require("rust-tools").setup(opts)
cmp.setup({
    mapping =
    {
        ['<S-Tab>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ['<Esc>'] = cmp.mapping.abort(),
        ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
        ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
    },
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol_text',  -- show only symbol annotations
            maxwidth = 50,         -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
            preset = 'default',
            before = function(entry, vim_item)
                return vim_item
            end
        })
    },
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' },
        { name = 'luasnip' }, -- For luasnip users.
        { name = 'nvim_lua' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'luasnip',                option = { show_autosnippets = true, use_show_condition = false } },
        { name = 'luasnip_choice' },
        { name = 'friendly-snippets' },
        { name = 'rg' },
        { name = 'treesitter' },
        { name = "crates" },
    },
    completion = {
        autocomplete = false
    }
})

cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        {
            name = 'cmdline',
            option = {
                ignore_cmds = { 'Man', '!' }
            }
        }
    })
})

vim.g.lsp_zero_ui_float_border = 'double'
local capabilities = require('cmp_nvim_lsp').default_capabilities()
