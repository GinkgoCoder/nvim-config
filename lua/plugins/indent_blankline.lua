local function init(ib)
	vim.opt.list = true
	vim.opt.listchars:append("eol:↴")

	ib.setup({
		show_end_of_line = true,
		show_current_context = true,
	})
end

require("config_utils").init_plugin("indent_blankline", init)
