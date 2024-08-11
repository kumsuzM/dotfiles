return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {"nvim-tree/nvim-web-devicons"},
	config = function()
		-- recommended settings from nvim-tree documentation
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- change color for arrows in tree to light blue
		vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

		-- configure nvim-tree
		require("nvim-tree").setup({
			-- change folder arrow icons
			renderer = {
				icons = {
					glyphs = {
						folder = {
							-- arrow_closed = "", -- arrow when folder is closed
							-- arrow_open = "", -- arrow when folder is open
							arrow_closed = ">", -- arrow when folder is closed
							arrow_open = "v", -- arrow when folder is open
						},
					},
				},
			},
			-- disable window_picker for explorer
			-- to work well with window splits
			actions = {
				open_file = {
					window_picker = {
						enable = false,
					},
				},
			},
		})

		-- keyamp to toggle file explorer
		vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
	end
}
