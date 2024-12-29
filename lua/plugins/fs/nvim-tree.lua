local nvim_tree = require_("nvim-tree")
if not nvim_tree then
  return
end

local function my_on_attach(bufnr)
  local api = require("nvim-tree.api")
  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end
  -- default mappings
  -- :help nvim-tree-mappings-default
  api.config.mappings.default_on_attach(bufnr)
  -- custom mappings
  require("key-bindings").mapNvimTree(api, opts)
end

nvim_tree.setup({
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  update_focused_file = {
    enable = true,
    -- update_root = true,
  },
  on_attach = my_on_attach,
})
require("key-bindings").mapNvimTreeToggle()
