require("plugins.ui.tokyonight")

vim.o.background = "dark"
local colorscheme = "tokyonight"
---@diagnostic disable-next-line: param-type-mismatch
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " 没有找到！")
  return
end

require("plugins.ui.bufferline")
require("plugins.ui.lualine")
require("plugins.ui.indentmini")
