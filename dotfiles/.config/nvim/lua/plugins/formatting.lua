return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					python = { "ruff_format" },
					rust = { "rustfmt" },
				javascript = { "prettier", "oxfmt", stop_after_first = true },
				javascriptreact = { "prettier", "oxfmt", stop_after_first = true },
				typescript = { "prettier", "oxfmt", stop_after_first = true },
				typescriptreact = { "prettier", "oxfmt", stop_after_first = true },
				html = { "prettier", "oxfmt", stop_after_first = true },
				css = { "prettier", "oxfmt", stop_after_first = true },
				scss = { "prettier", "oxfmt", stop_after_first = true },
				json = { "prettier", "oxfmt", stop_after_first = true },
				markdown = { "prettier", "oxfmt", stop_after_first = true },
				sh = { "shfmt" },
				bash = { "shfmt" },
			},
			format_on_save = { timeout_ms = 1000, lsp_format = "fallback" },
			})
		end,
	},
	{
		"mfussenegger/nvim-lint",
		event = { "BufWritePost", "InsertLeave" },
		config = function()
			local lint = require("lint")
			lint.linters_by_ft = {
				javascript = { "oxlint" },
				javascriptreact = { "oxlint" },
				typescript = { "oxlint" },
				typescriptreact = { "oxlint" },
				sh = { "shellcheck" },
				bash = { "shellcheck" },
			}
			vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
				callback = function()
					lint.try_lint()
				end,
			})
		end,
	},
}