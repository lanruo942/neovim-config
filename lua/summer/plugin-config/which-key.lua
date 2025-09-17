local status, wk = pcall(require, "which-key")
if not status then
	vim.notify("which-key not found!")
	return
end

wk.setup({})

wk.add({
  { "<leader>f", group = "File" },
  { "<leader>g", group = "Git" },
  { "<leader>l", group = "LSP" },
  { "<leader>s", group = "Search" },
  { "<leader>t", group = "Terminal" },
  { "<leader>w", group = "Window" },
})

-- DAP Keymaps
require("summer.dap.keymaps").setup()
