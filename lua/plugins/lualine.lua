require("config_utils").init_plugin("lualine", function(lualine)
	lualine.setup({
		options = {
			theme = "tokyonight",
			component_separators = { left = "|", right = "|" },
			-- https://github.com/ryanoasis/powerline-extra-symbols
			section_separators = { left = " ", right = "" },
		},
		extensions = { "nvim-tree", "toggleterm" },
		sections = {
			lualine_c = {
				"filename",
				{
					"lsp_progress",
					spinner_symbols = { " ", " ", " ", " ", " ", " " },
				},
			},
			lualine_x = {
				"filesize",
				{
					"fileformat",
					symbols = {
						unix = "", -- e712
						dos = "", -- e70f
						mac = "", -- e711
					},
				},
				"encoding",
				"filetype",
			},
		},
	})
end)
