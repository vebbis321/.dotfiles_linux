return {

	-- this taps into vim.ui.select and vim.ui.input
	-- and in doing so currently breaks renaming in otter.nvim
	{ "stevearc/dressing.nvim", enabled = false },

	{
		"quarto-dev/quarto-nvim",
		opts = {
			lspFeatures = {
				languages = { "r", "python", "julia", "bash", "html", "lua" },
			},
		},
		ft = "quarto",
		keys = {
			{ "<leader>qa", ":QuartoActivate<cr>", desc = "quarto activate" },
			{ "<leader>qp", ":lua require'quarto'.quartoPreview()<cr>", desc = "quarto preview" },
			{ "<leader>qq", ":lua require'quarto'.quartoClosePreview()<cr>", desc = "quarto close" },
			{ "<leader>qh", ":QuartoHelp ", desc = "quarto help" },
			{ "<leader>qe", ":lua require'otter'.export()<cr>", desc = "quarto export" },
			{ "<leader>qE", ":lua require'otter'.export(true)<cr>", desc = "quarto export overwrite" },
			{ "<leader>qrr", ":QuartoSendAbove<cr>", desc = "quarto run to cursor" },
			{ "<leader>qra", ":QuartoSendAll<cr>", desc = "quarto run all" },
			{ "<leader><cr>", ":SlimeSend<cr>", desc = "send code chunk" },
			{ "<c-cr>", ":SlimeSend<cr>", desc = "send code chunk" },
			{ "<c-cr>", "<esc>:SlimeSend<cr>i", mode = "i", desc = "send code chunk" },
			{ "<c-cr>", "<Plug>SlimeRegionSend<cr>", mode = "v", desc = "send code chunk" },
			{ "<cr>", "<Plug>SlimeRegionSend<cr>", mode = "v", desc = "send code chunk" },
		},
	},

	{
		"jmbuhr/otter.nvim",
		opts = {
			buffers = {
				set_filetype = true,
			},
		},
	},

	-- send code from python/r/qmd documets to a terminal or REPL
	-- like ipython, R, bash
	{
		"jpalardy/vim-slime",
		config = function()
			vim.cmd("let g:slime_target = 'tmux'")
		end,
	},
}
