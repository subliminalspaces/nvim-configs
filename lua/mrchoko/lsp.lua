



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
require("lspconfig").lua_ls.setup {}
require("lspconfig").yamlls.setup {}
