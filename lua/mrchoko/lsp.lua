vim.opt.ignorecase = true -- ignore case in search patterns
local lsp = require('lsp-zero').preset(
    {
        float_border = 'rounded',
        call_servers = 'local',
        configure_diagnostics = true,
        setup_servers_on_start = true,
        set_lsp_keymaps = {
            preserve_mappings = true,
            omit = {},
        },
    }
)

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
    'clangd',
    'rust_analyzer'
})
lsp.skip_server_setup({
    'julials',
    'java',
    'javac',
    'phpactor'
})
lsp.setup()

-- local function on_attach(client, buffer)
--   -- This callback is called when the LSP is atttached/enabled for this buffer
--   -- we could set keymaps related to LSP, etc here.
-- end
local opts = {
    tools = {
        runnables = {
            use_telescope = true,
        },
        inlay_hints = {
            auto = true,
            show_parameter_hints = false,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },
    },

    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
    server = {
        -- on_attach is a callback called when the language server attachs to the buffer
        -- on_attach = on_attach,
        settings = {
            -- to enable rust-analyzer settings visit:
            -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
            ["rust-analyzer"] = {
                -- enable clippy on save
                checkOnSave = {
                    command = "clippy",
                },
            },
        },
    }
}
local cmp = require('cmp')
local lspkind = require('lspkind')
require("rust-tools").setup(opts)
cmp.setup({
    mapping =
    {
        ['<S-Tab>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
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
    sources = cmp.config.sources({
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
    }),
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
require("luasnip.loaders.from_vscode").lazy_load()
local capabilities = require('cmp_nvim_lsp').default_capabilities()
