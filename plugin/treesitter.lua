require'nvim-treesitter.configs'.setup {
   ensure_installed = "all",
   sync_install = false,
   auto_install = true,
   -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!
   highlight = {
     enable = true,
     additional_vim_regex_highlighting = false,
   }
}
