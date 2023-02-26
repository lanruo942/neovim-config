local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	vim.notify("lualine not found!")
	return
end

--[[ vim.g.gitblame_display_virtual_text = 0 -- Disable virtual text ]]
vim.g.gitblame_message_template = " <author> ﮮ <date> ﴬ <summary>"
--[[ vim.g.gitblame_message_when_not_committed = "Oh please, commit this !" ]]
vim.g.gitblame_date_format = "%r"
local git_blame_status_ok, git_blame = pcall(require, "gitblame")
if not git_blame_status_ok then
	vim.notify("git_blame not found!")
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
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = {
			"filename",
			require("auto-session-library").current_session_name,
			--[[ { git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available }, ]]
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
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
})
