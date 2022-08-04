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
	extensions = { "nvim-tree", "toggleterm" },
	sections = {
		lualine_c = {
			"filename",
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
				-- symbols = {
				--   unix = '', -- e712
				--   dos = '', -- e70f
				--   mac = '', -- e711
				-- },
				symbols = {
					unix = "LF",
					dos = "CRLF",
					mac = "CR",
				},
			},
			"encoding",
			"filetype",
		},
		lualine_y = {
			"progress",
		},
	},
})
