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
map("n", "<A-Left>", ":vertical resize +2<CR>", opt)
map("n", "<A-Right>", ":vertical resize -2<CR>", opt)
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
map("n", "<C-h>", "<Cmd>BufferPrevious<CR>", opt)
map("n", "<C-l>", "<Cmd>BufferNext<CR>", opt)

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

-- Tagbar
map("n", "<F10>", ":TagbarToggle<CR>", opt)
-- LSP

local pluginKeys = {}

-- nvim-tree
-- open nvim tree
map("n", "<F3>", ":NvimTreeToggle<CR>", opt)
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

pluginKeys.mapVimspector = function()
  -- ??????
  map("n", "<leader>dd", ":call vimspector#Launch()<CR>", opt)
  -- ??????
  map("n", "<Leader>de", ":call vimspector#Reset()<CR>", opt)
  -- ??????
  map("n", "<Leader>dc", ":call vimspector#Continue()<CR>", opt)
  -- ????????????
  map("n", "<Leader>dt", ":call vimspector#ToggleBreakpoint()<CR>", opt)
  map("n", "<Leader>dT", ":call vimspector#ClearBreakpoints()<CR>", opt)
  --  stepOver, stepOut, stepInto
  map("n", "<leader>dj", "<Plug>VimspectorStepOver", opt)
  map("n", "<leader>dk", "<Plug>VimspectorStepOut", opt)
  map("n", "<leader>dl", "<Plug>VimspectorStepInto", opt)
end

return pluginKeys
