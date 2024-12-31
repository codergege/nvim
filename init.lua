require("utils")
require("basic")
require("key-bindings")

-- 插件管理
local plugins = require("lazy-config")

if not plugins.available() then
  plugins.install()
end
plugins.setup()

require("plugins.ui")
require("plugins.fs")
require("plugins.lang")
require("plugins.editing")
-- require("plugins.git")
require("plugins.ai")
require("plugins.mini")
