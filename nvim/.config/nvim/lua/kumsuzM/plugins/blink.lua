return {
	"saghen/blink.cmp",
	dependencies = "rafamadriz/friendly-snippets",

	version = "1.*",

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = {
			preset = "default",
			["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
			["<CR>"] = { "select_and_accept" },

			["<C-k>"] = { "select_prev" },
			["<C-j>"] = { "select_next" },

			["<C-b>"] = { "scroll_documentation_up", "fallback" },
			["<C-f>"] = { "scroll_documentation_down", "fallback" },

			["<Tab>"] = { "snippet_forward", "fallback" },
			["<S-Tab>"] = { "snippet_backward", "fallback" },
		},

		appearance = {
			-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
			-- Adjusts spacing to ensure icons are aligned
			nerd_font_variant = "mono",
		},

		-- default list of enabled providers defined so that you can extend it
		-- elsewhere in your config, without redefining it, via `opts_extend`
		sources = {
			-- default = { "lsp", "path", "snippets", "buffer", "vim-dadbod-completion" },
			default = { "lsp", "path", "snippets", "buffer" },

			-- optionally disable cmdline completions
			-- cmdline = {},
		},
	},
	-- allows extending the providers array elsewhere in your config
	-- without having to redefine it
	opts_extend = { "sources.default" },
}
