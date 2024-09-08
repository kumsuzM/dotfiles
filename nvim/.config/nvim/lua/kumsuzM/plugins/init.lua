return {
	"nvim-lua/plenary.nvim", -- lua functions that many plugins use

	-- colorschemes
	"ellisonleao/gruvbox.nvim",
	"marko-cerovac/material.nvim",
	{ "catppuccin/nvim", name = "catppuccin" },

	"vim-scripts/ReplaceWithRegister", -- replace with register contents using motion (gr + motion)

	{
		"j-hui/fidget.nvim",
		opts = {},
	},

	-- allows for smooth scroll
	{
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup({})
		end,
	},
}
