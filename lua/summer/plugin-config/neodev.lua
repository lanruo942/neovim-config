local status, neodev = pcall(require, "neodev")
if not status then
	vim.notify("neodev not found!")
	return
end

neodev.setup({
	library = {
		plugins = { "nvim-dap-ui" },
		types = true,
	},
})
