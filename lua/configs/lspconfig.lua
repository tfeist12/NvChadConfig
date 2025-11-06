require("nvchad.configs.lspconfig").defaults()

-- Enable LSP servers
local servers = {
  "lua_ls",
  "bashls",
  "pylsp",
  "gopls",
  "html",
  "cssls",
  "denols",
  "jqls",
  "yamlls",
  "helm_ls",
}

vim.lsp.enable(servers)
