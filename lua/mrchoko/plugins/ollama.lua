return {
    "nomnivore/ollama.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },

    -- All the user commands added by the plugin
    cmd = { "Ollama", "OllamaModel", "OllamaServe", "OllamaServeStop" },

    keys = {
        -- Sample keybind for prompt menu. Note that the <c-u> is important for selections to work properly.
        {
            "<leader>oo",
            ":<c-u>lua require('ollama').prompt()<cr>",
            desc = "ollama prompt",
            mode = { "n", "v" },
        },
        -- Sample keybind for direct prompting. Note that the <c-u> is important for selections to work properly.
        {
            "<leader>oG",
            ":<c-u>lua require('ollama').prompt('Generate_Code')<cr>",
            desc = "ollama Generate Code",
            mode = { "n", "v" },
        },
    },

    ---@type Ollama.Config
    opts = {
        model = "codellama",
        url = "http://10.10.10.3:11434",
        serve = {
            on_start = false,
            command = "ollama",
            args = { "serve" },
            stop_command = "pkill",
            stop_args = { "-SIGTERM", "ollama" },
        },
        -- View the actual default prompts in ./lua/ollama/prompts.lua
        prompts = {
            Sample_Prompt = {
                prompt = "This is a sample prompt that receives $input and $sel(ection), among others.",
                input_label = "> ",
                model = "codellama",
                action = "display",
            },
            Generate_Commit_Message = {
                prompt = 'Write a short commit message according to the Conventional Commits specification for the following git diff: \n$buf',
                action = function()
                    vim.cmd(":vnew")
                    vim.cmd(":%!git diff")
                    return function(body, job)
                        vim.cmd(":1,$d") -- wipe buffer
                        vim.builtin.append(vim.builtin.line("."), tostring(body))
                    end
                end

            }
            -- Simplify_Code = {} --remove default prompt
        }
    }
}
