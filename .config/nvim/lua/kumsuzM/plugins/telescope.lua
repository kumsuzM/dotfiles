return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-telescope/telescope-ui-select.nvim",
		"nvim-tree/nvim-web-devicons",
		"ThePrimeagen/harpoon",
	},
	config = function()
		-- import telescope plugin
		local telescope = require("telescope")

		-- import telescope actions
		local actions = require("telescope.actions")

		-- import telescope-ui-select
		local themes = require("telescope.themes")

		-- configure telescope
		telescope.setup({
			-- configure custom mappings
			defaults = {
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
					},
				},
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("harpoon")
		-- TODO: figure out how to use ui select to select nvim theme
		telescope.load_extension("ui-select")

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		-- general maps
		keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
		keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>") -- find previously opened files
		keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
		keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
		keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
		keymap.set("n", "<leader>hf", "<cmd>Telescope harpoon marks<cr>") -- show harpoon marks

		-- git commands
		keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
		keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
		keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
		keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]
	end,
}
