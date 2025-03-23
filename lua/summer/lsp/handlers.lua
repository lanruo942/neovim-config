local M = {}

-- TODO: backfill this to template
M.setup = function()
	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local config = {
		-- disable virtual text
		virtual_text = false,
		-- show signs
		signs = {
			active = signs,
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
		width = 60,
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
		width = 60,
	})
end

local ts_utils_config = {
	debug = false,
	disable_commands = false,
	enable_import_on_completion = false,

	-- import all
	import_all_timeout = 5000, -- ms
	-- lower numbers = higher priority
	import_all_priorities = {
		same_file = 1, -- add to existing import statement
		local_files = 2, -- git files or files with relative path markers
		buffer_content = 3, -- loaded buffer content
		buffers = 4, -- loaded buffer names
	},
	import_all_scan_buffers = 100,
	import_all_select_source = false,
	-- if false will avoid organizing imports
	always_organize_imports = true,

	-- filter diagnostics
	filter_out_diagnostics_by_severity = {},
	filter_out_diagnostics_by_code = {},

	-- inlay hints
	auto_inlay_hints = true,
	inlay_hints_highlight = "Comment",
	inlay_hints_priority = 200, -- priority of the hint extmarks
	inlay_hints_throttle = 150, -- throttle the inlay hint request
	inlay_hints_format = { -- format options for individual hint kind
		Type = {},
		Parameter = {},
		Enum = {},
		-- Example format customization for `Type` kind:
		-- Type = {
		--     highlight = "Comment",
		--     text = function(text)
		--         return "->" .. text:sub(2)
		--     end,
		-- },
	},

	-- update imports on file move
	update_imports_on_move = false,
	require_confirmation_on_move = false,
	watch_dir = nil,
}

local function lsp_highlight_document(client)
	-- Set autocommands conditional on server_capabilities
	local status_ok, illuminate = pcall(require, "illuminate")
	if not status_ok then
		vim.notify("illuminate not found!")
		return
	end
	illuminate.on_attach(client)
	-- end
end

local function lsp_keymaps(bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<A-k>", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set("n", "<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	vim.keymap.set("n", "<leader>f", function()
		print(vim.lsp.buf.format({ async = true }))
	end, bufopts)
	-- diagnostic
	vim.keymap.set("n", "gl", vim.diagnostic.open_float, bufopts)
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, bufopts)
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next, bufopts)
	vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, bufopts)
end

M.on_attach = function(client, bufnr)
	-- vim.notify(client.name .. " starting...")
	-- TODO: refactor this into a method that checks if string in list
	if client.name == "ts_ls" then
		local ts_utils_status_ok, ts_utils = pcall(require, "nvim-lsp-ts-utils")
		if not ts_utils_status_ok then
			vim.notify("nvim-lsp-ts-utils not found!")
			return
		end

		-- defaults
		ts_utils.setup(ts_utils_config)

		-- required to fix code action ranges and filter diagnostics
		ts_utils.setup_client(client)

		-- no default maps, so you may want to define some here
		local opts = { noremap = true, silent = true }
		vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>gs", ":TSLspOrganize<CR>", opts)
		vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>gr", ":TSLspRenameFile<CR>", opts)
		vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>gi", ":TSLspImportAll<CR>", opts)
	end

	if client.name ~= "jsonls" then
		client.server_capabilities.documentFormattingProvider = false
	end

	-- Get nvim-navic working with multiple tabs
	if client.server_capabilities["documentSymbolProvider"] then
		require("nvim-navic").attach(client, bufnr)
	end

	lsp_keymaps(bufnr)
	lsp_highlight_document(client)
end

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
	vim.notify("cmp_nvim_lsp not found!")
	return
end

-- Tell the server the capability of foldingRange
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

M.lsp_flags = {
	-- This is the default in Nvim 0.7+
	debounce_text_changes = 150,
}

return M
