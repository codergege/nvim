local fittencode = require_("fittencode")
if not fittencode then
  return
end

fittencode.setup({
  chat = {
    -- Highlight the conversation in the chat window at the current cursor position.
    highlight_conversation_at_cursor = false,
    -- Style
    -- Available options:
    -- * `sidebar` (Siderbar style, also default)
    -- * `floating` (Floating style)
    style = "floating",
    sidebar = {
      -- Width of the sidebar in characters.
      width = 42,
      -- Position of the sidebar.
      -- Available options:
      -- * `left`
      -- * `right`
      position = "left",
    },
    floating = {
      -- Border style of the floating window.
      -- Same border values as `nvim_open_win`.
      border = "rounded",
      -- Size of the floating window.
      -- <= 1: percentage of the screen size
      -- >  1: number of lines/columns
      size = { width = 0.8, height = 0.8 },
    },
  },
  keymaps = {
    inline = {
      ["<TAB>"] = "accept_all_suggestions",
      ["<C-l>"] = "accept_line",
      ["<C-k>"] = "accept_word",
      ["<C-Up>"] = "revoke_line",
      ["<C-Left>"] = "revoke_word",
      ["<A-\\>"] = "triggering_completion",
    },
    chat = {
      ["q"] = "close",
      ["[c"] = "goto_previous_conversation",
      ["]c"] = "goto_next_conversation",
      ["c"] = "copy_conversation",
      ["C"] = "copy_all_conversations",
      ["d"] = "delete_conversation",
      ["D"] = "delete_all_conversations",
    },
  },
  completion_mode = "inline",
})

-- Neovim default updatetime is 4000
vim.opt.updatetime = 200

-- Key-bindings
require("key-bindings").mapFittencode()
