return {
    'kwkarlwang/bufresize.nvim',
    enabled = true,
    lazy = false,
    opts = {
        register = {
            trigger_events = {
                'BufWinEnter', "WinEnter"
            }
        }
    },
    resize = {
        trigger_events = { "VimResized" },
        increment = 5
    }
}
