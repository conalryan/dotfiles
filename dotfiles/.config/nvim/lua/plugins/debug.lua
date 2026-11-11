return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
		},
		keys = {
			{ "<leader>Db", function() require("dap").toggle_breakpoint() end, desc = "Toggle breakpoint" },
			{ "<leader>Dc", function() require("dap").continue() end, desc = "Start or continue debugging" },
			{ "<leader>Di", function() require("dap").step_into() end, desc = "Step into" },
			{ "<leader>Do", function() require("dap").step_over() end, desc = "Step over" },
			{ "<leader>DO", function() require("dap").step_out() end, desc = "Step out" },
			{ "<leader>Dt", function() require("dap").terminate() end, desc = "Terminate debug session" },
			{ "<leader>Du", function() require("dapui").toggle() end, desc = "Toggle debug UI" },
			{ "<leader>De", function() require("dapui").eval() end, mode = { "n", "v" }, desc = "Evaluate expression" },
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			local mason_bin = vim.fn.stdpath("data") .. "/mason/bin/"

			dapui.setup()
			dap.listeners.after.event_initialized["dapui"] = function() dapui.open() end
			dap.listeners.before.event_terminated["dapui"] = function(session)
				if not session.parent then dapui.close() end
			end
			dap.listeners.before.event_exited["dapui"] = function(session)
				if not session.parent then dapui.close() end
			end

			local js_adapter = {
				type = "server",
				host = "127.0.0.1",
				port = "${port}",
				executable = {
					command = mason_bin .. "js-debug-adapter",
					args = { "${port}", "127.0.0.1" },
				},
			}
			dap.adapters["pwa-node"] = js_adapter
			dap.adapters["pwa-chrome"] = js_adapter
			dap.adapters.debugpy = {
				type = "executable",
				command = mason_bin .. "debugpy-adapter",
			}
			dap.adapters.codelldb = {
				type = "server",
				port = "${port}",
				executable = {
					command = mason_bin .. "codelldb",
					args = { "--port", "${port}" },
				},
			}

			local node_attach = {
				type = "pwa-node",
				request = "attach",
				name = "Attach to Node on port 9229",
				address = "127.0.0.1",
				port = 9229,
				cwd = "${workspaceFolder}",
				sourceMaps = true,
			}
			local chrome_launch = {
				type = "pwa-chrome",
				request = "launch",
				name = "Launch Chrome",
				url = function()
					local url = vim.fn.input("URL: ", "http://localhost:3000")
					return url ~= "" and url or dap.ABORT
				end,
				webRoot = "${workspaceFolder}",
				sourceMaps = true,
			}
			for _, filetype in ipairs({ "typescript", "typescriptreact", "javascript", "javascriptreact" }) do
				local is_typescript = filetype == "typescript" or filetype == "typescriptreact"
				dap.configurations[filetype] = {
					{
						type = "pwa-node",
						request = "launch",
						name = is_typescript and "Launch TypeScript file with tsx" or "Launch JavaScript file",
						program = "${file}",
						cwd = "${workspaceFolder}",
						runtimeExecutable = "node",
						runtimeArgs = is_typescript and { "--import", "tsx" } or {},
						sourceMaps = true,
					},
					node_attach,
					chrome_launch,
				}
			end

			dap.configurations.python = {
				{
					type = "debugpy",
					request = "launch",
					name = "Launch Python file",
					program = "${file}",
					cwd = "${workspaceFolder}",
					pythonPath = function()
						local venv = vim.env.VIRTUAL_ENV
						if venv and vim.fn.executable(venv .. "/bin/python") == 1 then
							return venv .. "/bin/python"
						end
						local local_python = vim.fn.getcwd() .. "/.venv/bin/python"
						if vim.fn.executable(local_python) == 1 then
							return local_python
						end
						return "python3"
					end,
				},
			}

			dap.configurations.rust = {
				{
					type = "codelldb",
					request = "launch",
					name = "Launch Rust executable",
					program = function()
						local path = vim.fn.input({
							prompt = "Path to executable: ",
							default = vim.fn.getcwd() .. "/target/debug/",
							completion = "file",
						})
						return path ~= "" and path or dap.ABORT
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
				},
			}
		end,
	},
}
