require("summer.options")
require("summer.keymaps")

if vim.g.vscode then
	-- VSCode extension
else
	-- ordinary Neovim
	require("summer.plugins")
	require("summer.colorscheme")
	require("summer.plugin-config.nvim-tree")
	require("summer.plugin-config.bufferline")
	require("summer.plugin-config.lualine")
	require("summer.plugin-config.telescope")
	require("summer.plugin-config.dashboard")
	require("summer.plugin-config.project")
	require("summer.plugin-config.nvim-treesitter")
	require("summer.plugin-config.indent-blankline")
	require("summer.plugin-config.gitsigns")
	require("summer.plugin-config.nvim-autopairs")
	require("summer.plugin-config.comment")
	require("summer.plugin-config.lsp-status")
	require("summer.plugin-config.toggleterm")
	require("summer.plugin-config.impatient")
	require("summer.plugin-config.nvim-surround")
	require("summer.plugin-config.color-picker")
	require("summer.plugin-config.nvim-ufo")
	require("summer.plugin-config.winbar")
	require("summer.cmp")
	require("summer.lsp")
	require("summer.lsp.null-ls")
	require("summer.lsp.trouble")
	require("summer.lsp.fidget")
end
