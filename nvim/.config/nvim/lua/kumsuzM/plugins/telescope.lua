return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-telescope/telescope-ui-select.nvim",
		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		"ThePrimeagen/harpoon",
	},
	config = function()
		-- import telescope plugin
		local telescope = require("telescope")

		-- import telescope actions
		local actions = require("telescope.actions")

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
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("harpoon")
		-- TODO: figure out how to use ui select to select nvim theme
		telescope.load_extension("ui-select")

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		local builtin = require("telescope.builtin")

		-- general maps
		keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [H]elp" })
		keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
		keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "[F]ind [R]ecently opened files" })
		keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "[F]ind [S]tring by grep" })
		keymap.set("n", "<leader>fc", builtin.grep_string, { desc = "[F]ind [C]urrent word" })
		keymap.set("n", "<leader>fb", builtin.buffers, { desc = "[F]ind [B]uffers" })
		keymap.set("n", "<leader>hf", "<cmd>Telescope harpoon marks<cr>") -- show harpoon marks

		-- git commands
		keymap.set("n", "<leader>gc", builtin.git_commits) -- list all git commits (use <cr> to checkout) ["gc" for git commits]
		keymap.set("n", "<leader>gfc", builtin.git_bcommits) -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
		keymap.set("n", "<leader>gb", builtin.git_branches) -- list git branches (use <cr> to checkout) ["gb" for git branch]
		keymap.set("n", "<leader>gs", builtin.git_status) -- list current changes per file with diff preview ["gs" for git status]

		-- Slightly advanced example of overriding default behavior and theme
		vim.keymap.set("n", "<leader>/", function()
			-- You can pass additional configuration to Telescope to change the theme, layout, etc.
			builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				winblend = 10,
				previewer = false,
			}))
		end, { desc = "[/] Fuzzily search in current buffer" })

		-- Shortcut for searching your Neovim configuration files
		vim.keymap.set("n", "<leader>sn", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "[S]earch [N]eovim files" })
	end,
}
