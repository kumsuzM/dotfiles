require("catppuccin").setup({
	flavour = "mocha", -- latte, frappe, macchiato, mocha
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		treesitter = true,
		notify = false,
		mini = {
			enabled = true,
			indentscope_color = "",
		},
	},
})

vim.cmd.colorscheme("catppuccin")
-- default scheme is mocha which is the best one anyway
