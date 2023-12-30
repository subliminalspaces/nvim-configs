local dap = require("dap")

require("dapui").setup()

local dapui = require("dapui")
require("dap-vscode-js").setup({
    -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
    debugger_path = vim.fn.expand("$HOME/vscode-js-debug"),                                                     -- Path to vscode-js-debug installation.
    -- debugger_cmd = { "extension" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
    adapters = { 'chrome', 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost', 'node' }, -- which adapters to register in nvim-dap
    log_file_path = "(stdpath cache)/dap_vscode_js.log",                                                        -- Path for file logging
    log_file_level = vim.log.levels.ERROR,                                                                      -- Logging level for output to file. Set to false to disable file logging.
    log_console_level = vim.log.levels
    .ERROR                                                                                                      -- Logging level for output to console. Set to false to disable console output.
})

local js_based_languages = { "typescript", "javascript", "typescriptreact" }

for _, language in ipairs(js_based_languages) do
    require("dap").configurations[language] = {
        {
            type = "pwa-node",
            request = "launch",
            name = "Launch file",
            program = "${file}",
            cwd = "${workspaceFolder}",
        },
        {
            type = "pwa-node",
            request = "attach",
            name = "Attach",
            processId = require 'dap.utils'.pick_process,
            cwd = "${workspaceFolder}",
        },
        {
            type = "pwa-chrome",
            request = "launch",
            name = "Start Chrome with \"localhost\"",
            url = "http://localhost:8000",
            webRoot = "${workspaceFolder}",
            userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir"
        }
    }
end

require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')

table.insert(require('dap').configurations.python, {
    type = 'python',
    request = 'launch',
    name = 'My custom launch configuration',
    program = '${file}',
    -- ... more options, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings
})
-- Set keymaps to control the debugger
vim.keymap.set('n', '<leader>ap', require 'dap'.continue)
vim.keymap.set('n', '<leader>ab', require 'dap'.step_over)
vim.keymap.set('n', '<leader>ag', require 'dap'.step_into)
vim.keymap.set('n', '<leader>aw', require 'dap'.step_out)
vim.keymap.set('n', '<leader>ar', require 'dap'.toggle_breakpoint)
-- vim.keymap.set('n', '<leader>B', function()
--   require 'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))
-- end)

-- local wk = require("which-key")
--
-- local wkopts = {
--     mode = "n",     -- NORMAL mode
--     buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
--     silent = true,  -- use `silent` when creating keymaps
--     noremap = true, -- use `noremap` when creating keymaps
--     nowait = false, -- use `nowait` when creating keymaps
--     expr = false,   -- use `expr` when creating keymaps
-- }
-- wk.register({
--     a = {
--         name = "DAP",
--         p = { "DAP Continue" },
--         b = { "DAP Step Over", },
--         g = { "DAP Step Into" },
--         w = { "DAP Step Out" },
--         r = { "DAP Toggle Breakpoint" },
--     },
-- }, wkopts)
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open({})
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close({})
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close({})
end
