local function map_with_default_opt(mode, lhs, rhs)
	local map = vim.api.nvim_set_keymap
	local opt = { noremap = true, silent = true }
	return map(mode, lhs, rhs, opt)
end

local function init_plugin(name, init)
	local status, plugin = pcall(require, name)
	if not status then
		vim.notify("Plugin " .. name .. " not found")
	else
		if init then
			init(plugin)
		end
	end
end

return {
	map_with_default_opt = map_with_default_opt,
	init_plugin = init_plugin,
}
