local status_ok, indent_blankline = pcall(require, "ibl")
if not status_ok then
	vim.notify("indent_blankline not found!")
	return
end

local highlight = {
	"RainbowRed",
	"RainbowYellow",
	"RainbowBlue",
	"RainbowOrange",
	"RainbowGreen",
	"RainbowViolet",
	"RainbowCyan",
	-- "IndentBlanklineContext1",
	-- "IndentBlanklineContext2",
	-- "IndentBlanklineContext3",
	-- "IndentBlanklineContext4",
	-- "IndentBlanklineContext5",
	-- "IndentBlanklineContext6",
	-- "IndentBlanklineContext7",
}

local hooks = require("ibl.hooks")
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
	vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
	vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
	vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
	vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
	vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
	vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
	vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
	vim.api.nvim_set_hl(0, "IndentBlanklineContext1", { fg = "#BF616A" })
	vim.api.nvim_set_hl(0, "IndentBlanklineContext2", { fg = "#EBCBBB" })
	vim.api.nvim_set_hl(0, "IndentBlanklineContext3", { fg = "#A3BE8C" })
	vim.api.nvim_set_hl(0, "IndentBlanklineContext4", { fg = "#56B6C2" })
	vim.api.nvim_set_hl(0, "IndentBlanklineContext5", { fg = "#88C0D0" })
	vim.api.nvim_set_hl(0, "IndentBlanklineContext6", { fg = "#B48EAD" })
	vim.api.nvim_set_hl(0, "IndentBlanklineContext7", { fg = "#56B6C2" })
end)

indent_blankline.setup({
	indent = {
		highlight = highlight,
		char = "╎",
		tab_char = "╎"
	},
})
