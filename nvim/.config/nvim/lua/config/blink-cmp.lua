local completion = require("blink.cmp.completion")
-- Displays a preview of the selected item on the current line
completion.ghost_text = {
  enabled = false,
  -- Show the ghost text when an item has been selected
  show_with_selection = false,
  -- Show the ghost text when no item has been selected, defaulting to the first item
  show_without_selection = false,
  -- Show the ghost text when the menu is open
  show_with_menu = false,
  -- Show the ghost text when the menu is closed
  show_without_menu = false,
}
