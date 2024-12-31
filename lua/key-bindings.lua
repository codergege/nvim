vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 基础快捷键
keymap("i", "jk", "<ESC>")
keymap("v", "jk", "<ESC>")
keymap("t", "jk", "<C-\\><C-n>")
keymap("c", "jk", "<ESC>")

-- -- windows 分屏快捷键
-- 取消 s 默认功能
-- map("n", "s", "")
keymap("n", "<leader>sv", ":vsp<CR>")
keymap("n", "<leader>sh", ":sp<CR>")
-- 关闭当前
keymap("n", "<leader>sc", "<C-w>c")
-- 关闭其他
keymap("n", "<leader>so", "<C-w>o")
-- Alt + hjkl  窗口之间跳转
keymap("n", "<A-h>", "<C-w>h")
keymap("n", "<A-j>", "<C-w>j")
keymap("n", "<A-k>", "<C-w>k")
keymap("n", "<A-l>", "<C-w>l")

-- -- Terminal 相关
keymap("t", "<A-h>", [[ <C-\><C-N><C-w>h ]])
keymap("t", "<A-j>", [[ <C-\><C-N><C-w>j ]])
keymap("t", "<A-k>", [[ <C-\><C-N><C-w>k ]])
keymap("t", "<A-l>", [[ <C-\><C-N><C-w>l ]])

-- -- Visual 模式
-- visual模式下缩进代码
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")
-- 上下移动选中文本
keymap("v", "J", ":move '>+1<CR>gv-gv")
keymap("v", "K", ":move '<-2<CR>gv-gv")
-- " 将 Alt-v 映射为进入可视块模式
keymap("n", "<A-v>", "<C-v>")
keymap("v", "<A-v>", "<C-v>")

-- 上下滚动浏览
keymap("n", "<C-j>", "4j")
keymap("n", "<C-k>", "4k")
-- ctrl u / ctrl + d  只移动9行，默认移动半屏
keymap("n", "<C-u>", "9k")
keymap("n", "<C-d>", "9j")

-- rust book
keymap("n", "<leader>mb", ":!mdbook build<CR>")
keymap("n", "<leader>mo", ":!mdbook build -o<CR>")
keymap("n", "<leader>ms", ":!mdbook serve<CR>")

-- 大写
keymap("i", "<c-u>", "<esc>gUiwea")

-- Dotfiles generate
-- 生成 clangd 的 compile_commands.json 文件
keymap("n", "<leader>lx", "<cmd>!xmake project -k compile_commands --lsp=clangd<CR>")
-- 生成 marksman 的 .marksman.toml 文件
keymap("n", "<leader>lm", "<cmd>lua create_marksman_file()<CR>")

local pluginKeys = {}

-- bufferline
pluginKeys.mapBufferline = function()
  keymap("n", "<C-h>", ":BufferLineCyclePrev<CR>")
  keymap("n", "<C-l>", ":BufferLineCycleNext<CR>")
  -- keymap("n", "<leader>bc", ":bdelete!<CR>")
  -- by bbye
  keymap("n", "<leader>qq", ":Bdelete!<CR>")
  keymap("n", "<leader>qh", ":BufferLineCloseLeft<CR>")
  keymap("n", "<leader>ql", ":BufferLineCloseRight<CR>")
  keymap("n", "<leader>qo", ":BufferLineCloseRight<CR>:BufferLineCloseLeft<CR>")
  keymap("n", "<leader>qp", ":BufferLinePickClose<CR>")
end

-- nvim-tree
pluginKeys.mapNvimTree = function(api, opts)
  vim.keymap.set("n", "u", api.tree.change_root_to_node, opts("Change root to current"))
  vim.keymap.set("n", "U", api.tree.change_root_to_parent, opts("Up"))
  vim.keymap.set("n", "t", api.node.open.tab, opts("OpenInNewTab"))
end
pluginKeys.mapNvimTreeToggle = function()
  keymap("n", "<C-n>", ":NvimTreeToggle<CR>")
end

-- lsp
pluginKeys.mapLsp = function(opt)
  ------ Diagnostic
  -- Show diagnostics in a floating window.
  -- keymap("n", "gf", vim.diagnostic.open_float, opt)
  -- lspsaga finder
  keymap("n", "gf", "<cmd>Lspsaga finder<CR>", opt)
  -- Move to the next diagnostic.
  -- keymap("n", "gn", vim.diagnostic.goto_next, opt)
  keymap("n", "gn", "<cmd>Lspsaga diagnostic_jump_next<CR>", opt)
  -- Move to the previous diagnostic.
  -- keymap("n", "gp", vim.diagnostic.goto_prev, opt)
  keymap("n", "gp", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opt)
  ------ LSP
  -- Go to definition
  -- keymap("n", "gd", vim.lsp.buf.definition, opt)
  keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>", opt)
  -- Go to type_definition
  -- keymap("n", "gt", vim.lsp.buf.type_definition, opt)
  keymap("n", "gt", "<cmd>Lspsaga goto_type_definition<CR>", opt)
  -- lspsaga peek_*
  keymap("n", "gk", "<cmd>Lspsaga peek_definition<CR>", opt)
  keymap("n", "gK", "<cmd>Lspsaga peek_type_definition<CR>", opt)
  -- Show references
  keymap("n", "gr", vim.lsp.buf.references, opt)
  -- Go to declaration
  keymap("n", "gD", vim.lsp.buf.declaration, opt)
  -- Go to implementation(很多都没实现的)
  keymap("n", "gi", vim.lsp.buf.implementation, opt)
  -- lspsaga hover
  keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", opt)
  -- lspsaga outline
  keymap("n", "go", "<cmd>Lspsaga outline<CR>", opt)
  ------ LSP Code action
  -- Rename
  -- keymap("n", "<leader>rn", vim.lsp.buf.rename, opt)
  keymap("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opt)
  -- keymap("n", "<leader>ca", vim.lsp.buf.code_action, opt)
  keymap("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opt)
  -- format
  keymap("n", "<leader>fm", "<cmd>lua vim.lsp.buf.format({ async = false })<CR>", opt)
end

-- telescope
pluginKeys.mapTelescope = function(builtin)
  keymap("n", "<leader>ff", builtin.find_files)
  keymap("n", "<leader>fg", builtin.live_grep)
  keymap("n", "<leader>fb", builtin.buffers)
  keymap("n", "<leader>fh", builtin.help_tags)
end

-- lspsaga
pluginKeys.mapLspsaga = function()
  keymap({ "n", "t" }, "<A-f>", "<cmd>Lspsaga term_toggle<CR>")
end

-- todo-comments
pluginKeys.mapTodoComments = function(tc)
  keymap("n", "[t", function()
    tc.jump_next()
  end, { desc = "Previous todo comment" })
  keymap("n", "]t", function()
    tc.jump_prev()
  end, { desc = "Next todo comment" })
  keymap("n", "<leader>ft", "<cmd>TodoTelescope<CR>")
end

-- trouble
pluginKeys.mapTrouble = function()
  keymap("n", "<leader>ll", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
  keymap(
    "n",
    "<leader>lL",
    "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
    { desc = "Buffer Diagnostics (Trouble)" }
  )
  keymap("n", "<leader>lt", "<cmd>Trouble todo toggle<cr>", { desc = "Todo (Trouble)" })
end

-- snippets scissors
pluginKeys.mapScissors = function(scissors)
  keymap("n", "<leader>se", function()
    scissors.editSnippet()
  end, { desc = "Snippet: Edit" })
  -- when used in visual mode, prefills the selection as snippet body
  keymap({ "n", "x" }, "<leader>sa", function()
    scissors.addNewSnippet()
  end, { desc = "Snippet: Add" })
end

return pluginKeys
