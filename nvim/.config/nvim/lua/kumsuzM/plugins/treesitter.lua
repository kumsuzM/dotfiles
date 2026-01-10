return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = { "windwp/nvim-autopairs" },
	config = function()
		local treesitter = require("nvim-treesitter.configs")
		-- configure treesitter
		treesitter.setup({
			-- enable syntax highlighting
			highlight = {
				enable = true,
				-- Disable slow treesitter highlight for large files
				disable = function(lang, buf)
					local max_filesize = 100 * 1024 -- 100 KB
					local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
					if ok and stats and stats.size > max_filesize then
						return true
					end
				end,
			},
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
				"diff",
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
