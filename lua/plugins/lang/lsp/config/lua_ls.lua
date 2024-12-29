local common = require("plugins.lang.lsp.common-config")

local opts = {
  capabilities = common.capabilities,
  flags = common.flags,
  on_attach = function(client, bufnr)
    common.DisableFormat(client)
    common.KeyAttach(bufnr)
  end,
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      workspace = {
        checkThirdParty = false,
        -- library = {
        --   vim.env.VIMRUNTIME
        -- },
        -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
        library = vim.api.nvim_get_runtime_file("", true),
      },
    },
  },
}

return {
  on_setup = function(server)
    server.setup(opts)
  end,
}
