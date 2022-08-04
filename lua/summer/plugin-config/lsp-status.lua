local lsp_status = require("lsp-status")

lsp_status.config({
	select_symbol = function(cursor_pos, symbol)
		if symbol.valueRange then
			local value_range = {
				["start"] = {
					character = 0,
					line = vim.fn.byte2line(symbol.valueRange[1]),
				},
				["end"] = {
					character = 0,
					line = vim.fn.byte2line(symbol.valueRange[2]),
				},
			}

			return require("lsp-status.util").in_range(cursor_pos, value_range)
		end
	end,
	-- status_symbol = " ",
	-- indicator_errors = "",
	-- indicator_warnings = "",
	-- indicator_info = "",
	-- indicator_hint = "",
	-- indicator_ok = "",

	-- monkey style
	-- status_symbol = "🍌",
	-- indicator_errors = "🙉",
	-- indicator_warnings = "🙈",
	-- indicator_info = "🙊",
	-- indicator_hint = "🐒",
	-- indicator_ok = "💫",

	-- emoji style
	-- status_symbol = "🦄",
	-- indicator_errors = "🤯",
	-- indicator_warnings = "😰",
	-- indicator_info = "🧐",
	-- indicator_hint = "🤬",
	-- indicator_ok = "🥳",

	-- weather style
	status_symbol = "🏖  ",
	indicator_errors = " ☄️ ",
	indicator_warnings = "⚡️",
	indicator_info = "☔️",
	indicator_hint = " ❄️ ",
	-- indicator_ok = "☀️",
})
