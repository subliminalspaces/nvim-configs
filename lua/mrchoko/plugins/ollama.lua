local curl = require "plenary.curl"
-- local async = require"plenary.async"
local split_output = {

    fn = function()
        return function(
        -- model, context, prompt
            body, job
        )
            -- prepare the command string
            local filename = vim.fn.strftime("%d%m%y%H%M%S")
            vim.cmd('vsplit')
            local win = vim.api.nvim_get_current_win()
            local buf = vim.api.nvim_create_buf(false, false)
            vim.api.nvim_win_set_buf(win, buf)
            vim.cmd("write " .. filename .. "<CR>")
            -- local cmd = ("ollama run $model $prompt"):gsub("$model", model):gsub("$prompt",
            --     vim.fn.shellescape(context .. "\n" .. prompt))
            --
            -- vim.fn.append(0, { "Sending '" .. prompt .. "' to model " .. model .. "." })
            -- local response = curl.post("http://localhost:11434/api/generate", {
            --     body = vim.fn.json_encode({
            --         model = model,
            --         prompt = prompt,
            --         stream = false
            --     })
            -- })
            -- local resjson = vim.json.decode(body.response)
            -- local responsebody = vim.split(response.body, " ")
            -- vim.uv.fs_write(filename)
            local responseblocks = vim.split(body.response, "\n")
            vim.fn.append(vim.fn.line('$'), responseblocks)

            -- local line = vim.tbl_count(header) + 1
            -- local words = {}
            --
            --    -- start the async job
            -- return vim.fn.jobstart(cmd, {
            -- 	on_stdout = function(_, data, _)
            -- 		for i, token in ipairs(data) do
            -- 			if i > 1 then -- if returned data array has more than one element, a line break occured.
            -- 				line = line + 1
            -- 				words = {}
            -- 			end
            -- 			table.insert(words, token)
            -- 			vim.api.nvim_buf_set_lines(buf_nr, line, line + 1, false, {table.concat(words, "")})
            -- 		end
            -- 	end,
            -- })
        end
    end
}

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

    opts = {
        model = "codellama:7b",
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
            Roman_Empire = {
                prompt = "Tell me a random fun fact about the Roman Empire\n",
                model = "wizard-math:latest",
                action = split_output
            },
            Generate_Commit_Message = {
                prompt =
                'Write a short commit message according to the Conventional Commits specification for the following git diff: \n$buf',
                action = {
                    fn = function()
                        vim.cmd(":vnew")
                        vim.cmd(":%!git diff --staged")
                        return function(body, job)
                            vim.cmd(":1,$d") -- wipe buffer
                            -- vim.builtin.append(vim.builtin.line("."), tostring(body))
                            vim.cmd("")
                        end
                    end
                }

            }
            -- Simplify_Code = {} --remove default prompt
        }
    }
}
