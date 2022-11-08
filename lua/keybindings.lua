vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }

map("n", "s", "", opt)

-- screen operation
-- split and close the screen
map("n", "sv", ":vsp<CR>", opt)
map("n", "sh", ":sp<CR>", opt)
map("n", "sc", "<C-w>c", opt)
map("n", "so", "<C-w>o", opt)
-- goto
map("n", "<C-Left>", "<C-w>h", opt)
map("n", "<C-Right>", "<C-w>l", opt)
map("n", "<C-Up>", "<C-w>k", opt)
map("n", "<C-Down>", "<C-w>j", opt)
-- resize the screen
map("n", "<A-Left>", ":vertical resize -2<CR>", opt)
map("n", "<A-Right>", ":vertical resize +2<CR>", opt)
map("n", "<A-up>", ":resize +2<CR>", opt)
map("n", "<A-down>", ":resize -2<CR>", opt)
map("n", "<A-=>", "<C-w>=", opt)
-- terminal
map("n", "<leader>t", ":ToggleTerm<CR>", opt)
map("n", "<leader>ft", ":ToggleTerm direction=float<CR>", opt)
map("t", "<Esc>", "<C-\\><C-n>", opt)

-- scroll
map("n", "<C-j>", "4j", opt)
map("n", "<C-k>", "4k", opt)

-- move the code in the visual mode
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)
map("v", "<A-down>", ":move '>+1<CR>gv-gv", opt)
map("v", "<A-up>", ":move '<-2<CR>gv-gv", opt)

-- shortcuts for plugins
-- bufferline
-- switch tab
map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)
-- 关闭
--"moll/vim-bbye"
map("n", "<C-w>", ":Bdelete!<CR>", opt)
map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
map("n", "<leader>bc", ":BufferLinePickClose<CR>", opt)

-- telescope
map("n", "<C-p>", ":Telescope find_files<CR>", opt)
map("n", "<C-f>", ":Telescope live_grep<CR>", opt)
-- coc
map(
	"i",
	"<CR>",
	[[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]],
	{ noremap = true, silent = true, expr = true }
)
map("n", "<leader>rn", "<Plug>(coc-rename)", opt)
map("n", "gi", "<Plug>(coc-implementation)", opt)
map("n", "gy", "<Plug>(coc-type_definition)", opt)
map("n", "gd", "<Plug>(coc-definition)", opt)
map("n", "gr", "<Plug>(coc-references)", opt)
map("n", "[g", "<Plug>(coc-diagnostic-prev)", opt)
map("n", "]g", "<Plug>(coc-diagnostic-next)", opt)

-- LSP

local pluginKeys = {}

-- nvim-tree
-- open nvim tree
map("n", "<F10>", ":NvimTreeToggle<CR>", opt)
-- nvim tree shortcuts
pluginKeys.nvimTreeList = {
	-- open file
	{ key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
	-- open file in a split
	{ key = "v", action = "vsplit" },
	{ key = "h", action = "split" },
	-- hide and show file
	{ key = "i", action = "toggle_custom" }, -- same custom (node_modules) in the filters
	{ key = ".", action = "toggle_dotfiles" }, -- Hide (dotfiles)
	-- file operations
	{ key = "<F5>", action = "refresh" },
	{ key = "a", action = "create" },
	{ key = "d", action = "remove" },
	{ key = "r", action = "rename" },
	{ key = "x", action = "cut" },
	{ key = "c", action = "copy" },
	{ key = "p", action = "paste" },
	{ key = "s", action = "system_open" },
}
-- lsp 回调函数快捷键设置
pluginKeys.mapLSP = function(mapbuf)
	mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
	mapbuf("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
	-- coc conflict
	-- rename
	-- mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
	-- code action
	-- mapbuf("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
	-- go xx
	-- mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
	-- mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
	-- mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
	-- mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
	-- diagnostic
	-- mapbuf("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
	-- mapbuf("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
	-- mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.format()<CR>", opt)
	-- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
	-- mapbuf("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
	-- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
	-- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
	-- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
	-- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
end

pluginKeys.mapVimspector = function()
	-- 开始
	map("n", "<leader>dd", ":call vimspector#Launch()<CR>", opt)
	-- 结束
	map("n", "<Leader>de", ":call vimspector#Reset()<CR>", opt)
	-- 继续
	map("n", "<Leader>dc", ":call vimspector#Continue()<CR>", opt)
	-- 设置断点
	map("n", "<Leader>dt", ":call vimspector#ToggleBreakpoint()<CR>", opt)
	map("n", "<Leader>dT", ":call vimspector#ClearBreakpoints()<CR>", opt)
	--  stepOver, stepOut, stepInto
	map("n", "<leader>dj", "<Plug>VimspectorStepOver", opt)
	map("n", "<leader>dk", "<Plug>VimspectorStepOut", opt)
	map("n", "<leader>dl", "<Plug>VimspectorStepInto", opt)
end

return pluginKeys
