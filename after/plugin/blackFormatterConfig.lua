local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.black, -- Use Black formatter
    },
    on_attach = function(client, bufnr)
        -- Use server_capabilities instead of resolved_capabilities
        if client.server_capabilities.documentFormattingProvider then
            vim.cmd([[
                augroup LspFormatting
                    autocmd! * <buffer>
                    autocmd BufWritePre <buffer> lua vim.lsp.buf.format({async = true})
                augroup END
            ]])
        end
    end,
})

