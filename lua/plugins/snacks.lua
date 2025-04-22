return {
	"folke/snacks.nvim",
	priority = 1000,
	-- lazy = false,
	event = "VeryLazy",
	---@type snacks.Config
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		bigfile = { enabled = true },
		dashboard = { enabled = true },
		explorer = { enabled = true },
		indent = { enabled = false },
		input = { enabled = true },
		picker = { enabled = true },
		notifier = { enabled = true },
		quickfile = { enabled = true },
		scope = { enabled = false },
		scroll = { enabled = false },
		statuscolumn = { enabled = false },
		words = { enabled = false },
	},
	config = function()
		local Snacks = require("snacks")
		vim.keymap.set("n", "<leader>sx", function()
			Snacks.picker.files({ cwd = vim.fn.system("git rev-parse --show-toplevel"):gsub("\n", "") })
		end, {})
		vim.keymap.set("n", "<leader>sb", function()
			Snacks.picker.git_branches()
		end, {})
	end,
}
