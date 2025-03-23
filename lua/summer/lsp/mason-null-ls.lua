local status_ok_for_mnl, mason_null_ls = pcall(require, "mason-null-ls")
if not status_ok_for_mnl then
	vim.notify("mason-null-ls not found!")
	return
end

mason_null_ls.setup({
	handlers = {},
})
