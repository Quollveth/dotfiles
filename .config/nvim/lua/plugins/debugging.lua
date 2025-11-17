return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"rcarriga/nvim-dap-ui",
		"theHamsta/nvim-dap-virtual-text",
		-- specific language extensions
		"leoluz/nvim-dap-go",
		"mfussenegger/nvim-dap-python",
	},
	config = function()
		local dap, dapui = require("dap"), require("dapui")
		local map = vim.keymap.set

		dapui.setup()
		require("nvim-dap-virtual-text").setup({
			commented = true,
			virt_text_win_col = 80,
			show_stop_reason = true,
			highlight_changed_variables = true,
		})

		-- setup debuggers
		require("dap-go").setup()
		require("dap-python").setup("python3")

		-- c/c++
		dap.adapters.cppdbg = {
			id = "cppdbg",
			type = "executable",
			command = "~/.local/share/nvim/mason/bin/OpenDebugAD7",
		}
		dap.configurations.cpp = {
			{
				name = "Launch file",
				type = "cppdbg",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopAtEntry = true,
			},
			{
				name = "Attach to gdbserver :1234",
				type = "cppdbg",
				request = "launch",
				MIMode = "gdb",
				miDebuggerServerAddress = "localhost:1234",
				miDebuggerPath = "/usr/bin/gdb",
				cwd = "${workspaceFolder}",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
			},
		}

		-- js deno
		dap.adapters["pwa-node"] = {
			type = "server",
			host = "localhost",
			port = "${port}",
			executable = {
				command = "deno",
				args = { "~/.local/share/debug/js-debug/src/dapDebugServer.js", "${port}" },
			},
		}
		dap.configurations.typescript = {
			{
				type = "pwa-node",
				request = "launch",
				name = "Launch file",
				runtimeExecutable = "deno",
				runtimeArgs = {
					"run",
					"--inspect-wait",
					"--allow-all",
				},
				program = "${file}",
				cwd = "${workspaceFolder}",
				attachSimplePort = 9229,
			},
		}

		-- finish config

		map("n", "<Leader>b", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })

		map("n", "<F9>", dap.step_over, {})
		map("n", "<F10>", dap.step_into, {})
		map("n", "<F11>", dap.step_out, {})
		map("n", "<F12>", dap.continue, {})

		-- Auto open and close dapui
		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end
	end,
}
