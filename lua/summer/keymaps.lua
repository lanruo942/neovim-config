local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<A-Up>", ":resize +2<CR>", opts)
keymap("n", "<A-Down>", ":resize -2<CR>", opts)
keymap("n", "<A-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<A-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to exit insert mode
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

keymap(
	"n",
	"<A-f>",
	"<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>",
	opts
)
keymap("n", "<A-t>", "<cmd>Telescope live_grep<cr>", opts)

-- Nvimtree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- bufferline
keymap("n", "<leader>w", ":Bdelete<cr>", opts)

-- ToggleTerm
keymap("n", "<leader>gs", ":lua _LAZYGIT_TOGGLE()<cr>", opts)

-- trouble.nvim
--[[ keymap("n", "<C-t>", "<cmd>Trouble diagnostics toggle<cr>", opts) ]]
keymap("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", opts)
keymap("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", opts)
keymap("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", opts)
keymap("n", "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", opts)
keymap("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", opts)
keymap("n", "<leader>cQ", "<cmd>Trouble qflist toggle<cr>", opts)

-- nvim-ufo
vim.keymap.set("n", "zr", require("ufo").openAllFolds)
vim.keymap.set("n", "zm", require("ufo").closeAllFolds)

-- Set the current directory to the directory where the current file is located.
keymap("n", "<leader>cd", ":cd %:p:h<CR>:pwd<CR>", opts)

-- insert mode shift + enter to next line
-- keymap("i", "<S-CR>", "<C-[>o", opts)
