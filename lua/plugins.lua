local git = require("plugins/git")
local dadbod = require("plugins/dadbod")
local colorschemes = require("plugins/colorschemes")

return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = "VeryLazy",
		dependencies = {
			{
				"j-hui/fidget.nvim",
				opts = {},
			},
			{
				"nvim-treesitter/nvim-treesitter-textobjects",
				event = "VeryLazy",
			},
			-- 	{ "RRethy/nvim-treesitter-endwise", cond = not locals.treesitter_dev }
		},
	},
	{
		"neovim/nvim-lspconfig",
	},
	{
		"mason-org/mason.nvim",
		branch = "v1.x",
		lazy = true,
		event = "VeryLazy",
	},
	{
		"mason-org/mason-lspconfig.nvim",
		branch = "v1.x",
		opts = {
			auto_install = true,
		},
		dependencies = {
			{
				"j-hui/fidget.nvim",
				opts = {},
			},
		},
		lazy = true,
		event = "VeryLazy",
	},
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"mason-org/mason.nvim",
			"nvimtools/none-ls.nvim",
		},
		config = function()
			require("your.null-ls.config") -- require your null-ls config here (example below)
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	{
		"neovim/nvim-lspconfig",
		lazy = true,
		event = "VeryLazy",
		dependencies = {
			"j-hui/fidget.nvim",
			opts = {},
		},
	},
	{
		"nvimtools/none-ls.nvim",
		lazy = true,
		event = "VeryLazy",
		dependencies = {
			"j-hui/fidget.nvim",
			opts = {},
		},
	},
	{
		"hrsh7th/nvim-cmp", --  the completion plugin
		event = "VeryLazy",
	},
	{
		"folke/lazydev.nvim",
		event = "VeryLazy",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		},
	},
	{ "Bilal2453/luvit-meta", event = "VeryLazy", lazy = true },
	{
		"hrsh7th/cmp-nvim-lsp",
		event = "VeryLazy",
		opts = function(_, opts)
			opts.sources = opts.sources or {}
			table.insert(opts.sources, {
				name = "lazydev",
				group_index = 0, -- set group index to 0 to skip loading LuaLS completions
			})
		end,
	},
	{
		"hrsh7th/cmp-nvim-lua",
		event = "VeryLazy",
	},
	{
		"L3MON4D3/LuaSnip",
		event = "VeryLazy",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
		build = "make install_jsregexp",
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {}, -- this is equalent to setup({}) function
	},
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
	},

	git,
	dadbod,
	colorschemes,

	-- {
	-- 	"tpope/vim-commentary",
	-- },
	-- {
	-- 	"JoosepAlviste/nvim-ts-context-commentstring",
	-- },
	-- {
	-- 	"BurntSushi/ripgrep",
	-- },
	-- {
	-- 	"glepnir/dbsession.nvim",
	-- 	cmd = { "SessionSave", "SessionDelete", "SessionLoad" },
	-- },
	-- {
	-- 	"mg979/vim-visual-multi",
	-- },
	-- {
	-- 	"kkharji/sqlite.lua",
	-- },
}
