vim.opt.termguicolors = true
local notify = require("notify")
if not notify then
  return
end

notify.setup()
