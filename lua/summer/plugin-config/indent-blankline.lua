local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
	vim.notify("indent_blankline not found!")
	return
end

vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

vim.cmd [[highlight IndentBlanklineContext1 guifg=#BF616A gui=nocombine]]
vim.cmd [[highlight IndentBlanklineContext2 guifg=#EBCBBB gui=nocombine]]
vim.cmd [[highlight IndentBlanklineContext3 guifg=#A3BE8C gui=nocombine]]
vim.cmd [[highlight IndentBlanklineContext4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineContext5 guifg=#88C0D0 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineContext6 guifg=#B48EAD gui=nocombine]]

indent_blankline.setup {
	space_char_blankline = " ",
	-- char_highlight_list = {
	-- 	"IndentBlanklineIndent1",
	-- 	"IndentBlanklineIndent2",
	-- 	"IndentBlanklineIndent3",
	-- 	"IndentBlanklineIndent4",
	-- 	"IndentBlanklineIndent5",
	-- 	"IndentBlanklineIndent6",
	-- },
	context_highlight_list = {
		"IndentBlanklineContext1",
		"IndentBlanklineContext2",
		"IndentBlanklineContext3",
		"IndentBlanklineContext4",
		"IndentBlanklineContext5",
		"IndentBlanklineContext6",
	},
	-- for example, context is off by default, use this to turn it on
	show_current_context = true,
	show_current_context_start = true,
	context_patterns = {
		"class",
		"function",
		"method",
		"element",
		"^if",
		"^while",
		"^for",
		"^object",
		"^table",
		"block",
		"arguments",
	},
	-- :echo &filetype
	filetype_exclude = {
		"dashboard",
		"packer",
		"terminal",
		"help",
		"log",
		"markdown",
		"TelescopePrompt",
		"lsp-installer",
		"lspinfo",
		"toggleterm",
	},
}
