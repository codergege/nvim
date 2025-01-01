local toggleterm = require_("toggleterm")
if not toggleterm then
  return
end

toggleterm.setup({
  direction = "float",
})

require("key-bindings").mapToggleTerm()
