return {
  "gbprod/substitute.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local sub = require "substitute"

    sub.setup()

    local keymap = vim.keymap

    keymap.set("n", "s", sub.operator, { desc = "Substitute with motion" })
    keymap.set("n", "ss", sub.line, { desc = "Substitute line" })
    keymap.set("n", "S", sub.eol, { desc = "Substitute to end of line" })
    keymap.set("x", "s", sub.visual, { desc = "Substitute in visual mode" })
  end,

}
