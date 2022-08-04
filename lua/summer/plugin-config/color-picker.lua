local status_ok, color_picker = pcall(require, "color-picker")
if not status_ok then
	vim.notify("color-picker not found!")
end

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<A-c>", "<cmd>PickColor<cr>", opts)
vim.keymap.set("i", "<A-c>", "<cmd>PickColorInsert<cr>", opts)

-- vim.keymap.set("n", "<leader>[", "<cmd>ConvertHEXandRGB<cr>", opts)
-- vim.keymap.set("n", "<leader>]", "<cmd>ConvertHEXandHSL<cr>", opts)

require("color-picker").setup({ -- for changing icons & mappings
	-- ["icons"] = { "ﱢ", "" },
	-- ["icons"] = { "ﮊ", "" },
	-- ["icons"] = { "", "ﰕ" },
	-- ["icons"] = { "", "" },
	-- ["icons"] = { "", "" },
	["icons"] = { "ﱢ", "" },
	["border"] = "rounded", -- none | single | double | rounded | solid | shadow
	["keymap"] = { -- mapping example:
		-- default keymaps: https://github.com/ziontee113/color-picker.nvim
		-- h and l will increment the color slider value by 1.
		-- u and i / a and d / A and D will increment the color slider value by 5.
		-- s and w / S and W will increment the color slider value by 10.
		-- o will change your color output
		-- Number 0 to 9 will set the slider at your cursor to certain percentages. 0 sets to 0%, 9 sets to 90%, 5 sets to 50%.
		-- H sets to 0%, M sets to 50%, L sets to 100%.
		-- If your slider is on the 4th line (the same line as the color output preview), when you increment / set a color value, it will apply that change to all 3 sliders above it.
		-- gu will select the 1st and 2nd sliders, gd will select the 2nd and 3rd sliders, gm will select the 1st and 3rd sliders.
		-- Press x will deselect the slider group.
	},
})

vim.cmd([[hi FloatBorder guibg=NONE]]) -- if you don't want weird border background colors around the popup.
