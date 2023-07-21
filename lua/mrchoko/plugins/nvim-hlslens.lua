return {
    'kevinhwang91/nvim-hlslens',
    config = function()
        require("scrollbar.handlers.search").setup({
            -- hlslens config overrides
        })
    end,
    opts = {
        auto_enable = true,
        enable_incsearch = true,
        calm_down = true,
        nearest_only = false,
        nearest_float_when = 'auto',
        float_shadow_blend = 50,
        virt_priority = 100,
        override_lens = nil
    }
}
