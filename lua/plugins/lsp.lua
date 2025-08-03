return{
	"mason-org/mason-lspconfig.nvim",
	opts = {
			ui = {
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
		},
	},
	dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },

	config = function()
		require("mason").setup ({})

		require("mason-lspconfig").setup ({
			ensure_installed = {
				"lua_ls",
				"pyright",
				"pylsp",
				},

			automatic_enable = {
				"lua_ls",
				"pyright",
				"pylsp",
				},

			exclude = {},

			handlers = {
				function (server_name)
					require("lspconfig")[server_name].setup {}
				end,
			},
		})

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }

        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
        vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)

        -- Format
        vim.keymap.set("n", "<leader>vf", function()
          vim.lsp.buf.format({ async = true })
        end, opts)
      end,
    })
  end,
}

-- vim.api.nvim_create_autocmd("LspAttach", {
-- 	group = vim.api.nvim_create_augroup("UserLspConfig")
-- 	callback = function(e)
-- 		local opts = { buffer = e.buf}
-- 		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
-- 		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
-- 		vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
-- 		vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
-- 		vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
-- 		vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
-- 		vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
-- 		vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
-- 		vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
-- 	end,
--   })
