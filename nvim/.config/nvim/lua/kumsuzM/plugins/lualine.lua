-- Status line
return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },

	config = function()
		-- remove the redundant --INSERT-- marker
		vim.cmd([[set noshowmode]])

		-- get lualine gruvbox theme
		local lualine_gruvbox = require("lualine.themes.gruvbox_dark")
		-- local lualine_material = require("lualine.themes.material")

		-- configure lualine with modified theme
		require("lualine").setup({
			options = {
				icons_enabled = true,
				component_separators = "|",
				section_separators = "",
				theme = lualine_gruvbox,
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
