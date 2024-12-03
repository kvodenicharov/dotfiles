return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	opts = {
		formatters_by_ft = {
			javascript = { "prettier" },
			typescript = { "prettier" },
			javascriptreact = { "prettier" },
			typescriptreact = { "prettier" },
			svelte = { "prettier" },
			css = { "prettier" },
			html = { "prettier" },
			json = { "prettier" },
			yaml = { "prettier" },
			markdown = { "prettier" },
			graphql = { "prettier" },
			lua = { "stylua" },
			python = { "isort", "black" },
			bash = { "beautysh" },
			sql = { "sql-formatter" },
			php = { "phpcbf" },
			["_"] = { "trim_whitespace" },
		},
		format_on_save = {
			lsp_fallback = true,
			async = false,
			timeout_ms = 1000,
		}
	},
	config = function(_, opts)
		local c = require("conform")
		c.setup(opts)

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			c.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end)
	end,
}