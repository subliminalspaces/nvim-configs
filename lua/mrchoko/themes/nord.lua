return {'shaunsingh/nord.nvim',
config = function ()
require("nord").setup({
nord_contrast = false,
nord_borders = false,
nord_disable_background = false,
nord_cursorline_transparent = false,
nord_italic = true,
nord_uniform_diff_background = false,
nord_bold = true
})
end
}
