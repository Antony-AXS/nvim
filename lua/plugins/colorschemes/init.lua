return {
	{
		"catppuccin/nvim",
		lazy = false,
		event = "VeryLazy",
		name = "catppuccin",
		priority = 1000,
		config = function()
			-- local latte = require("catppuccin.palettes").get_palette("latte")
			local frappe = require("catppuccin.palettes").get_palette("frappe")
			local macchiato = require("catppuccin.palettes").get_palette("macchiato")
			local mocha = require("catppuccin.palettes").get_palette("mocha")

			require("catppuccin").setup({
				flavour = "frappe", -- latte, frappe, macchiato, mocha
				flavours = { latte = 1, frappe = 2, macchiato = 3, mocha = 4 },
				background = { -- :h background
					light = "mocha",
					dark = "frappe",
				},
				transparent_background = true,
				show_end_of_buffer = true, -- shows the '~' characters after the end of buffers
				float = {
					transparent = true, -- enable transparent floating windows
					solid = false, -- use solid styling for floating windows, see |winborder|
				},
				styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
					comments = { "italic" }, -- Change the style of comments
					conditionals = { --[["italic"]]
					},
					loops = {},
					functions = { "bold" },
					keywords = {},
					strings = {},
					variables = {},
					numbers = {},
					booleans = { "bold" },
					properties = {},
					types = {},
					operators = {},
				},
				integrations = {
					cmp = true,
					gitsigns = true,
					nvimtree = true,
					treesitter = true,
					notify = true,
					mini = {
						enabled = true,
						indentscope_color = "",
					},
					native_lsp = {
						enabled = true,
						virtual_text = {
							errors = { "italic" },
							hints = { "italic" },
							warnings = { "italic" },
							information = { "italic" },
						},
						underlines = {
							errors = { "underline" },
							hints = {},
							warnings = { "underline" },
							information = {},
						},
						inlay_hints = {
							background = true,
						},
					},
				},
				color_overrides = {
					all = {
						text = "#c9f0e0",
					},
					latte = {
						base = "#ff0000",
						mantle = "#242424",
						crust = "#474747",
					},
					frappe = frappe,
					macchiato = macchiato,
					mocha = mocha,
				},
				highlight_overrides = {
					all = function(colors)
						return {
							NvimTreeNormal = { fg = colors.none },
							CmpBorder = { fg = "#3e4145" },
						}
					end,
					latte = function(latte)
						return {
							Normal = { fg = latte.base },
						}
					end,
					frappe = function(frappe)
						return {
							["@comment"] = { fg = frappe.surface2, style = { "italic" } },
						}
					end,
					macchiato = function(macchiato)
						return {
							LineNr = { fg = macchiato.overlay1 },
						}
					end,
					mocha = function(mocha)
						return {
							Comment = { fg = mocha.flamingo },
						}
					end,
				},
			})

			-- vim.cmd.colorscheme("catppuccin")
		end,
	},
	{
		"craftzdog/solarized-osaka.nvim",
		lazy = true,
		event = "VeryLazy",
		priority = 1000,
		opts = {},
		config = function()
			require("solarized-osaka").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				transparent = false, -- Enable this to disable setting the background color
				terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
				styles = {
					-- Style to be applied to different syntax groups
					-- Value is any valid attr-list value for `:help nvim_set_hl`
					comments = { italic = true },
					keywords = { italic = true },
					functions = {},
					variables = {},
					-- Background styles. Can be "dark", "transparent" or "normal"
					sidebars = "transparent", -- style for sidebars, see below
					floats = "transparent", -- style for floating windows
				},
				sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
				day_brightness = 0.7, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
				hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
				dim_inactive = false, -- dims inactive windows
				lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold

				--- You can override specific color groups to use other groups or a hex color
				--- function will be called with a ColorScheme table
				---@param colors ColorScheme
				on_colors = function(colors)
					colors.hint = colors.yellow
					colors.error = "#ff0000"
				end,
				--- You can override specific highlights to use other groups or a hex color
				--- function will be called with a Highlights and ColorScheme table
				---@param highlights Highlights
				---@param colors ColorScheme
				on_highlights = function(hl, c)
					-- local prompt = "#2d3149"
					hl.TelescopeNormal = {
						bg = c.bg_dark,
						fg = c.fg_dark,
					}
					hl.TelescopeBorder = {
						bg = c.bg_dark,
						fg = c.fg_dark,
					}
					hl.TelescopePromptNormal = {
						bg = c.bg_dark,
					}
					hl.TelescopePromptBorder = {
						bg = c.bg_dark,
						fg = c.fg_dark,
					}
					hl.TelescopePromptTitle = {
						bg = c.bg_dark,
						fg = c.fg_dark,
					}
					hl.TelescopePreviewTitle = {
						bg = c.bg_dark,
						fg = c.bg_dark,
					}
					hl.TelescopeResultsTitle = {
						bg = c.bg_dark,
						fg = c.bg_dark,
					}
				end,
			})
		end,
	},
	{
		"folke/tokyonight.nvim",
		event = "VeryLazy",
	},
}
