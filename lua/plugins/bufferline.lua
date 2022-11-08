local init_plugin = require("config_utils").init_plugin
local map_with_default_opt = require("config_utils").map_with_default_opt

local init = function(bufferline)
	vim.opt.termguicolors = true
	-- bufferline configuration
	-- https://github.com/akinsho/bufferline.nvim#configuration
	bufferline.setup({
		options = {
			offsets = {
				{
					filetype = "NvimTree",
					text = "File Explorer",
					highlight = "Directory",
					text_align = "left",
				},
			},
			-- LSP config
			diagnostics = "coc",
			---@diagnostic disable-next-line: unused-local

			diagnostics_indicator = function(count, level, diagnostics_dict, context)
				local s = " "
				for e, n in pairs(diagnostics_dict) do
					local sym = e == "error" and " " or (e == "warning" and " " or "")
					s = s .. n .. sym
				end
				return s
			end,
		},
	})

	-- keymapping
	map_with_default_opt("n", "<C-l>", ":BufferLineCycleNext<CR>")
	map_with_default_opt("n", "<C-w>", ":Bdelete!<CR>")
	map_with_default_opt("n", "<leader>bl", ":BufferLineCloseRight<CR>")
	map_with_default_opt("n", "<leader>bh", ":BufferLineCloseLeft<CR>")
	map_with_default_opt("n", "<leader>bc", ":BufferLinePickClose<CR>")
end

init_plugin("bufferline", init)
