return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = {
					enabled = true,
					auto_trigger = true,
					keymap = { accept = "<C-y>", next = "<M-]>", prev = "<M-[>", dismiss = "<C-]>" },
				},
				panel = { enabled = true },
			})
		end,
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = { "CopilotChat", "CopilotChatOpen", "CopilotChatToggle", "CopilotChatModels", "CopilotChatPrompts" },
		keys = {
			{
				"<leader>ac",
				function()
					require("CopilotChat").toggle()
				end,
				mode = { "n", "x" },
				desc = "Toggle Copilot Chat",
			},
		},
		opts = {
			tools = { "buffer", "file", "glob", "grep", "gitdiff" },
			window = { layout = "vertical", width = 0.4 },
			auto_insert_mode = true,
		},
	},
}