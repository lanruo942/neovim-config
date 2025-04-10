if vim.g.vscode then
	-- VSCode extension
else
	require("summer.colorscheme")
	require("summer.options")
	require("summer.keymaps")
	-- ordinary Neovim
	require("summer.plugins")
	require("summer.plugin-config.nvim-tree")
	require("summer.plugin-config.bufferline")
	--[[ require("summer.plugin-config.lualine") ]]
	require("summer.plugin-config.galaxyline")
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
	require("summer.plugin-config.barbecue")
	require("summer.plugin-config.auto-session")
	require("summer.plugin-config.neodev")
	require("summer.cmp")
	require("summer.lsp")
	--[[ require("summer.lsp.null-ls") ]]
	require("summer.lsp.trouble")
	require("summer.lsp.fidget")
end
