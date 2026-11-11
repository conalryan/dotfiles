return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"ts_ls",
					"pyright",
					"rust_analyzer",
					"html",
					"cssls",
					"marksman",
					"bashls",
					"angularls",
					"eslint",
				},
				automatic_enable = false,
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(event)
					local opts = { buffer = event.buf }
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "Go to definition" }))
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, vim.tbl_extend("force", opts, { desc = "Go to declaration" }))
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, vim.tbl_extend("force", opts, { desc = "Go to implementation" }))
					vim.keymap.set("n", "gr", vim.lsp.buf.references, vim.tbl_extend("force", opts, { desc = "Find references" }))
					vim.keymap.set("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Hover documentation" }))
					vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, opts)
				end,
			})

			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local servers = {
				"ts_ls",
				"pyright",
				"rust_analyzer",
				"html",
				"cssls",
				"marksman",
				"bashls",
				"angularls",
				"eslint",
			}
			for _, server in ipairs(servers) do
				vim.lsp.config(server, { capabilities = capabilities })
			end
			vim.lsp.config("ts_ls", {
				init_options = {
					preferences = {
						includeCompletionsForModuleExports = true,
						includeAutomaticOptionalChainCompletions = true,
						importModuleSpecifierPreference = "non-relative",
					},
				},
			})
			vim.lsp.enable(servers)

			vim.diagnostic.config({
				virtual_text = false,
				severity_sort = true,
				float = { border = "rounded", source = "if_many" },
				signs = true,
				underline = true,
			})
		end,
	},
}