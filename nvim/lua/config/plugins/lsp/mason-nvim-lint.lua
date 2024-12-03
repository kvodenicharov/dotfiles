return {
	"rshkarin/mason-nvim-lint",
	dependencies = {
		"williamboman/mason.nvim",
		"mfussenegger/nvim-lint",
	},
	opts = {
		automatic_installation = true,
		quiet_mode = false,
		ignore_install = { "janet", "ruby", "inko", "clj-kondo" }
	},
}