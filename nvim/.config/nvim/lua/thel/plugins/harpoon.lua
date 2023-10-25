return {
	"ThePrimeagen/harpoon",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		-- set keymaps
		local keymap = vim.keymap
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")

		keymap.set("n", "<leader>a", mark.add_file)
		keymap.set("n", "<C-e>", ui.toggle_quick_menu)

		keymap.set("n", "<C-h>", function()
			ui.nav_file(1)
		end)
		keymap.set("n", "<C-j>", function()
			ui.nav_file(2)
		end)
		keymap.set("n", "<C-k>", function()
			ui.nav_file(3)
		end)
		keymap.set("n", "<C-l>", function()
			ui.nav_file(4)
		end)
	end,
}
