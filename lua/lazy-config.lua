local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

local mod = {}

function mod.available()
  return vim.loop.fs_stat(lazypath)
end

function mod.install()
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

function mod.setup()
  vim.opt.rtp:prepend(lazypath)
  local lazy = require_("lazy")
  if not lazy then return end
  local plugins = require("plugins")
  lazy.setup(plugins)
end

return mod
