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
		"j-hui/fidget.nvim",
    },

	config = function()
		require("mason").setup ({})

		require("fidget").setup({})

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

				vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
				vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
				vim.keymap.set("n", "<leader>vws", function () vim.lsp.buf.workspace_symbol() end, opts)
				vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
				vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
				vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
				vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
				vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
				vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)

				-- Format
				vim.keymap.set("n", "<leader>vf", function()
					vim.lsp.buf.format({ async = true })
				end, opts)
			end,
		})
		
		vim.diagnostic.config({
			update_in_insert = true,
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		})

		vim.diagnostic.config({
			virtual_text = true
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
