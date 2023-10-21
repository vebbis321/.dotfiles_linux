return {
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		dependencies = {
			"windwp/nvim-ts-autotag",
		},
		config = function()
			-- import nvim-treesitter plugin
			local treesitter = require("nvim-treesitter.configs")

			-- configure treesitter
			treesitter.setup({ -- enable syntax highlighting
				highlight = {
					enable = true,
				},
				-- enable indentation
				indent = { enable = true },
				-- enable autotagging (w/ nvim-ts-autotag plugin)
				autotag = { enable = true },
				-- ensure these language parsers are installed
				ensure_installed = {
					"c",
                    "python",
					"html",
					"css",
					"typescript",
					"javascript",
					"swift",
					"objc",
					"lua",
					"markdown",
					"markdown_inline",
					"json",
					"vimdoc",
					"dockerfile",
					"gitignore"
				},
				-- auto install above language parsers
				auto_install = true,
			})
		end,
}
