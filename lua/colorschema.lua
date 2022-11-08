local colorscheme = "tokyonight-day"

require("tokyonight").setup({
  styles = {
    comments = { italic = false },
    keywords = { italic = false },
  }
})

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found")
  return
end
