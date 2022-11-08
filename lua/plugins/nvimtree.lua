local init_plugin = require("config_utils").init_plugin

local function init(nvimtree)
	nvimtree.setup({
		git = {
			enable = false,
		},
		-- config for project plugin
		update_cwd = true,
		update_focused_file = {
			enable = true,
			update_cwd = true,
		},
		filters = {
			dotfiles = false,
			custom = { "node_modules" },
		},
		view = {
			width = 35,
			side = "left",
			hide_root_folder = false,
			mappings = {
				custom_only = false,
				list = require("keybindings").nvimTreeList,
			},
			number = false,
			relativenumber = false,
			signcolumn = "yes",
		},
		actions = {
			open_file = {
				resize_window = true,
				quit_on_open = false,
			},
		},
		-- wsl install -g wsl-open
		-- https://github.com/4U6U57/wsl-open/
		system_open = {
			cmd = "wsl-open",
		},
	})
end

init_plugin("nvim-tree", init)

--vim.cmd([[
--  autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
--]])