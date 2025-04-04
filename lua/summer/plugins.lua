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
		-- neodev
		use("folke/neodev.nvim")
		-- which-key
		use({
			"folke/which-key.nvim",
			event = "vimEnter",
			keys = { [[<leader>]] },
			config = function()
				require("summer.plugin-config.which-key")
			end,
			disable = false,
			requires = { "echasnovski/mini.icons", "nvim-tree/nvim-web-devicons" },
		})
		-- delimeter rainbow
		use("luochen1990/rainbow")
		-- auto-session
		use("rmagatti/auto-session")
		-- barbecue
		use({ "utilyre/barbecue.nvim", tag = "*", requires = { "SmiteshP/nvim-navic", "nvim-tree/nvim-web-devicons" } })
		-- nvim-ufo: code fold
		use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" })
		-- color-picker
		use("ziontee113/color-picker.nvim")
		-- surround
		use("kylechui/nvim-surround")
		-- fidget
		use({ "j-hui/fidget.nvim" })
		-- trouble
		use({
			"folke/trouble.nvim",
			requires = { "nvim-tree/nvim-web-devicons" },
		})
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
		use({
			"lewis6991/gitsigns.nvim",
			--[[ tag = "release", -- To use the latest release (do not use this if you run Neovim nightly or dev builds!) ]]
		})
		-- nvim-tree
		use({ "nvim-tree/nvim-tree.lua", requires = "nvim-tree/nvim-web-devicons" })
		-- bufferline
		use({ "akinsho/bufferline.nvim", requires = { "nvim-tree/nvim-web-devicons", "moll/vim-bbye" } })
		-- lualine
		--[[ use({ "nvim-lualine/lualine.nvim", requires = "nvim-tree/nvim-web-devicons" })
		use("arkav/lualine-lsp-progress") ]]
		-- galaxyline
		use({
			"glepnir/galaxyline.nvim",
			branch = "main",
			-- some optional icons
			requires = { "nvim-tree/nvim-web-devicons", opt = true },
		})
		-- telescope
		use({ "nvim-telescope/telescope.nvim" })
		-- project.nvim
		use("ahmedkhalf/project.nvim")
		-- dashboard-nvim
		use("glepnir/dashboard-nvim")
		-- treesitter
		use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
		use("JoosepAlviste/nvim-ts-context-commentstring")
		use("nvim-treesitter/playground")
		-- indent-blankline
		use("lukas-reineke/indent-blankline.nvim")
		-------------------- Debug -------------------
		use({
			"mfussenegger/nvim-dap",
			opt = true,
			-- keys = { [[<leader>d]] },
			module = { "dap" },
			requires = {
				{ "theHamsta/nvim-dap-virtual-text", module = "nvim-dap-virtual-text" },
				"rcarriga/nvim-dap-ui",
				"mfussenegger/nvim-dap-python",
				"nvim-telescope/telescope-dap.nvim",
				{ "leoluz/nvim-dap-go", module = "dap-go" },
				{ "jbyuki/one-small-step-for-vimkind", module = "osv" },
				{ "mxsdev/nvim-dap-vscode-js" },
				--[[ { ]]
				--[[ 	"microsoft/vscode-js-debug", ]]
				--[[ 	opt = true, ]]
				--[[ 	run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out", ]]
				--[[ }, ]]
			},
			config = function()
				require("summer.dap").setup()
			end,
			disable = false,
		})
		--------------------- LSP --------------------
		use({
			"williamboman/mason.nvim", -- simple to use language server installer
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig", -- enable LSP
		})
		-- code format
		use({
			"jay-babu/mason-null-ls.nvim",
			after = { "mason.nvim" },
			requires = { "williamboman/mason.nvim", "nvimtools/none-ls.nvim" },
			config = function()
				require("summer.lsp.mason-null-ls")
			end,
		})
		use({
			"nvimtools/none-ls.nvim",
			after = { "mason-null-ls.nvim" },
			requires = { "gbprod/none-ls-shellcheck.nvim", "nvimtools/none-ls-extras.nvim" },
			config = function()
				require("summer.lsp.null-ls")
			end,
		})
		-- The completion engine
		use("hrsh7th/nvim-cmp")
		-- snippet engine
		use({ "L3MON4D3/LuaSnip", run = "make install_jsregexp" })
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
		-- onedarkpro
		use("olimorris/onedarkpro.nvim")
		-- catppuccin
		use({ "catppuccin/nvim", as = "catppuccin" })
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
		--ayu
		use("ayu-theme/ayu-vim")
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
