local status_ok, surround = pcall(require, "nvim-surround")
if not status_ok then
	vim.notify("nvim-surround not found!")
	return
end

surround.setup({
	--[[ keymaps = { ]]
	--[[ 	insert = "<C-g>s", ]]
	--[[ 	insert_line = "<C-g>S", ]]
	--[[ 	normal = "ys", ]]
	--[[ 	normal_cur = "yss", ]]
	--[[ 	normal_line = "yS", ]]
	--[[ 	normal_cur_line = "ySS", ]]
	--[[ 	visual = "S", ]]
	--[[ 	visual_line = "gS", ]]
	--[[ 	delete = "ds", ]]
	--[[ 	change = "cs", ]]
	--[[ }, ]]
	highlight = { -- Disables highlights
		duration = false,
	},
})
