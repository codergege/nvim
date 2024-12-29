local tokyonight = require_("tokyonight")
if not tokyonight then
  return
end

tokyonight.setup({
  -- The theme comes in three styles,
  -- `storm`, `moon`, a darker variant `night` and `day`
  style = "storm",
  -- Enable this to disable setting the background color
  transparent = false,
})
