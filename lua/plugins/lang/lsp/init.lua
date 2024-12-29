local mason = require_("mason")
local mason_lspconfig = require_("mason-lspconfig")
local lspconfig = require_("lspconfig")
if not mason or not mason_lspconfig or not lspconfig then
  return
end

mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

-- 名称不是乱取的 https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
-- 写了对应的配置文件后打开注释
local servers = {
  "clangd",
  "lua_ls",
  "marksman",
  "rust_analyzer",
}

mason_lspconfig.setup({
  -- ensure_installed = servers,
  ensure_installed = {},
  automatic_installation = false,
})

for _, server in pairs(servers) do
  -- 注意 require 不支持 .., 所以先 ..
  local server_config = "plugins.lang.lsp.config." .. server
  local config = require_(server_config)
  if config ~= nil and type(config) == "table" then
    -- 自定义初始化配置文件必须实现 on_setup 方法
    config.on_setup(lspconfig[server])
  else
    -- 使用默认参数
    lspconfig[server].setup({})
  end
end

-- :checkhealth lsp
-- lsp 服务名称
-- https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#available-lsp-servers
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

require("plugins.lang.lsp.lspsaga")
