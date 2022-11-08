local function init(nl)
	local formatting = nl.builtins.formatting

	local sources = {
		-- Formatting ---------------------
		--  brew install shfmt
		formatting.eslint,
		formatting.shfmt,
		-- StyLua
		formatting.stylua,
		formatting.autopep8,
		formatting.rustfmt,
		-- frontend
		formatting.prettier.with({
			filetypes = {
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"vue",
				"css",
				"scss",
				"less",
				"html",
				"json",
				"yaml",
				"graphql",
				"markdown",
			},
		}),
	}

	local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

	nl.setup({
		sources = sources,
		on_attach = function(client, bufnr)
			if client.supports_method("textDocument/formatting") then
				vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = bufnr,
					callback = function()
						-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
						vim.lsp.buf.format()
					end,
				})
			end
		end,
	})
end

require("config_utils").init_plugin("null-ls", init)
