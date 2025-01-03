local aerial = require_("aerial")
if not aerial then
  return
end

aerial.setup()

require("key-bindings").mapAerial()
