local M = {
	explorer_width = 32,
	terminal_height = 16,
}

function M.content_window()
	local content = vim.t.content_window
	if content and vim.api.nvim_win_is_valid(content) and vim.api.nvim_win_get_tabpage(content) == vim.api.nvim_get_current_tabpage() then
		local buffer = vim.api.nvim_win_get_buf(content)
		if vim.bo[buffer].filetype ~= "neo-tree" and vim.bo[buffer].buftype ~= "terminal" then
			return content
		end
	end
	for _, window in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
		local buffer = vim.api.nvim_win_get_buf(window)
		if vim.api.nvim_win_get_config(window).relative == "" and vim.bo[buffer].filetype ~= "neo-tree" and vim.bo[buffer].buftype ~= "terminal" then
			vim.t.content_window = window
			return window
		end
	end
	vim.cmd("botright vnew")
	vim.t.content_window = vim.api.nvim_get_current_win()
	return vim.t.content_window
end

function M.open_explorer()
	for _, window in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
		if vim.bo[vim.api.nvim_win_get_buf(window)].filetype == "neo-tree" then
			vim.api.nvim_win_set_width(window, M.explorer_width)
			vim.wo[window].winfixwidth = true
			vim.api.nvim_set_current_win(window)
			return
		end
	end
	local content = M.content_window()
	vim.api.nvim_set_current_win(content)
	local directory = vim.fn.expand("%:p:h")
	require("neo-tree.command").execute({
		action = "focus",
		source = "filesystem",
		position = "left",
		dir = directory,
	})
	vim.wo.winfixwidth = true
end

function M.toggle_terminal()
	vim.api.nvim_set_current_win(M.content_window())
	vim.cmd.ToggleTerm()
end

return M