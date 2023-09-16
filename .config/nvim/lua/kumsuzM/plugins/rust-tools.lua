return {
	"simrat39/rust-tools.nvim",

	config = function()
		local keymap = vim.keymap -- for conciseness

		local rt = require("rust-tools")

		rt.setup({
			server = {
				on_attach = function(client, bufnr)
					client.server_capabilities.semanticTokensProvider = nil

					local opts = { noremap = true, silent = true, buffer = bufnr }

					keymap.set("n", "<leader>kk", rt.hover_actions.hover_actions, opts)

					keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
					keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
					keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
					keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
					keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
					keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
					keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
					keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
					keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
					keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
					keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
					keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts) -- see outline on right hand side
				end,
				settings = {
					["rust-analyzer"] = {
						checkOnSave = {
							enable = true,
							command = "clippy",
						},
						cargo = {
							allFeatures = true,
						},
					},
				},
			},
			tools = {
				hover_actions = {
					auto_focus = true,
				},
			},
		})
	end,
}
