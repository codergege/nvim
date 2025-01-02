local autocmd_group = vim.api.nvim_create_augroup("Custom auto-commands", { clear = true })

-- 保存 xmake.lua 文件时自动生成 compile_commands.json 文件.
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.lua",
  callback = function()
    local filename = vim.fn.expand("%:t")
    if filename == "xmake.lua" then
      vim.fn.system("xmake project -k compile_commands --lsp=clangd")
    end
  end,
  group = autocmd_group,
})
