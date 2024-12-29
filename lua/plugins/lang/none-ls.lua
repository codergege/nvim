local null_ls = require_("null-ls")
if not null_ls then
  return
end

--[[
https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md
https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
]]
local code_actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
  debug = false,
  sources = {
    ---- code actions ---------------------------------------------------------
    code_actions.refactoring,
    ---- diagnostics ----------------------------------------------------------
    diagnostics.markdownlint,
    diagnostics.prettier,
    -- diagnostics.mdl,
  },

  -- #{m}: message
  -- #{s}: source name (defaults to null-ls if not specified)
  -- #{c}: code (if available)
  diagnostics_format = "[#{s}] #{m}",
})
