return {
	"mfussenegger/nvim-lint",
	config = function(_, opts)
		local linter = require("lint")
		linter.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			svelte = { "eslint_d" },
			python = { "pylint" },
			php = { "phpstan", "phpcs" },
			bash = { "shellcheck" },
		}

		vim.keymap.set("n", "<leader>l", function()
			linter.try_lint()
		end, { desc = "Lint Trigger" })
	end,
}