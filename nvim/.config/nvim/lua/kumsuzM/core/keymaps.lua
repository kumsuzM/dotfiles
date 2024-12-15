local keymap = vim.keymap -- for concisenesss

keymap.set("i", "jk", "<ESC>")

-- leader map function which is used to generalise normal
-- mode keymaps which begin with the leader
local leaderMap = function(key, func, desc)
	keymap.set("n", "<leader>" .. key, func, { desc = desc })
end

leaderMap("nh", ":nohl<CR>", "Clear highlights")

leaderMap("x", '"_x', "Delete single character without copying into register")

leaderMap("+", "<C-a>", "Increment number under cursor")
leaderMap("-", "<C-x>", "Decrement number under cursor")

-- window navigation
leaderMap("sv", "<C-w>v", "Split window vertically")
leaderMap("sh", "<C-w>s", "Split window horizontally")
leaderMap("se", "<C-w>=", "Make split windows equal width & height")
leaderMap("sx", ":close<CR>", "Close current split window")

-- tab navigation
leaderMap("to", ":tabnew<CR>", "Open new tab")
leaderMap("tx", ":tabclose<CR>", "Close current tab")
leaderMap("tn", ":tabn<CR>", "Go to next tab")
leaderMap("tp", ":tabp<CR>", "Go to previous tab")

leaderMap("rs", ":LspRestart<CR>", "Restart LSP")

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
