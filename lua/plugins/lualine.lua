return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	-- lazy = true,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "auto",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				always_show_tabline = true,
				globalstatus = true,
				refresh = {
					statusline = 100,
					tabline = 100,
					winbar = 100,
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = {
					"filename",
					{
						function()
							return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
						end,
						icon = "",
						color = { fg = "green" },
					},
				},
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {
				-- lualine_a = { "buffers" },
				-- lualine_b = {},
				-- lualine_c = { "filename" },
				-- lualine_x = {},
				-- lualine_y = {},
				-- lualine_z = {},
			},
			winbar = {},
			inactive_winbar = {},
			extensions = {},
		})
	end,
}
