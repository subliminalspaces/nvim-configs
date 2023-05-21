

return {
    'willothy/nvim-cokeline',
    name = 'cokeline',
    dependencies = {'nvim-tree/nvim-web-devicons'},
    opts = {
    -- Only show the bufferline when there are at least this many visible buffers.
    -- default: `1`.
    show_if_buffers_are_at_least = 1,
  
    buffers = {
      -- A function to filter out unwanted buffers. Takes a buffer table as a
      -- parameter (see the following section for more infos) and has to return
      -- either `true` or `false`.
      -- default: `false`.
      -- filter_valid = function(buffer) 
      --   return true
      -- end,
  
      -- -- A looser version of `filter_valid`, use this function if you still
      -- -- want the `cokeline-{switch,focus}-{prev,next}` mappings to work for
      -- -- these buffers without displaying them in your bufferline.
      -- -- default: `false`.
      -- filter_visible = function(buffer) 
      --   return false
      -- end,
  
      -- Which buffer to focus when a buffer is deleted, `prev` focuses the
      -- buffer to the left of the deleted one while `next` focuses the one the
      -- right.
      -- default: 'next'.
      focus_on_delete = 'prev',
  
      -- If set to `last` new buffers are added to the end of the bufferline,
      -- if `next` they are added next to the current buffer.
      -- if set to `directory` buffers are sorted by their full path.
      -- if set to `number` buffers are sorted by bufnr, as in default Neovim
      -- default: 'last'.
      new_buffers_position = 'next',
  
      -- If true, right clicking a buffer will close it
      -- The close button will still work normally
      -- Default: true
      delete_on_right_click = true,
    },
  
    mappings = {
      -- Controls what happens when the first (last) buffer is focused and you
      -- try to focus/switch the previous (next) buffer. If `true` the last
      -- (first) buffers gets focused/switched, if `false` nothing happens.
      -- default: `true`.
      cycle_prev_next = true,
    },
  
    rendering = {
      -- The maximum number of characters a rendered buffer is allowed to take
      -- up. The buffer will be truncated if its width is bigger than this
      -- value.
      -- default: `999`.
      max_buffer_width = 999,
    },
  
    pick = {
      -- Whether to use the filename's first letter first before
      -- picking a letter from the valid letters list in order.
      -- default: `true`
      use_filename = true,
  
      -- The list of letters that are valid as pick letters. Sorted by
      -- keyboard reachability by default, but may require tweaking for
      -- non-QWERTY keyboard layouts.
      -- default: `'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERTYQP'`
      letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERTYQP',
    },
  
    -- The default highlight group values.
    -- The `fg` and `bg` keys are either colors in hexadecimal format or
    -- functions taking a `buffer` parameter and returning a color in
    -- hexadecimal format. Similarly, the `style` key is either a string
    -- containing a comma separated list of items in `:h attr-list` or a
    -- function returning one.
    default_hl = {
      -- default: `ColorColumn`'s background color for focused buffers,
      -- `Normal`'s foreground color for unfocused ones.
    --   fg = '#rrggbb' | function(buffer) -> '#rrggbb',
  
    --   -- default: `Normal`'s foreground color for focused buffers,
    --   -- `ColorColumn`'s background color for unfocused ones.
    --   -- default: `Normal`'s foreground color.
    --   bg = '#rrggbb' | function(buffer) -> '#rrggbb',
  
    --   -- default: `'NONE'`.
    --   style = 'attr1,attr2,...' | function(buffer) -> 'attr1,attr2,...',
    },
  
    -- A list of components to be rendered for each buffer. Check out the section
    -- below explaining what this value can be set to.
    -- default: see `/lua/cokeline/defaults.lua`
    components = {
      {
        text = '｜',
        fg = function(buffer)
          return
            buffer.is_modified and yellow or green
        end
      },
      {
        text = function(buffer) return buffer.devicon.icon .. ' ' end,
        fg = function(buffer) return buffer.devicon.color end,
      },
      {
        text = function(buffer) return buffer.index .. ': ' end,
      },
      {
        text = function(buffer) return buffer.unique_prefix end,
        fg = vim.g.terminal_color_4,
        style = 'italic',
      },
      {
        text = function(buffer) return buffer.filename .. ' ' end,
        style = function(buffer) return buffer.is_focused and 'bold' or nil end,
      },
      {
        text = ' ',
      },
    },
  
    -- Left sidebar to integrate nicely with file explorer plugins.
    -- This is a table containing a `filetype` key and a list of `components` to
    -- be rendered in the sidebar.
    -- The last component will be automatically space padded if necessary
    -- to ensure the sidebar and the window below it have the same width.
    sidebar = {
        filetype = 'NvimTree',
        components = {
          {
            text = '  NvimTree',
            fg = vim.g.terminal_color_3,
            bg =  vim.g.terminal_color_4,
            style = 'bold',
          },
        }
    },
}
}