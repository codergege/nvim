local configs = require_("nvim-treesitter.configs")
if not configs then
  return
end

configs.setup({
  -- :TSInstallInfo 命令查看支持的语言
  ensure_installed = {
    "asm",
    "c",
    "cpp",
    "rust",
    "lua",
    "markdown",
    "vim",
    "vimdoc",
    "json",
    "python",
  },
  -- sync_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  -- 代码缩进, 使用 =
  indent = { enable = true },
  -- 启用增量选择模块
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<CR>",
      node_incremental = "<CR>",
      node_decremental = "<BS>",
      scope_incremental = "<TAB>",
    },
  },
})

-- 设置 foldmethod 为 "expr"
vim.opt.foldmethod = "expr"
-- 设置 foldexpr 为 nvim-treesitter 提供的表达式
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- 禁用启动时折叠
vim.cmd("set nofoldenable")
