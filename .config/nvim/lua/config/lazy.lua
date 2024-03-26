
--
-- ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
-- ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
-- ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
-- ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
-- ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
-- ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
--


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	root = vim.fn.stdpath("data") .. "/lazy", -- directory where plugins will be installed
	lockfile = vim.fn.stdpath("config") .. "/lazy-lock.json", -- lockfile generated after running update.
	checker = {
		-- automatically check for plugin updates
		enabled = true,
		-- get a notification when new updates are found
		-- disable it as it's too annoying
		notify = false,
		-- check for updates every day
		frequency = 86400
	},
	change_detection = {
		-- automatically check for config file changes and reload the ui
		enabled = true,
		-- get a notification when changes are found
		-- disable it as it's too annoying
		notify = false
	},
	performance = {
		cache = {
			enabled = true
		}
	},
	state = vim.fn.stdpath("state") .. "/lazy/state.json", -- state info for checker and other things


	--PLUGINS INSTALLATION

	{
		'lewis6991/gitsigns.nvim', -- git diffs in sign column.
		-- version = 'release', -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
	},
	{
		'nvim-telescope/telescope.nvim', 
		tag = '0.1.4',
		dependencies = { 
			'nvim-lua/plenary.nvim',
			"nvim-telescope/telescope-live-grep-args.nvim" ,
		}
	},
	{
		"williamboman/mason.nvim", -- LSP servers packet manager
		"williamboman/mason-lspconfig.nvim", -- unites lspconfig and mason
		"neovim/nvim-lspconfig", -- sets up config to enable comms between nvim and my lsp's
	},
	{
		'akinsho/bufferline.nvim', 
		version = "*", 
		dependencies = 'nvim-tree/nvim-web-devicons'   	
	},
	'nvim-tree/nvim-tree.lua',
	'nvim-lualine/lualine.nvim',
	'nvim-treesitter/nvim-treesitter',
	{
		'christoomey/vim-tmux-navigator',
		lazy = true,
		keys = {
			{ "<C-l>", "", desc = "l" },
			{ "<C-k>", "", desc = "k" },
			{ "<C-j>", "", desc = "j" },
			{ "<C-h>", "", desc = "h" },
		},
	},
	-- A completion plugin for neovim coded in Lua.
	{
		"hrsh7th/nvim-cmp",
		dependencies = {"L3MON4D3/LuaSnip", "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-path", "hrsh7th/cmp-buffer", "saadparwaiz1/cmp_luasnip"}
	},
	"folke/tokyonight.nvim",
	"github/copilot.vim",
	{
		'akinsho/toggleterm.nvim', 
		version = "*", 
		config = true,
	},
	{
		'numToStr/Comment.nvim',
		opts = {
			-- add any options here
		},
		lazy = false,
	}

})
