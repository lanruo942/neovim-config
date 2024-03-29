local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	vim.notify("lualine not found!")
	return
end

vim.cmd([[ command! Copilot statusline ]])

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = " ", right = " " },
		-- https://github.com/ryanoasis/powerline-extra-symbols
		section_separators = { left = " ", right = "" },
	},
	extensions = { "nvim-tree", "toggleterm", "nvim-dap-ui", "trouble", "quickfix" },
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = {
			"filename",
			-- require("auto-session-library").current_session_name,
			-- {
			-- 	"lsp_progress",
			-- 	spinner_symbols = { " ", " ", " ", " ", " ", " " },
			-- },
		},
		lualine_x = {
			"require('lsp-status').status()",
			"filesize",
			{
				"fileformat",
				symbols = {
					unix = "", -- e712
					dos = "", -- e70f
					mac = "", -- e711
				},
				--[[ symbols = {
					unix = "LF",
					dos = "CRLF",
					mac = "CR",
				}, ]]
			},
			"encoding",
			"filetype",
		},
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
})
