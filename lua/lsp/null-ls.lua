local status, null_ls = pcall(require, "null-ls")
-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#formatting
if not status then
  vim.notify("null-ls is not found")
  return
end

local formatting = null_ls.builtins.formatting

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
      },
      prefer_local = "node_modules/.bin",
    })
    -- formatting.fixjson,
    -- formatting.black.with({ extra_args = { "--fast" } }),
 }

 null_ls.setup({
    sources = sources
 })
