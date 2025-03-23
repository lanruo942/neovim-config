local options = {
	encoding = "utf-8", -- encoding of the input file
	colorcolumn = "80", -- color column for the input file
	backup = false, -- creates a backup file
	clipboard = "unnamedplus", -- allows neovim to access the system clipboard
	cmdheight = 2, -- more space in the neovim command line for displaying messages
	completeopt = { "menu", "menuone", "noselect", "noinsert" }, -- mostly just for cmp
	conceallevel = 0, -- so that `` is visible in markdown files
	fileencoding = "utf-8", -- the encoding written to a file
	hlsearch = true, -- highlight all matches on previous search pattern
	incsearch = true, -- highlight the current search match
	ignorecase = true, -- ignore case in search patterns
	mouse = "a", -- allow the mouse to be used in neovim
	pumheight = 10, -- pop up menu height
	showmode = false, -- we don't need to see things like -- INSERT -- anymore
	showtabline = 2, -- always show tabs
	smartcase = true, -- smart case
	smartindent = true, -- make indenting smarter again
	splitbelow = true, -- force all horizontal splits to go below current window
	splitright = true, -- force all vertical splits to go to the right of current window
	swapfile = false, -- creates a swapfile
	termguicolors = true, -- set term gui colors (most terminals support this)
	timeoutlen = 500, -- time to wait for a mapped sequence to complete (in milliseconds)
	undofile = true, -- enable persistent undo
	updatetime = 200, -- faster completion (4000ms default)
	writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
	expandtab = false, -- don't expand tabs to spaces
	shiftwidth = 2, -- the number of spaces inserted for each indentation
	tabstop = 2, -- insert 2 spaces for a tab
	softtabstop = 2, -- insert 2 spaces for a tab
	shiftround = true, -- shift to the right of a tab stop
	autoindent = true, -- auto indent on newline
	cursorline = true, -- highlight the current line
	number = true, -- set numbered lines
	relativenumber = false, -- set relative numbered lines
	numberwidth = 4, -- set number column width to 2 {default 4}
	signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
	wrap = true, -- wrap long lines
	scrolloff = 8, -- is one of my fav
	sidescrolloff = 8,
	guifont = "monospace:h17", -- the font used in graphical neovim applications
	autoread = true, -- automatically read files when they are opened
	whichwrap = "<,>,[,]", -- wrap around these characters
	hidden = true, -- hide the file in the file list
	background = "dark", -- set the background color
	list = true,
	listchars = "tab:  ,space:·,eol:↴", -- set the list characters
	wildmenu = true, -- enable wildmenu
	foldcolumn = "1",
	foldlevel = 99, -- Using ufo provider need a large value, feel free to decrease the value
	foldlevelstart = 99,
	foldenable = true,
	foldnestmax = 0,
}

vim.opt.shortmess:append("c")

-- disable netrw for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Copilot
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
vim.g.copilot_filetypes = {
	["*"] = false,
	["javascript"] = true,
	["typescript"] = true,
	["typescriptreact"] = true,
	["lua"] = false,
	["rust"] = true,
	["c"] = true,
	["c#"] = true,
	["c++"] = true,
	["go"] = true,
	["python"] = true,
}
vim.g.rainbow_active = 1

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])
vim.cmd([[set formatoptions-=cro]]) -- TODO: this doesn't seem to work
-- set json to jsonc to let json file support Comments
-- or use: autocmd! FileType json set filetype=jsonc
vim.cmd([[
	augroup JsonToJsonc
		autocmd BufNewFile,BufRead tsconfig.json setlocal filetype=jsonc
	augroup End
]])

-- transparent background
vim.cmd("au ColorScheme * highlight Normal guibg=none ctermbg=none")
vim.cmd("au ColorScheme * highlight NonText guibg=none ctermbg=none")
vim.cmd("au ColorScheme * highlight SignColumn guibg=none")
vim.cmd("au ColorScheme * highlight VertSplit guibg=none")
vim.cmd("au ColorScheme * highlight Folded guibg=none")
vim.cmd("au ColorScheme * highlight FoldColumn guibg=none")
vim.cmd("au ColorScheme * highlight LineNr guibg=none")
vim.cmd("au ColorScheme * highlight CursorLineNr guibg=none")
vim.cmd("au ColorScheme * highlight EndOfBuffer guibg=none")
vim.cmd("au ColorScheme * highlight StatusLine guibg=none ctermbg=none")
vim.cmd("au ColorScheme * highlight StatusLineNC guibg=none ctermbg=none")

-- autoload ColorScheme
-- Or switch automatically according to the system theme
if vim.fn.has("mac") == 1 then
	local dark_mode = vim.fn.system("defaults read -g AppleInterfaceStyle 2>/dev/null") == "Dark\n"
	if dark_mode then
		vim.opt.background = "dark"
		vim.cmd("colorscheme nord")
	else
		vim.g.ayucolor = "light"
		vim.cmd("colorscheme ayu")
		--[[ vim.opt.background = "light" ]]
		--[[ vim.cmd("colorscheme catppuccin") ]]

		-- characters highlight
		vim.cmd("highlight @variable guifg=#354260")
		vim.cmd("highlight @punctuation.delimiter guifg=#aa77b5")
		vim.cmd("highlight @punctuation.bracket guifg=#a6a09c")
	end
end
