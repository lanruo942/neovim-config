-- set catpppuccin flavour
vim.g.catppuccin_flavour = "latte" -- latte, frappe, macchiato, mocha

--[[ local colorscheme = "catppuccin" ]]
--[[ local colorscheme = "nord" ]]
--[[ local colorscheme = "onelight" ]]

-- setup onedarkpro
require("onedarkpro").setup({
	colors = {
		onelight = {
			bg = "#fef6e3",
		},
	},
})
-- end setup onedarkpro

-- setup nord
vim.g.nord_contrast = true
vim.g.nord_borders = false
vim.g.nord_disable_background = false
vim.g.nord_italic = true
vim.g.nord_uniform_diff_background = true
vim.g.nord_bold = false
-- end setup nord

-- setup catppuccin
require("catppuccin").setup({
	transparent_background = false,
	term_colors = false,
	compile = {
		enabled = false,
		path = vim.fn.stdpath("cache") .. "/catppuccin",
	},
	dim_inactive = {
		enabled = false,
		shade = "dark",
		percentage = 0.15,
	},
	styles = {
		comments = { "italic" },
		conditionals = { "italic" },
		loops = {},
		functions = {},
		keywords = {},
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
		operators = {},
	},
	integrations = {
		-- For various plugins integrations see https://github.com/catppuccin/nvim#integrations
	},
	color_overrides = {},
	highlight_overrides = {},
})

--[[ local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end ]]
