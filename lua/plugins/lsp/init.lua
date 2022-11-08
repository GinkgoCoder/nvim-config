-- :h mason-default-settings
require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

-- mason-lspconfig uses the `lspconfig` server names in the APIs it exposes - not `mason.nvim` package names
-- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
require("mason-lspconfig").setup({
	ensure_installed = {
		"sumneko_lua",
		"bashls",
		"dockerls",
		"emmet_ls",
		"html",
		"jsonls",
		"pyright",
		"rust_analyzer",
	},
})

require("plugins.lsp.config.pyright")
require("plugins.lsp.config.lua")
require("plugins.lsp.config.rust")

require("plugins.lsp.null_ls")
require("plugins.lsp.ui")
require("plugins.lsp.cmp")
