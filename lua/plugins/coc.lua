vim.g.coc_global_extensions = {
	"coc-prettier",
	"coc-snippets",
	"coc-pyright",
	"coc-sumneko-lua",
	"coc-rust-analyzer",
}

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	update_in_insert = true,
})
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
