local options = {
  renderer = {
    root_folder_label = ":t",
  },
}

-- Merges custom settings with NvChad's defaults
return vim.tbl_deep_extend("force", require "nvchad.configs.nvimtree", options)
