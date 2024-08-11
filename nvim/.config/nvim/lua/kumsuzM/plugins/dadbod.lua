return {
	"tpope/vim-dadbod",
	dependencies = { "kristijanhusak/vim-dadbod-ui", "kristijanhusak/vim-dadbod-completion" },
	config = function()
		-- Toggle database UI
		vim.keymap.set(
			"n",
			"<leader>du",
			":DBUIToggle<CR>",
			{ silent = true, noremap = true, desc = "Toggle database UI" }
		)

		-- Find a buffer in the database UI
		vim.keymap.set(
			"n",
			"<leader>df",
			":DBUIFindBuffer<CR>",
			{ silent = true, noremap = true, desc = "Find buffer in DB UI" }
		)

		-- Rename a buffer in the database UI
		vim.keymap.set(
			"n",
			"<leader>dr",
			":DBUIRenameBuffer<CR>",
			{ silent = true, noremap = true, desc = "Rename buffer in DB UI" }
		)

		-- Display last query info in the database UI
		vim.keymap.set(
			"n",
			"<leader>dl",
			":DBUILastQueryInfo<CR>",
			{ silent = true, noremap = true, desc = "Last query info in DB UI" }
		)
	end,
}
