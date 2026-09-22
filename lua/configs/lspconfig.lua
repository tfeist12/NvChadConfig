require("nvchad.configs.lspconfig").defaults()

-- Enable LSP servers
-- Server list: https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
local servers = {
  "lua_ls",
  "bashls",
  "pylsp",
  "gopls",
  "jsonls",
  "yamlls",
  "helm_ls",
}

vim.lsp.enable(servers)
