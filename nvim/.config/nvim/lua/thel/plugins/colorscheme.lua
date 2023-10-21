return {
	{
		"rebelot/kanagawa.nvim",
		priority = 1000,
		config = function()
			require("kanagawa").setup({
				transparent = true,
				overrides = function(colors)
					local theme = colors.theme
					return {
						-- borderless telescope
						TelescopeTitle = { fg = theme.ui.special, bold = true },
						TelescopePromptNormal = { bg = "NONE" },
						TelescopePromptBorder = { fg = theme.ui.bd_dim, bg = "NONE" },
						TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = "NONE"},
						TelescopeResultsBorder = { fg = theme.ui.bd_dim, bg = "NONE" },
						TelescopePreviewNormal = { bg = "NONE"},
						TelescopePreviewBorder = { bg = "NONE", fg = theme.ui.bd_dim},
						-- Dark completion (popup) menu
						Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
						PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
						PmenuSbar = { bg = theme.ui.bg_m1 },
						PmenuThumb = { bg = theme.ui.bg_p2 },
					}
				end,
			})
			vim.cmd("colorscheme kanagawa-dragon")
            vim.cmd 'highlight TelescopeBorder guibg=none'
            vim.cmd 'highlight TelescopeTitle guibg=none'
		end,
	},
}
