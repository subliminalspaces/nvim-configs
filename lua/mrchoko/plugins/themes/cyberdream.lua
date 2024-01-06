return {
    "scottmckendry/cyberdream.nvim",
    lazy = true,
    priority = 1000,
    config = function()
        require("cyberdream").setup(
            {
                -- Enable transparent background
                transparent = true, -- Default: false
                -- Enable italics comments
                italic_comments = false, -- Default: false
                -- Replace all fillchars with ' ' for the ultimate clean look
                hide_fillchars = false, -- Default: false
                borderless_telescope = false, -- Default: true
                -- theme = {        -- Default: nil
                --     highlights = {
                --         -- Highlight groups to override, adding new groups is also possible
                --         -- See `:help highlight-groups` for a list of highlight groups
                --         -- Example:
                --         Comment = { fg = "#696969", bg = "NONE", italic = true },
                --     },
                --     -- Override a color entirely
                --     colors = {
                --         -- For a list of colors see `lua/cyberdream/colours.lua`
                --         -- Example:
                --         bg = "#000000",
                --         green = "#00ff00",
                --         magenta = "#ff00ff",
                --     },
                -- },
            }
        )
    end,
}
