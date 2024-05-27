local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	vim.notify("nvim-treesitter not found!")
	return
end

-- nvim-ts-context-commentstring
require("ts_context_commentstring").setup({
	enable_autocmd = false,
	languages = {
		typescript = "// %s",
	},
})

treesitter.setup({
	ensure_installed = "all",
	sync_install = false,
	ignore_install = { "phpdoc" },
	highlight = {
		enable = true,
		disable = {}, -- list of language that will be disabled
		additional_vim_regex_highlighting = true,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<CR>",
			node_incremental = "<CR>",
			node_decremental = "<BS>",
			scope_incremental = "<TAB>",
		},
	},
	indent = {
		enable = true,
		disable = {
			"yaml",
		},
	},
	-- autopairs
	autopairs = {
		enable = true,
	},
	-- rainbow
	rainbow = {
		enable = true,
		-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
		-- colors = {}, -- table of hex strings
		-- termcolors = {} -- table of colour name strings
	},
	-- playground
	playground = {
		enable = true,
		disable = {},
		updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
		persist_queries = false, -- Whether the query persists across vim sessions
		keybindings = {
			toggle_query_editor = "o",
			toggle_hl_groups = "i",
			toggle_injected_languages = "t",
			toggle_anonymous_nodes = "a",
			toggle_language_display = "I",
			focus_language = "f",
			unfocus_language = "F",
			update = "R",
			goto_node = "<cr>",
			show_help = "?",
		},
	},
})

-- enable Folding module
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- Not folded by default
-- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
vim.opt.foldlevel = 99
