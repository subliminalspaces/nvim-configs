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
        -- manage_nvim_cmp = {
        --     set_sources = 'recommended',
        --     set_basic_mappings = true,
        --     set_extra_mappings = false,
        --     use_luasnip = true,
        --     set_format = true,
        --     documentation_window = true,
        -- },
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

local cmp = require('cmp')
cmp.setup({
snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
         require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<Tab>'] = cmp.mapping.complete(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ['<Esc>'] = cmp.mapping.abort(),
    ['<Up>'] = cmp.mapping.select_prev_item(cmp_select_opts),
    ['<Down>'] = cmp.mapping.select_next_item(cmp_select_opts),
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      -- { name = 'vsnip' }, -- For vsnip users.
       { name = 'luasnip' }, -- For luasnip users.
      { name = 'friendly-snippets' },
    }, {
      { name = 'buffer' },
    }),
    completion = {
        autocomplete = false
    }
  }
)

require("luasnip.loaders.from_vscode").lazy_load()
