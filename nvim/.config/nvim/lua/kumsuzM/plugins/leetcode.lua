return {
	"kawre/leetcode.nvim",
	build = ":TSUpdate html",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim", -- required by telescope
		"MunifTanjim/nui.nvim",

		-- optional
		"nvim-treesitter/nvim-treesitter",
		"rcarriga/nvim-notify",
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		---@type string
		arg = "leetcode.nvim",

		---@type lc.lang
		lang = "python3",

		cn = { -- leetcode.cn
			enabled = false, ---@type boolean
			translator = true, ---@type boolean
			translate_problems = true, ---@type boolean
		},
	},
	-- NOTE: leetcode.nvim does not support a config function apparently since the
	-- following does not work and seems to break the plugin altogether
	-- config = function()
	-- 	-- set keymaps
	-- 	local keymap = vim.keymap -- for conciseness
	--
	-- 	-- general maps
	-- 	keymap.set("n", "<leader>lm", "<cmd>Leet menu<cr>") -- find files within current working directory, respects .gitignore
	-- 	keymap.set("n", "<leader>lr", "<cmd>Leet run<cr>") -- find files within current working directory, respects .gitignore
	-- 	keymap.set("n", "<leader>ls", "<cmd>Leet submit<cr>") -- find previously opened files
	-- 	keymap.set("n", "<leader>lt", "<cmd>Leet tabs<cr>") -- find string in current working directory as you type
	-- end,
}
