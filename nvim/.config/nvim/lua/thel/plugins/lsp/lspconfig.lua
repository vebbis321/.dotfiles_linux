return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		"folke/neodev.nvim",
	},
	config = function()
		require("neodev").setup()

		-- import lspconfig plugin
		local lspconfig = require("lspconfig")

		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap -- for conciseness

		local opts = { noremap = true, silent = true }
		local on_attach = function(client, bufnr)
			opts.buffer = bufnr

			-- set keybinds
			vim.keymap.set("n", "gd", function()
				vim.lsp.buf.definition()
			end, opts)
			vim.keymap.set("n", "K", function()
				vim.lsp.buf.hover()
			end, opts)
			vim.keymap.set("n", "<leader>vd", function()
				vim.diagnostic.open_float()
			end, opts)
			vim.keymap.set("n", "[d", function()
				vim.diagnostic.goto_next()
			end, opts)
			vim.keymap.set("n", "]d", function()
				vim.diagnostic.goto_prev()
			end, opts)
			vim.keymap.set("n", "<leader>vca", function()
				vim.lsp.buf.code_action()
			end, opts)

			opts.desc = "Restart LSP"
			keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
		end

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		local util = require("lspconfig.util")

		-- Change the Diagnostic symbols in the sign column (gutter)
		-- (not in youtube nvim video)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- configure sourcekit-lsp  server
		--lspconfig["sourcekit"].setup({
		--cmd = { "sourcekit-lsp" },
		--filetypes = { "swift", "c", "cpp", "objective-c", "objective-cpp" },
		--root_dir = lspconfig.util.root_pattern("Package.swift", ".git"),
		--})

		lspconfig["clangd"].setup({
			on_attach = on_attach,
			capabilities = cmp_nvim_lsp.default_capabilities(),
			cmd = {
				"clangd",
				"--offset-encoding=utf-16",
			},
		})

		-- configure html server
		lspconfig["html"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure css server
		lspconfig["cssls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure typescript server with plugin
		lspconfig["tsserver"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure python server
		lspconfig.pyright.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				python = {
					stubPath = vim.fn.stdpath("data") .. "/lazy/python-type-stubs",
					analysis = {
						autoSearchPaths = true,
						useLibraryCodeForTypes = false,
						diagnosticMode = "openFilesOnly",
						reportUnusedExpression = "none",
					},
				},
			},
			root_dir = function(fname)
				return util.root_pattern(".git", "setup.py", "setup.cfg", "pyproject.toml", "requirements.txt")(fname)
					or util.path.dirname(fname)
			end,
		})

		lspconfig["ltex"].setup({
			on_attach = on_attach,
			settings = {
				ltex = {
					language = "en-US",
					additionalRules = {
						languageModel = "~/ngrams/",
					},
				},
			},
		})

		lspconfig.marksman.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = { "markdown", "quarto" },
			root_dir = util.root_pattern(".git", ".marksman.toml", "_quarto.yml"),
		})

		-- configure lua server (with special settings)
		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = { -- custom settings for lua
				Lua = {
					-- make the language server recognize "vim" global
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})
	end,
}
