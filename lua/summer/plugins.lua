-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

packer.startup({
	function(use)
		-- Have packer manage itself
		use("wbthomason/packer.nvim")
		-- Useful lua functions used ny lots of plugins
		use({ "nvim-lua/plenary.nvim", "nvim-lua/popup.nvim" })
		-------------------------- plugins -----------------------------
		-- fzf
		-- use({ "junegunn/fzf", run = ":call fzf#install()" })
		-- use({ "junegunn/fzf.vim" })
		-- winbar
		-- use('fgheng/winbar.nvim')
		-- nvim-ufo: code fold
		use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" })
		-- color-picker
		use("ziontee113/color-picker.nvim")
		-- surround
		use("kylechui/nvim-surround")
		-- fidget
		use("j-hui/fidget.nvim")
		-- trouble
		use({ "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons" })
		-- impatient
		use("lewis6991/impatient.nvim")
		-- toggleterm
		use("akinsho/toggleterm.nvim")
		-- lsp-status
		use("nvim-lua/lsp-status.nvim")
		-- copilot
		--[[ use("github/copilot.vim") ]]
		-- comment
		use("numToStr/Comment.nvim")
		-- autopairs
		use("windwp/nvim-autopairs")
		-- gitsigns
		use({ "lewis6991/gitsigns.nvim", tag = "release" })
		-- nvim-tree
		use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })
		-- bufferline
		use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" } })
		-- lualine
		use({ "nvim-lualine/lualine.nvim", requires = "kyazdani42/nvim-web-devicons" })
		use("arkav/lualine-lsp-progress")
		-- telescope
		use("nvim-telescope/telescope.nvim")
		-- project.nvim
		use("ahmedkhalf/project.nvim")
		-- dashboard-nvim
		use("glepnir/dashboard-nvim")
		-- treesitter
		use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
		use("JoosepAlviste/nvim-ts-context-commentstring")
		use("p00f/nvim-ts-rainbow")
		use("nvim-treesitter/playground")
		-- indent-blankline
		use("lukas-reineke/indent-blankline.nvim")
		-- code format
		use("jose-elias-alvarez/null-ls.nvim")
		--------------------- LSP --------------------
		use({
			"williamboman/mason.nvim", -- simple to use language server installer
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig", -- enable LSP
		})
		-- The completion engine
		use("hrsh7th/nvim-cmp")
		-- snippet engine
		use("L3MON4D3/LuaSnip")
		-- cmp plugins
		use("saadparwaiz1/cmp_luasnip")
		use("hrsh7th/cmp-nvim-lsp")
		use("hrsh7th/cmp-buffer")
		use("hrsh7th/cmp-path")
		use("hrsh7th/cmp-cmdline")
		-- a bunch of snippets tu use
		use("rafamadriz/friendly-snippets")
		-- JSON enhance
		use("b0o/schemastore.nvim")
		-- TS enhance
		use({ "jose-elias-alvarez/nvim-lsp-ts-utils", requires = "nvim-lua/plenary.nvim" })
		-- vim-illuminate
		use("RRethy/vim-illuminate")
		-- lspkind
		use("onsails/lspkind.nvim")
		--------------------- colorschemes --------------------
		-- tokyonight
		use("folke/tokyonight.nvim")
		-- OceanicNext
		use("mhartington/oceanic-next")
		-- gruvbox
		use({ "ellisonleao/gruvbox.nvim", requires = { "rktjmp/lush.nvim" } })
		-- nord
		use("shaunsingh/nord.nvim")
		-- onedark
		use("ful1e5/onedark.nvim")
		-- nightfox
		use("EdenEast/nightfox.nvim")
		-- sonokai
		use("sainnhe/sonokai")
		-- edge
		use("sainnhe/edge")
		-------------------------------------------------------
	end,
	config = {
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "single" })
			end,
		},
	},
	pcall(
		vim.cmd,
		[[
			augroup packer_user_config
			autocmd!
			autocmd BufWritePost plugins.lua source <afile> | PackerSync
			augroup end
		]]
	),
})
