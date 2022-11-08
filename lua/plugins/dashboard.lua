local init_plugin = require("config_utils").init_plugin

local function init(db)
	db.custom_center = {
		{
			icon = "  ",
			desc = "Projects                            ",
			action = "Telescope projects",
		},
		{
			icon = "  ",
			desc = "Recently files                      ",
			action = "Telescope oldfiles",
		},
		{
			icon = "  ",
			desc = "Edit keybindings                    ",
			action = "edit ~/.config/nvim/lua/keybindings.lua",
		},
		{
			icon = "  ",
			desc = "Edit Projects                       ",
			action = "edit ~/.local/share/nvim/project_nvim/project_history",
		},
		{
			icon = "  ",
			desc = "Find file                           ",
			action = "Telescope find_files",
		},
		{
			icon = "  ",
			desc = "Find text                           ",
			action = "Telescope live_grep",
		},
	}

	db.custom_header = {
		[[                                     ]],
		[[██╗  ██╗██╗       ██╗     ███████╗██╗]],
		[[██║  ██║██║       ██║     ██╔════╝██║]],
		[[███████║██║       ██║     █████╗  ██║]],
		[[██╔══██║██║       ██║     ██╔══╝  ██║]],
		[[██║  ██║██║▄█╗    ███████╗███████╗██║]],
		[[╚═╝  ╚═╝╚═╝╚═╝    ╚══════╝╚══════╝╚═ ]],
		[[                                     ]],
	}

  db.custom_footer = {
    os.date()
  }

  db.hide_statusline = false
end

init_plugin("dashboard", init)
