return {
	{
		"vhyrro/luarocks.nvim",
		priority = 10000,
		config = true,
	},
	{
		"rest-nvim/rest.nvim",
		ft = "http",
		dependencies = { "luarocks.nvim" },
		config = function()
			require("rest-nvim").setup()

			-- find files within current working directory, respects .gitignore
			vim.keymap.set("n", "<leader>rr", "<cmd>Rest run<cr>")
		end,
	},
}
