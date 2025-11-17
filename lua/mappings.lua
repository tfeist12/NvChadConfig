require "nvchad.mappings"

local map = vim.keymap.set

-- Convenience
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>", { desc = "exit insert mode" })

-- Completion menu (nvim-cmp) - These are context-specific and defined in configs/cmp.lua
-- Adding here for cheatsheet documentation only
map("i", "<Tab>", "<Tab>", { desc = "CMP next completion item" })
map("i", "<S-Tab>", "<S-Tab>", { desc = "CMP previous completion item" })
map("i", "<CR>", "<CR>", { desc = "CMP confirm selection" })
map("i", "<C-e>", "<C-e>", { desc = "CMP close completion menu" })

-- Stay in visual mode when indenting
map("v", "<", "<gv", { desc = "indent left and stay in visual mode" })
map("v", ">", ">gv", { desc = "indent right and stay in visual mode" })

-- Vertical movement with auto-centering
map("n", "<C-u>", "<C-u>zz", { desc = "move up half page and center" })
map("n", "<C-d>", "<C-d>zz", { desc = "move down half page and center" })
map("n", "n", "nzzzv", { desc = "search next result and center" })
map("n", "N", "Nzzzv", { desc = "search previous search result and center" })

-- Window resizing with Shift+Arrows (using smart-splits)
map("n", "<S-Left>", "<cmd>SmartResizeLeft<CR>", { desc = "smartresize resize window left" })
map("n", "<S-Right>", "<cmd>SmartResizeRight<CR>", { desc = "smartresize resize window right" })
map("n", "<S-Up>", "<cmd>SmartResizeUp<CR>", { desc = "smartresize resize window up" })
map("n", "<S-Down>", "<cmd>SmartResizeDown<CR>", { desc = "smartresize resize window down" })

-- Smart-splits navigation (overrides default window navigation)
map("n", "<C-h>", "<cmd>SmartCursorMoveLeft<CR>", { desc = "smartcursor move to left window" })
map("n", "<C-l>", "<cmd>SmartCursorMoveRight<CR>", { desc = "smartcursor move to right window" })
map("n", "<C-k>", "<cmd>SmartCursorMoveUp<CR>", { desc = "smartcursor move to upper window" })
map("n", "<C-j>", "<cmd>SmartCursorMoveDown<CR>", { desc = "smartcursor move to lower window" })

-- Trouble diagnostics
map("n", "<leader>t", "<cmd>Trouble diagnostics toggle<cr>", { desc = "trouble diagnostics" })
map("n", "<leader>ts", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "trouble symbols" })
map("n", "<leader>tl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", { desc = "trouble lsp" })

-- CopilotChat
map("n", "<leader>cc", "<cmd>CopilotChatToggle<CR>", { desc = "Copilot chat toggle" })

-- Unmap NvChad terminal mappings that conflict with Harpoon
vim.keymap.del("n", "<leader>h")
vim.keymap.del("n", "<leader>v")

-- Harpoon file navigation
map("n", "<leader>h", function()
  local harpoon = require "harpoon"
  local telescope_harpoon = require "configs.telescope-harpoon"
  telescope_harpoon.toggle_telescope(harpoon:list())
end, { desc = "Harpoon quick menu toggle" })
map("n", "<leader>a", function()
  local excluded_filetypes = { "help", "nvdash", "nvcheatsheet", "telescope", "trouble", "NvimTree" }
  local current_filetype = vim.bo.filetype

  for _, ft in ipairs(excluded_filetypes) do
    if current_filetype == ft then
      vim.notify("Harpoon: Cannot add " .. ft .. " files", vim.log.levels.WARN)
      return
    end
  end
  require("harpoon"):list():add()
end, { desc = "Harpoon add file" })
map("n", "<leader>j", function()
  require("harpoon"):list():next { ui_nav_wrap = true }
end, { desc = "Harpoon next file" })
map("n", "<leader>k", function()
  require("harpoon"):list():prev { ui_nav_wrap = true }
end, { desc = "Harpoon previous file" })
map("n", "<leader>d", "<leader>d", { desc = "Harpoon quick menu delete entry" })
