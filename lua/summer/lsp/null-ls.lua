local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
	vim.notify("null-ls not found!")
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local completion = null_ls.builtins.completion
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
	debug = true,
	sources = {
		-- Formatting ---------------------
		--  brew install shfmt
		formatting.shfmt,
		-- StyLua
		formatting.stylua,
		-- Shellcheck
		diagnostics.shellcheck.with({
			filetypes = {
				"sh",
				"zsh",
			},
			diagnostic_config = {
				-- see :help vim.diagnostic.config()
				underline = true,
				virtual_text = false,
				signs = true,
				update_in_insert = false,
				severity_sort = true,
			},
			diagnostics_format = "[#{c}] #{m} (#{s})",
		}),
		-- frontend
		formatting.prettier.with({ -- only removed markdown
			filetypes = {
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"vue",
				"css",
				"scss",
				"less",
				"html",
				"json",
				"yaml",
				"graphql",
			},
			-- eslint
			diagnostics.eslint,
			-- spell
			completion.spell,
			-- args see: https://prettier.io/docs/en/options.html
			-- args for javascriptreact
			--[[ extra_args = { "--use-tabs", "--no-semi", "--single-quote" }, ]]
			-- args for typescriptreact
			extra_args = { "--use-tabs", "--single-quote" },
			extra_filetypes = { "njk" },
			prefer_local = "node_modules/.bin",
		}),
		-- formatting.fixjson,
		-- formatting.black.with({ extra_args = { "--fast" } }),
		-- Diagnostics  ---------------------
		-- use lsp diagnostics, close this
		-- diagnostics.eslint.with({
		-- 	prefer_local = "node_modules/.bin",
		-- }),
		-- code actions ---------------------
		code_actions.gitsigns,
		code_actions.eslint.with({
			prefer_local = "node_modules/.bin",
		}),
	},
	-- #{m}: message
	-- #{s}: source name (defaults to null-ls if not specified)
	-- #{c}: code (if available)
	-- prompt format: [eslint] xxx
	diagnostics_format = "[#{s}] #{m}",
	on_attach = function(client)
		-- customize :Format command
		vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format({ async = true })']])
		-- Auto format on file save
		-- 	if client.resolved_capabilities.document_formatting then
		-- 		vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
		-- 	end
	end,
})
