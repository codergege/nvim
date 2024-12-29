local ls = require_("luasnip")
local types = require_("luasnip.util.types")
if not ls or not types then
  return
end

-- 参考 luasnip 官网的 example: Examples/snippets.lua
ls.config.set_config({
  history = true,
  -- Update more often, :h events for more info.
  updateevents = "TextChanged,TextChangedI",
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { "choiceNode", "Comment" } },
      },
    },
  },
  -- treesitter-hl has 100, use something higher (default is 200).
  ext_base_prio = 300,
  -- minimal increase in priority.
  ext_prio_increase = 1,
  enable_autosnippets = true,
})

-- https://github.com/rafamadriz/friendly-snippets/
require("luasnip.loaders.from_vscode").lazy_load()
-- custom
require("luasnip.loaders.from_vscode").load({ paths = { "./my-snippets" } })
