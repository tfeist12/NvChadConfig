local cmp = require "cmp"

-- Get default config from NvChad
dofile(vim.g.base46_cache .. "cmp")

-- Define our options
local options = {
  sources = {
    { name = "nvim_lsp", group_index = 2 },
    { name = "luasnip", group_index = 2 },
    { name = "copilot", group_index = 2 },
    { name = "buffer", group_index = 2 },
    { name = "nvim_lua", group_index = 2 },
    { name = "path", group_index = 2 },
  },

  mapping = cmp.mapping.preset.insert {
    -- Enter to confirm selection
    ["<CR>"] = cmp.mapping.confirm { select = true },

    -- Ctrl-e to abort completion menu
    ["<C-e>"] = cmp.mapping.close(),

    -- Tab/Shift-Tab for cycling through completions
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { "i", "s" }),
  },
}

-- Merge with NvChad UI/formatting config
options = vim.tbl_deep_extend("force", options, require "nvchad.cmp")

-- Setup cmp
cmp.setup(options)
