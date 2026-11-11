return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		cmd = "ToggleTerm",
		opts = {
			direction = "horizontal",
			size = require("config.panes").terminal_height,
			persist_size = false,
			shade_terminals = true,
			on_open = function(terminal)
				local panes = require("config.panes")
				vim.api.nvim_win_set_config(terminal.window, { split = "below", win = panes.content_window() })
				vim.api.nvim_win_set_height(terminal.window, panes.terminal_height)
				vim.wo[terminal.window].winfixheight = true
			end,
		},
	},
}
