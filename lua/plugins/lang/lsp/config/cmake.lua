local common = require("plugins.lang.lsp.common-config")

local opts = {
  capabilities = common.capabilities,
  flags = common.flags,
  on_attach = function(client, bufnr)
    common.DisableFormat(client)
    common.KeyAttach(bufnr)
  end,
  settings = {},
}

return {
  on_setup = function(server)
    server.setup(opts)
  end,
}
