```lua
-- 生成 clangd 的 compile_commands.json 文件
keymap("n", "<leader>lc", "<cmd>!xmake project -k compile_commands --lsp=clangd<CR>")
-- 生成 marksman 的 .marksman.toml 文件
keymap("n", "<leader>lm", "<cmd>lua create_marksman_file()<CR>")
```
