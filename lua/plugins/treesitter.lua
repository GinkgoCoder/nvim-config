require("config_utils").init_plugin("nvim-treesitter.configs", function(treesitter)
	treesitter.setup({
		ensure_installed = {
			"json",
			"html",
			"css",
			"vim",
			"lua",
			"javascript",
			"typescript",
			"tsx",
			"python",
			"rust",
			"markdown",
		},
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<CR>",
				node_incremental = "<CR>",
				node_decremental = "<BS>",
				scope_incremental = "<TAB>",
			},
		},
	})

	vim.opt.foldmethod = "expr"
	vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
	-- default not fold anything
	vim.opt.foldlevel = 99
end)
