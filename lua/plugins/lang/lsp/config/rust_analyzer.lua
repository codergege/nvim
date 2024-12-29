local common = require("plugins.lang.lsp.common-config")

local opts = {
  capabilities = common.capabilities,
  flags = common.flags,
  on_attach = function(client, bufnr)
    common.DisableFormat(client)
    common.KeyAttach(bufnr)
  end,
  settings = {
    ["rust-analyzer"] = {
      diagnostics = {
        enable = true,
      },
      -- 没起作用
      checkOnSave = {
        command = "clippy",
      }
    },
  },
}

return {
  on_setup = function(server)
    server.setup(opts)
  end,
}
