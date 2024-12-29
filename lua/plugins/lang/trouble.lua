local trouble = require_("trouble")
if not trouble then
  return
end

trouble.setup()

require("key-bindings").mapTrouble()
