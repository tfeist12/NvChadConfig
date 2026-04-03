require "nvchad.options"

-- Show relative line numbers
vim.o.relativenumber = true

-- Fix single character deletion hanging issue
local copy_timer = nil
local copy_text = nil

local function debounced_copy(lines)
  copy_text = table.concat(lines, "\n")
  if copy_timer then
    copy_timer:stop()
    copy_timer:close()
    copy_timer = nil
  end
  local timer = vim.uv.new_timer()
  if not timer then
    return
  end
  copy_timer = timer
  timer:start(
    150,
    0,
    vim.schedule_wrap(function()
      vim.fn.system({ "tmux", "load-buffer", "-w", "-" }, copy_text)
      if timer then
        timer:close()
      end
      if copy_timer == timer then
        copy_timer = nil
      end
    end)
  )
end

vim.g.clipboard = {
  name = "tmux-debounced",
  copy = {
    ["+"] = debounced_copy,
    ["*"] = debounced_copy,
  },
  paste = {
    ["+"] = { "tmux", "save-buffer", "-" },
    ["*"] = { "tmux", "save-buffer", "-" },
  },
}
