-- import lualine plugin safely
local status, lualine = pcall(require, "lualine")
if not status then
	return
end

-- get lualine gruvbox theme
-- local lualine_gruvbox = require("lualine.themes.gruvbox_dark")
-- local lualine_material = require("lualine.themes.material")

-- configure lualine with modified theme
lualine.setup({
	options = {
		icons_enabled = true,
		theme = "auto",
	},
	sections = {
		lualine_a = {
			{
				"filename",
				path = 1,
			},
		},
	},
})
