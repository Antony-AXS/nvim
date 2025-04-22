return {
	"Antony-AXS/indicator.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local Indicator = require("indicator")

		Indicator.setup({
			indicator_event = true,
			window_highlight_event = false,
			window_count_status = {
				tab = {
					activate = true,
					position = { section = "x", index = 1 },
				},
				window = {
					activate = true,
					position = { section = "x", index = 1 },
				},
			},
		})

		vim.keymap.set("n", "<leader>l", function()
			Indicator.indicateCurrent()
		end, { silent = true })
		vim.keymap.set("n", "<leader>bv", function()
			Indicator.indicateAll()
		end, { silent = true })
		vim.keymap.set("n", "<leader>bc", function()
			Indicator.indicateAll()
		end, { silent = true })

		vim.keymap.set("n", "<leader>im", function()
			Indicator.triggerWindowManager()
		end, {})

		vim.keymap.set("n", "<leader>it", Indicator.indicator_event_activate, {})
		vim.keymap.set("n", "<leader>ir", Indicator.indicator_event_deactivate, {})

		vim.keymap.set("n", "<leader>iw", Indicator.window_highlight_event_activate, {})
		vim.keymap.set("n", "<leader>iq", Indicator.window_highlight_event_deactivate, {})
	end,
}
