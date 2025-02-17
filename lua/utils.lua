function _G.require_(name)
  local status_ok, plugin = pcall(require, name)
  if not status_ok then
    vim.notify("Can't find " .. name)
    return nil
  end
  return plugin
end

function _G.keymap(mode, lhs, rhs, opts)
  if not lhs or not rhs then
    return
  end
  local keyOpts = vim.tbl_extend("force", { remap = false, silent = true }, (opts or {}))
  if type(lhs) == "table" then
    for _, x in pairs(lhs) do
      vim.keymap.set(mode, x, rhs, keyOpts)
    end
    return
  end
  vim.keymap.set(mode, lhs, rhs, keyOpts)
end

function _G.create_marksman_file()
  local file = io.open(".marksman.toml", "w")
  if file then
    file:close()
  end
end

function _G.is_win()
  return vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1
end
