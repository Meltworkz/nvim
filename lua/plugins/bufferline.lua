vim.opt.termguicolors = true

return {
	'akinsho/bufferline.nvim', 
	-- version = "*", 
	dependencies = {
		'nvim-tree/nvim-web-devicons',
		},

	config = function()
		require("bufferline").setup({
			   options = {
				mode = "buffers", -- Set to "tabs" if you want tabpages instead
				numbers = "none", -- Show buffer numbers ("ordinal", "buffer_id", "none")
				close_command = "bdelete! %d", -- Command to delete buffers
				right_mouse_command = "bdelete! %d", -- Right-click to delete
				left_mouse_command = "buffer %d", -- Click to switch to buffer
				middle_mouse_command = nil, -- Disable middle mouse
				indicator = {
					style = 'icon',
					icon = '▎', -- Change this icon if needed
				},
				buffer_close_icon = '', -- Icon to close buffers
				modified_icon = '●', -- Icon for modified buffers
				close_icon = '',
				left_trunc_marker = '',
				right_trunc_marker = '',
				max_name_length = 18,
				max_prefix_length = 15,
				tab_size = 18,
				diagnostics = "nvim_lsp", -- Add LSP diagnostics
				diagnostics_update_in_insert = false,
				offsets = {
					{filetype = "NvimTree", text = "File Explorer", highlight = "Directory", text_align = "left"}
				},
				show_buffer_icons = true, -- Enable file type icons
				show_buffer_close_icons = true,
				show_close_icon = true,
				separator_style = "slant", -- Can be "slant", "thick", "thin", etc.
				enforce_regular_tabs = false,
				always_show_bufferline = true,
			}
		})
		-- Navigate between buffers
		vim.keymap.set('n', '<Tab>', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
		vim.keymap.set('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })

		-- Pick the buffer
		vim.keymap.set('n', '<leader>bc', ':BufferLinePick<CR>', { noremap = true, silent = true})

		-- Close the current buffer
		vim.keymap.set('n', '<leader>bd', ':BufferLinePickClose<CR>', { noremap = true, silent = true })
	end
		
}
