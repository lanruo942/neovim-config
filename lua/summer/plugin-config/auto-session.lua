local status_ok, auto_session = pcall(require, "auto-session")
if not status_ok then
	vim.notify("auto-session not found!")
	return
end

auto_session.setup({
	auto_restore = true,
  auto_restore_last_session = false,
  auto_save = true,
  enabled = true,
  log_level = "error",
  root_dir = vim.fn.stdpath("data") .. "/sessions/",
  suppressed_dirs = { "~/", "~/Downloads/", "/", "/etc", "/usr" },
})

vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
