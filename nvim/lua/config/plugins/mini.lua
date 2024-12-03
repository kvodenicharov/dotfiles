return {
	"echasnovski/mini.nvim",
	version = false,
	config = function()
		require("mini.ai").setup()

		local files = require("mini.files")

		files.setup({
			windows = {
				preview = true,
				width_preview = 100,
			},
			mappings = {
				close = "q",
				go_in = "l",
				go_in_plus = "L",
				go_out = "h",
				go_out_plus = "H",
				mark_goto = "'",
				mark_set = "m",
				reset = "<BS>",
				reveal_cwd = "2",
				show_help = "g?",
				synchronize = "=",
				trim_left = "<",
				trim_right = ">",
			},
		})

		vim.keymap.set("n", "<leader>fe", "<cmd>lua MiniFiles.open()<CR>", { desc = "File Explorer" })

		local function open_file_in_split(vertical)
			return function()
				local entry = files.get_fs_entry()
				local is_file = entry and entry.fs_type == "file"
				if is_file then
					vim.api.nvim_win_call(files.get_explorer_state().target_window, function()
						vim.cmd.split({ mods = { split = "belowright", vertical = vertical } })
						files.set_target_window(vim.api.nvim_get_current_win())
					end)
				end

				files.go_in()
				files.close()
			end
		end

		vim.api.nvim_set_keymap("n", "<leader>fr", "", {
			desc = "File Explorer",
			callback = function()
				if not files.close() then
					files.open(vim.api.nvim_buf_get_name(0))
					files.reveal_cwd()
				end
			end,
		})

		vim.api.nvim_create_autocmd("User", {
			pattern = "MiniFilesBufferCreate",
			callback = function(args)
				local buf_id = args.data.buf_id

				vim.api.nvim_buf_set_keymap(buf_id, "n", "<C-v>", "", {
					callback = open_file_in_split(true),
					desc = "File Explorer - Open in Vertical Split",
				})

				vim.api.nvim_buf_set_keymap(buf_id, "n", "<C-x>", "", {
					callback = open_file_in_split(false),
					desc = "File Explorer - Open in Horizontal Split",
				})
			end,
		})

		require("mini.icons").setup()

		local notify = require("mini.notify")

		notify.setup()
		vim.notify = notify.make_notify({
			ERROR = { duration = 15000 },
			WARN = { duration = 10000 },
			INFO = { duration = 5000 },
		})
	end,
}
