require("config_utils").init_plugin("cmp", function(cmp)
	cmp.setup({
		snippet = {
			expand = function(args)
				-- For `vsnip` users.
				vim.fn["vsnip#anonymous"](args.body)
			end,
		},
		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			-- For vsnip users.
			{ name = "vsnip" },
		}, { { name = "buffer" }, { name = "path" } }),

		mapping = require("keybindings").cmp(cmp),
	})

	cmp.setup.cmdline("/", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = "buffer" },
		},
	})
	--cmp.setup.cmdline(":", {
	--  mapping = cmp.mapping.preset.cmdline(),
	--  sources = cmp.config.sources({
	--    { name = "path" },
	--  }, {
	--    { name = "cmdline" },
	--  }),
	--})
end)
