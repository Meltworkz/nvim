require('formatter').setup({
    logging = false,
    filetype = {
        python = {
            -- Example for Python using black
            function()
                return {
                    exe = "black",
                    args = { "-" },
                    stdin = true
                }
            end
        },
        -- Add more filetypes here
    }
})

-- Define a command to manually trigger formatting
vim.api.nvim_create_user_command('Format', function()
    vim.cmd('FormatWrite')
end, {})
