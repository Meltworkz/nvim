require('Comment').setup()

-- Define comment symbols
local comment_symbols = {
    lua = "-- ",         -- Comment symbol for Lua
    python = "# ",       -- Comment symbol for Python
	cpp = "// ",		 -- comment symbol for c++
}


-- Toggle comment for normal mode
vim.keymap.set("n", "<C-/>", function()
    local ft = vim.bo.filetype  -- Get file type
    local comment = comment_symbols[ft] or "# "  -- Default to '#' if filetype not defined

    local line = vim.api.nvim_get_current_line()  -- Get the current line

    -- Check if the line starts with the comment symbol
    if line:find("^" .. vim.pesc(comment)) then
        -- Uncomment: remove the comment symbol
        vim.api.nvim_set_current_line(line:gsub("^" .. vim.pesc(comment) .. "%s?", ""))
    else
        -- Comment: add the comment symbol at the start of the line
        vim.api.nvim_set_current_line(comment .. " " .. line)
    end
end)

-- Toggle comment for visual mode
vim.keymap.set("v", "<C-/>", function()
    local ft = vim.bo.filetype  -- Get file type
    local comment = comment_symbols[ft] or "# "  -- Default to '#' if filetype not defined

    -- Get the selected lines
    local start_line, end_line = vim.fn.line("'<"), vim.fn.line("'>")

    for i = start_line, end_line do
        local line = vim.fn.getline(i)

        -- Check if the line starts with the comment symbol
        if line:find("^" .. vim.pesc(comment)) then
            -- Uncomment: remove the comment symbol
            vim.fn.setline(i, line:gsub("^" .. vim.pesc(comment) .. "%s?", ""))
        else
            -- Comment: add the comment symbol at the start of the line
            vim.fn.setline(i, comment .. " " .. line)
        end
    end
end)

