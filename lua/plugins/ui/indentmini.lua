local indentmini = require_("indentmini")
if not indentmini then
  return
end

indentmini.setup({
  char = "|",
  exclude = {
    "markdown",
  },
})

-- use comment color
vim.cmd.highlight("default link IndentLine Comment")
