return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			local parsers = {
				"bash", "css", "html", "javascript", "json", "lua", "markdown", "markdown_inline",
				"python", "rust", "scss", "tsx", "typescript", "vim", "vimdoc", "yaml",
			}
			require("nvim-treesitter").setup()
			require("nvim-treesitter").install(parsers)
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "bash", "css", "html", "javascript", "javascriptreact", "json", "lua", "markdown", "python", "rust", "scss", "typescript", "typescriptreact", "vim", "vimdoc", "yaml" },
				callback = function(event)
					pcall(vim.treesitter.start, event.buf)
				end,
			})
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		opts = {
			open_files_in_last_window = true,
			default_component_configs = {
				indent = { with_markers = false },
			},
			window = {
				position = "left",
				width = require("config.panes").explorer_width,
			},
			filesystem = {
				bind_to_cwd = false,
				follow_current_file = { enabled = true },
				filtered_items = { visible = true },
				window = { mappings = { ["-"] = "navigate_up" } },
			},
			buffers = {
				follow_current_file = { enabled = true },
			},
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = function()
			local telescope = require("telescope")
			telescope.setup({ defaults = { sorting_strategy = "ascending", layout_config = { prompt_position = "top" } } })
			telescope.load_extension("fzf")
		end,
	},
	{
		"numToStr/Comment.nvim",
		keys = { "gc", "gb" },
		opts = {},
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},
}
