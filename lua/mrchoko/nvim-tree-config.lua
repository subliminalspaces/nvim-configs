
-- empty setup using d
require ("nvim-tree").setup()
-- OR setup with some options
require("nvim-tree").setup({   
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
        { key = "<C-k>", action = "<NOP>"}
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
  git = {
    enable = true, 
    ignore = false,
    show_on_dirs = true,
    show_on_open_dirs = true,
    timeout = 400
  }
})
