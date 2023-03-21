require("lspconfig").html.setup {}
require("lspconfig").tsserver.setup {}
require("lspconfig").bashls.setup {}
require("lspconfig").eslint.setup {}
require("lspconfig").graphql.setup {}

require("lspconfig").sqlls.setup {
    single_file_support = false
}
require("lspconfig").quick_lint_js.setup {}
require("lspconfig").jsonls.setup {}
require("lspconfig").lua_ls.setup {
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false, -- disable annoying 'do you need to configure your work enviroment as ... prompt'
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    }
}
require("lspconfig").yamlls.setup {}
