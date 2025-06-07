return {
	"lukas-reineke/indent-blankline.nvim",
	event = "VeryLazy",
	lazy = true,
	main = "ibl",
	opts = {},
	config = function()
		require("ibl").setup({
			-- indent = { highlight = highlight },
			scope = { enabled = false },
			exclude = {
				filetypes = {
					"text",
					"help",
					"alpha",
					"dashboard",
					"neo-tree",
					"Trouble",
					"trouble",
					"lazy",
					"mason",
					"notify",
					"toggleterm",
					"lazyterm",
				},
			},
		})
	end,
}
