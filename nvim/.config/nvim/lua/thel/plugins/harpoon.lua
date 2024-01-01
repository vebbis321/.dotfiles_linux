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

		keymap.set("n", "<leader>h", mark.add_file)
		keymap.set("n", "<C-e>", ui.toggle_quick_menu)

		keymap.set("n", "F1", function()
			ui.nav_file(1)
		end)
		keymap.set("n", "F2", function()
			ui.nav_file(2)
		end)
		keymap.set("n", "F3", function()
			ui.nav_file(3)
		end)
		keymap.set("n", "F4", function()
			ui.nav_file(4)
		end)
	end,
}
