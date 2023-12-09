return {
    "stevearc/conform.nvim",
    name = "conform",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            -- Customize or remove this keymap to your liking
            "<leader>ff",
            function()
                require("conform").format({ async = true, lsp_fallback = true })
            end,
            mode = "",
            desc = "Format buffer",
        },
    },
    -- Everything in opts will be passed to setup()
    opts = {
        -- Map of filetype to formatters
        formatters_by_ft = {
            -- lua = { "stylua" },
            javascript = { { "eslint_d", "eslint", "prettierd", "prettier" } },
            typescript = { { "eslint_d", "eslint", "prettierd", "prettier" } },
            ["_"] = { "trim_whitespace" },
            ["*"] = { "trim_newlines" },
            cpp = { "clang_format" },
            c = { "clang_format" },
        },
        -- If this is set, Conform will run the formatter on save.
        -- It will pass the table to conform.format().
        -- This can also be a function that returns the table.
        format_on_save = false,
        -- {
        --     -- I recommend these options. See :help conform.format for details.
        --     lsp_fallback = true,
        --     timeout_ms = 500,
        -- },
        -- If this is set, Conform will run the formatter asynchronously after save.
        -- It will pass the table to conform.format().
        -- This can also be a function that returns the table. gn
        format_after_save = false,
        -- {
        --     lsp_fallback = true,
        -- },
        -- Set the log level. Use `:ConformInfo` to see the location of the log file.
        log_level = vim.log.levels.ERROR,
        -- Conform will notify you when a formatter errors
        notify_on_error = true,
        -- Custom formatters and changes to built-in formatters
        formatters = {
            -- format_repo = {
            --     -- This can be a string or a function that returns a string.
            --     -- When defining a new formatter, this is the only field that is *required*
            --     command = "prettier",
            --     -- A list of strings, or a function that returns a list of strings
            --     -- Return a single string instead of a list to run the command in a shell
            --     -- args = { },
            --     -- If the formatter supports range formatting, create the range arguments here
            --     -- range_args = function(ctx)
            --     --     return { "--line-start", ctx.range.start[1], "--line-end", ctx.range["end"][1] }
            --     -- end,
            --     -- Send file contents to stdin, read new contents from stdout (default true)
            --     -- When false, will create a temp file (will appear in "$FILENAME" args). The temp
            --     -- file is assumed to be modified in-place by the format command.
            --     stdin = true,
            --     -- A function that calculates the directory to run the command in
            --     cwd = require("conform.util").root_file({ ".git" }),
            --     -- When cwd is not found, don't run the formatter (default false)
            --     require_cwd = true,
            --     -- When returns false, the formatter will not be used
            --     condition = function(ctx)
            --         return vim.fs.basename(ctx.filename) ~= "README.md"
            --     end,
            --     -- Exit codes that indicate success (default { 0 })
            --     exit_codes = { 0, 1 },
            --     -- Environment variables. This can also be a function that returns a table.
            --     -- env = {},
            --     -- Set to false to disable merging the config with the base definition
            --     inherit = true,
            --     -- When inherit = true, add these additional arguments to the command.
            --     -- This can also be a function, like args
            --     prepend_args = { "--use-tabs" },
            -- },
            -- These can also be a function that returns the formatter
            -- other_formatter = function(bufnr)
            --     return {
            --         command = "format_repo",
            --     }
            -- end,
            --
        },
    }
}
