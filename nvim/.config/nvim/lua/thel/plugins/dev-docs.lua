return {
	"luckasRanarison/nvim-devdocs",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	keys = {
		{ "<leader>dd", "<cmd>DevdocsOpenCurrent<cr>" },
		{ "<leader>dda", "<cmd>DevdocsOpen<cr>" },
	},
	opts = {
		dir_path = vim.fn.stdpath("data") .. "/devdocs", -- installation directory
		wrap = true, -- text wrap, only applies to floating window
		previewer_cmd = "glow", -- for example: "glow"
		cmd_args = { "dark" }, -- example using glow: { "-s", "dark", "-w", "80" }
		picker_cmd_args = { "dark" }, -- example using glow: { "-s", "dark", "-w", "50" }
	},
}
