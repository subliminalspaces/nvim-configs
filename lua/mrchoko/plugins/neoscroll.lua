return {
    'karb94/neoscroll.nvim',
    opts = {
        mappings = {},
        hide_cursor = false,         -- Hide cursor while scrolling
        stop_eof = false,             -- Stop at <EOF> when scrolling downwards
        use_local_scrolloff = false,
        respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
        easing_function = "quadratic",       -- Default easing function
        pre_hook = nil,              -- Function to run before the scrolling animation starts
        post_hook = nil,             -- Function to run after the scrolling animation ends
        performance_mode = false,     -- Disable "Performance Mode" on all buffers.
    }
}
