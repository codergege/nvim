local fittencode = require_("fittencode")
if not fittencode then
  return
end

fittencode.setup()

-- Neovim default updatetime is 4000
vim.opt.updatetime = 200

-- Key-bindings
require("key-bindings").mapFittencode()
