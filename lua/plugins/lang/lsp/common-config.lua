local mod = {}

function mod.KeyAttach(bufnr)
  local opt = { buffer = bufnr }
  require("key-bindings").mapLsp(opt)
end

-- 禁用格式化功能，交给专门插件插件处理
function mod.DisableFormat(client)
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false
end

local cmp_nvim_lsp = require_("cmp_nvim_lsp")
if cmp_nvim_lsp then
  mod.capabilities = require("cmp_nvim_lsp").default_capabilities()
  -- 解决 clangd 这个问题: warning: multiple different client offset_encodings detected for buffer, this is not supported yet
  mod.capabilities.offsetEncoding = { "utf-16" }
end
mod.flags = {
  debounce_text_changes = 150,
}

return mod
