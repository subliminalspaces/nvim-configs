local M = {}
local curl = require"plenary.curl"
local async = require"plenary.async"
local uv = vim.loop
--- @param model string
--- @param context string
--- @param prompt string
--- @param buf_nr number
M.run = function(
    model, context, prompt
)
    -- prepare the command string
    local filename = vim.fn.strftime("%d%m%y%H%M%S")
    vim.cmd('vsplit')
    local win = vim.api.nvim_get_current_win()
    local buf = vim.api.nvim_create_buf(false, false)
    vim.api.nvim_win_set_buf(win, buf)
    vim.cmd("write " .. filename .. "<CR>")
    local cmd = ("ollama run $model $prompt"):gsub("$model", model):gsub("$prompt",
        vim.fn.shellescape(context .. "\n" .. prompt))

    vim.fn.append(0, { "Sending '" .. prompt .. "' to model " .. model .. "." })
    local response = curl.post("http://localhost:11434/api/generate",{
        body = vim.fn.json_encode({
            model = model,
            prompt = prompt,
            stream = false
        })
     })
    local resjson = vim.json.decode(response.body)
    -- local responsebody = vim.split(response.body, " ")
    -- vim.uv.fs_write(filename)
    local responseblocks = vim.split(resjson["response"], "\n") 
    vim.fn.append(vim.fn.line('$'),  responseblocks )

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

return M
