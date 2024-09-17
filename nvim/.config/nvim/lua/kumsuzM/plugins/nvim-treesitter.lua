return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = function()
		require("nvim-treesitter.install").update({ with_sync = true })
	end,
	dependencies = { "windwp/nvim-autopairs" },
	config = function()
		local treesitter = require("nvim-treesitter.configs")

		-- configure treesitter
		treesitter.setup({
			-- enable syntax highlighting
			highlight = { enable = true },
			-- enable indentation (indentation is wacky for go though so disable it)
			indent = { enable = true, disable = { "go" } },
			-- enable autotagging (w/ nvim-ts-autotag plugin)
			autotag = { enable = true },
			-- ensure these language parsers are installed
			ensure_installed = {
				"json",
				"javascript",
				"typescript",
				"c",
				"tsx",
				"yaml",
				"html",
				"css",
				"markdown",
				"bash",
				"lua",
				"vim",
				"gitignore",
				"dockerfile",
				"rust",
				"sql",
				"markdown",
				"markdown_inline",
				"go",
			},
			-- auto install above language parsers
			auto_install = true,
		})
	end,
}
