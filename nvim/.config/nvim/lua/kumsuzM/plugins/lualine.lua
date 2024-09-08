-- Status line
return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },

	config = function()
		-- remove the redundant --INSERT-- marker
		vim.cmd([[set noshowmode]])

		-- configure lualine with modified theme
		require("lualine").setup({
			options = {
				icons_enabled = true,
				component_separators = "|",
				section_separators = "",
				theme = "catppuccin",
			},
			sections = {
				lualine_a = {
					{
						"buffers",
					},
				},
			},
		})
	end,
}
