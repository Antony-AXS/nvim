return {
	"Antony-AXS/dashboard-nvim",
	event = "VimEnter",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local ascii = require("ascii.headers")
		require("dashboard").setup({
			theme = "hyper",
			week_header = {
				enable = false,
			},
			config = {
				header = ascii.header_3,
				shortcut = {
					{
						icon = "  ", --   󰊤                
						icon_hl = "@variable",
						desc = "Github",
						group = "Label",
						action = function()
							vim.cmd("split | terminal")

							local open_cmd
							local sysname = vim.loop.os_uname().sysname
							local URL = "https://www.github.com/neovim/neovim"

							local open_cmd_table = {
								Linux = "xdg-open",
								macOS = "open",
								Windows = "explorer.exe",
							}

							open_cmd = open_cmd_table[sysname]

							local command = string.format(':call jobsend(b:terminal_job_id, "%s %s\\n")', open_cmd, URL)
							vim.cmd(command)
						end,
						key = "G",
					},
					{
						icon = "  ",
						icon_hl = "@variable",
						desc = "Files",
						group = "@property",
						action = "Telescope find_files",
						key = "F",
					},
					{
						icon = "󰊳  ",
						icon_hl = "@variable",
						desc = "Update",
						group = "Label",
						action = "Lazy update",
						key = "U",
					},
				},
				packages = { enable = true }, -- show how many plugins neovim loaded
				-- limit how many projects list, action when you press key or enter it will run this action.
				-- action can be a functino type, e.g.
				-- action = function(path) vim.cmd('Telescope find_files cwd=' .. path) end,
				project = {
					enable = true,
					limit = 2,
					icon = "  ", --       󰝰        󰉖    󰉕  󱞞  󰉓  󱁽        󰏓
					label = "folder(s)",
					action = "Telescope find_files cwd=",
				},
				mru = { limit = 5, icon = "  ", label = "file(s)", cwd_only = false }, --         
			},
		})
	end,
}
