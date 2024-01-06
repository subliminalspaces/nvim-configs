return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
        { 'onsails/lspkind.nvim' },
        -- LSP Support
        { 'neovim/nvim-lspconfig' },             -- Required
        { 'williamboman/mason.nvim' },           -- Optional
        { 'williamboman/mason-lspconfig.nvim' }, -- Optional
        -- Autocompletion
        { 'hrsh7th/nvim-cmp' },                  -- Required
        { 'hrsh7th/cmp-nvim-lsp' },              -- Required
        { 'hrsh7th/cmp-buffer' },                -- Optional
        { 'hrsh7th/cmp-path' },                  -- Optional
        { 'saadparwaiz1/cmp_luasnip' },          -- Optional
        { 'hrsh7th/cmp-nvim-lua' },              -- Optional
        { 'hrsh7th/cmp-nvim-lsp-signature-help' },
        { 'hrsh7th/cmp-cmdline' },
        { 'lukas-reineke/cmp-rg' },
        { 'ray-x/cmp-treesitter' },
        -- Snippets
        { 'L3MON4D3/LuaSnip' },             -- Required
        { 'doxnit/cmp-luasnip-choice' },    -- Required
        { 'rafamadriz/friendly-snippets' }, -- Optional
        { 'mfussenegger/nvim-dap' },
        -- Language support
        { "tikhomirov/vim-glsl" },
        -- Formatters
        "nvimtools/none-ls.nvim",
        -- DAP support
        "mfussenegger/nvim-dap",
        "rcarriga/nvim-dap-ui",
        "mxsdev/nvim-dap-vscode-js",
        "mfussenegger/nvim-dap-python",
    }
}
