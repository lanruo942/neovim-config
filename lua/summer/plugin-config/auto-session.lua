local status_ok, auto_session = pcall(require, "auto-session")
if not status_ok then
	vim.notify("auto-session not found!")
	return
end

auto_session.setup({
	log_level = "error",
	auto_session_enable_last_session = false,
	auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
	auto_session_enabled = true,
	auto_save = true,
	auto_restore = true,
	auto_restore_last_session = false,
	auto_session_suppress_dirs = { "~/", "~/Downloads/", "/", "/etc", "/usr" },
	auto_session_use_git_branch = nil,
	-- the configs below are lua only
	bypass_session_save_file_types = nil,
	cwd_change_handling = nil,
	root_dir = "/Users/summer/.local/share/nvim/sessions/",
})

vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
