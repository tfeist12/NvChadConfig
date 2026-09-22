require "nvchad.options"

-- show relative line numbers
vim.o.relativenumber = true

-- Copy via OSC 52 so each yank is an escape sequence, not a blocking tmux client spawn.
-- set-clipboard on makes tmux capture it into its buffer.
local osc52 = require "vim.ui.clipboard.osc52"
vim.g.clipboard = {
  name = "osc52-tmux",
  copy = {
    ["+"] = osc52.copy("+"),
    ["*"] = osc52.copy("*"),
  },
  paste = {
    ["+"] = { "tmux", "save-buffer", "-" },
    ["*"] = { "tmux", "save-buffer", "-" },
  },
}
