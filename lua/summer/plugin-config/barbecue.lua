local status_ok, barbecue = pcall(require, "barbecue")
if not status_ok then
	vim.notify("barbecue not found!")
	return
end

barbecue.setup({
	attach_navic = false, -- prevent barbecue from automatically attaching nvim-navic
	create_autocmd = false, --prevent barbecue from updating itself automatically
	symbols = {
		separator = ""
	}
})

vim.api.nvim_create_autocmd({
	"WinScrolled", -- or WinResized on NVIM-v0.9 and higher
	"BufWinEnter",
	"CursorHold",
	"InsertLeave",

	-- include these if you have set `show_modified` to `true`
	"BufWritePost",
	"TextChanged",
	"TextChangedI",
}, {
	group = vim.api.nvim_create_augroup("barbecue.updater", {}),
	callback = function()
		require("barbecue.ui").update()
	end,
})
