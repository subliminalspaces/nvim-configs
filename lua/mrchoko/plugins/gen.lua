return {
    "David-Kunz/gen.nvim", -- The name of the plugin
    enabled = true,
    opts = {
        model = "codellama",    -- The default model to use
        display_mode = "float", -- The display mode. Can be "float" or "split"
        show_prompt = true,     -- Shows the Prompt submitted to Ollama
        show_model = true,      -- Displays which model you are using at the beginning of your chat session
        no_auto_close = true,   -- Never closes the window automatically
        init = function(options)
            -- pcall(io.popen, "ollama serve > /dev/null 2>&1 &")
        end,                                                                                         -- Function to initialize Ollama
        command = "curl --silent --no-buffer -X POST http://10.10.10.3:11434/api/generate -d $body", -- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped). This can also be a lua function returning a command string, with options as the input parameter. The executed command must return a JSON object with { response, context } (context property is optional)
        list_models = '<function>',                                                                  -- Retrieves a list of model names
        debug = true                                                                                 -- Prints errors and the command which is run
    },
    config = function()
        require('gen').prompts['Commit_Message'] = {
            prompt =
                'Write a short commit message according to the Conventional Commits specification for the following git diff: \n' ..
                vim.fn.system { 'git', 'diff', '--staged' } .. '\n',
            replace = false
        }
        require('gen').prompts['Generate'] = {
            prompt = "$input",
            replace = true
        }
        require('gen').prompts['Hello'] = {
            prompt = 'Say hello.',
            replace = true,
        }
        require('gen').prompts['Chat'] = {
            prompt = "$input",
        }
        require('gen').prompts['Summarize'] = {
            prompt = "Summarize the following text:\n$text",
        }
        require('gen').prompts['Review Code'] = {
            prompt = "Review the following code and make concise suggestions:\n```$filetype\n$text\n```",
        }
        -- Ask = { prompt = "Regarding the following text, $input:\n$text" },
        -- Change = {
        --     prompt = "Change the following text, $input, just output the final text without additional quotes around it:\n$text",
        --     replace = true,
        -- },
        -- Enhance_Grammar_Spelling = {
        --     prompt = "Modify the following text to improve grammar and spelling, just output the final text without additional quotes around it:\n$text",
        --     replace = true,
        -- },
        -- Enhance_Wording = {
        --     prompt = "Modify the following text to use better wording, just output the final text without additional quotes around it:\n$text",
        --     replace = true,
        -- },
        -- Make_Concise = {
        --     prompt = "Modify the following text to make it as simple and concise as possible, just output the final text without additional quotes around it:\n$text",
        --     replace = true,
        -- },
        -- Make_List = {
        --     prompt = "Render the following text as a markdown list:\n$text",
        --     replace = true,
        -- },
        -- Make_Table = {
        --     prompt = "Render the following text as a markdown table:\n$text",
        --     replace = true,
        -- },
        -- Enhance_Code = {
        --     prompt = "Enhance the following code, only ouput the result in format ```$filetype\n...\n```:\n```$filetype\n$text\n```",
        --     replace = true,
        --     extract = "```$filetype\n(.-)```",
        -- },
        -- Change_Code = {
        --     prompt = "Regarding the following code, $input, only ouput the result in format ```$filetype\n...\n```:\n```$filetype\n$text\n```",
        --     replace = true,
        --     extract = "```$filetype\n(.-)```",
        -- },
    end

}
