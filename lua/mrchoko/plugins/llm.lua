return {
    'huggingface/llm.nvim',
    enabled = false,
    opts = {
        api_token = nil,                               -- cf Install paragraph
        model = "http://10.10.10.3:11434/api", -- can be a model ID or an http(s) endpoint
        tokens_to_clear = { "<EOT>" },                -- tokens to remove from the model's output
        -- parameters that are added to the request body
        query_params = {
            max_new_tokens = 60,
            temperature = 0.2,
            top_p = 0.95,
            stop_tokens = nil,
        },
        -- set this if the model supports fill in the middle
        fim = {
            enabled = true,
            prefix = "<PRE>",
            middle = "<MID>",
            suffix = "<SUF>",
        },
        debounce_ms = 150,
        accept_keymap = "<Tab>",
        dismiss_keymap = "<S-Tab>",
        tls_skip_verify_insecure = true,
        -- llm-ls configuration, cf llm-ls section
        lsp = {
            bin_path = vim.api.nvim_call_function("stdpath", { "data" }) .. "/mason/bin/llm-ls",
            version = "0.4.0",
        },
        tokenizer =
        {
            repository = "codellama/CodeLlama-7b-hf",
        },
        context_window = 4096,             -- max number of tokens for the context window
        enable_suggestions_on_startup = true,
        enable_suggestions_on_files = "*", -- pattern matching syntax to enable suggestions on specific files, either a string or a list of strings
    }
}
