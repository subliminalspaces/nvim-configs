return {
    "akinsho/toggleterm.nvim", tag = "*", config = function()
    require("toggleterm").setup ({ 
      direction = 'vertical',
      size = vim.o.columns * 0.3,
      open_mapping=[[<C-\>]],
      insert_mappings = true,
      terminal_mappings = true,
      auto_scroll = true,
      shade_terminals = false,
      start_in_insert = true,
      persist_size = true, 
      persist_mode = true,
      -- winh    winhighlight = "none", makes -- makes terminal darker
        highlights = {
	  Normal = {
            guibg="none",
            bg="none"
          },
	      }	
    })
    end

  }
