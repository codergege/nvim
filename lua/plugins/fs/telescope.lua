local telescope = require_("telescope")
if not telescope then
  return
end

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["<C-h>"] = "which_key",
        ["<C-k>"] = require("telescope.actions").close,
      },
    },
  },
  pickers = {},
  extensions = {},
})

local builtin = require_("telescope.builtin")
if not builtin then
  return
end
require("key-bindings").mapTelescope(builtin)
