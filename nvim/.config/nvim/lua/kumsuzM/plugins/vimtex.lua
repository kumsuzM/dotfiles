return {
	"lervag/vimtex", -- latex
	config = function()
		-- Some VimTex conf that I stole off the internet:
		vim.g.vimtex_view_forward_search_on_start = false
		vim.g.vimtex_quickflix_mode = 0
		vim.g.tex_flavor = "latex"
		vim.g.vimtex_view_method = "zathura"
		vim.g.vimtex_toc_config = {
			mode = 1,
			fold_enable = 0,
			hide_line_numbers = 1,
			resize = 0,
			refresh_always = 1,
			show_help = 0,
			show_numbers = 1,
			split_pos = "leftabove",
			split_width = 30,
			tocdeth = 3,
			indent_levels = 1,
			todo_sorted = 1,
		}
	end,
}
