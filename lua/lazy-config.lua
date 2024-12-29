local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

local mod = {}

function mod.available()
  return vim.loop.fs_stat(lazypath)
end

function mod.install()
  vim.notify("Installing plugin manager lazy.nvim ...")
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
  vim.notify("Plugin manager installed complete")
end

function mod.setup()
  vim.opt.rtp:prepend(lazypath)
  local lazy = require_("lazy")
  if not lazy then return end
  local plugins = require("plugins")
  lazy.setup(plugins)
end

return mod
