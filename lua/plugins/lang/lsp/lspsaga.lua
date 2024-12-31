local lspsaga = require_("lspsaga")
if not lspsaga then
  return
end

lspsaga.setup({
  code_action = {
    keys = {
      quit = "q",
      exec = "<CR>",
    },
    extend_gitsigns = true,
  },
})

-- Remove Redundant Virtual Text
-- Fix: Not working
vim.diagnostic.config({
  virtual_text = true,
})

-- keymap
require("key-bindings").mapLspsaga()
