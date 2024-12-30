local cmp = require_("cmp")
local ls = require_("luasnip")
if not cmp or not ls then
  return
end

local mapping = {
  ["<A-/>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
  ["<A-.>"] = cmp.mapping({
    i = cmp.mapping.abort(),
    c = cmp.mapping.close(),
  }),
  -- Accept currently selected item. If none selected, `select` first item.
  -- Set `select` to `false` to only confirm explicitly selected items.
  ["<TAB>"] = cmp.mapping(function(fallback)
    if cmp.visible() then
      if ls.expandable() then
        ls.expand()
      else
        cmp.confirm({
          select = true,
        })
      end
    else
      fallback()
    end
  end),
  ["<C-n>"] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_next_item()
    else
      fallback()
    end
  end, { "i", "s" }),
  ["<C-p>"] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_prev_item()
    else
      fallback()
    end
  end, { "i", "s" }),
  ["<C-l>"] = cmp.mapping(function(fallback)
    if ls.locally_jumpable(1) then
      ls.jump(1)
    else
      fallback()
    end
  end, { "i", "s" }),
  ["<C-h>"] = cmp.mapping(function(fallback)
    if ls.locally_jumpable(-1) then
      ls.jump(-1)
    else
      fallback()
    end
  end, { "i", "s" }),
}

cmp.setup({
  -- 指定 snippet 引擎
  snippet = {
    expand = function(args)
      ls.lsp_expand(args.body)
    end,
  },
  -- 补全源
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
    -- { name = "fittencode" },
  }, {
    { name = "buffer" },
    { name = "path" },
  }),

  -- 快捷键设置
  mapping = mapping,
  -- 使用lspkind-nvim显示类型图标 (新增)
  formatting = require("plugins.lang.ui").formatting,
})

-- / 查找模式使用 buffer 源
cmp.setup.cmdline("/", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})

-- : 命令行模式中使用 path 和 cmdline 源.
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    { name = "cmdline" },
  }),
})

require("plugins.lang.cmp.luasnip")
require("plugins.lang.cmp.scissors")
