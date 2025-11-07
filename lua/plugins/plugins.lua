return {
  -- Auto Completion
  {
    "hrsh7th/nvim-cmp",
    config = function()
      require "configs.cmp"
    end,
  },

  -- LSP Configuration
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- Formatter
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- enable format on save
    opts = require "configs.conform",
  },

  -- Linter
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "configs.nvim-lint"
    end,
  },

  -- Treesitter: Install language parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "bash",
        "python",
        "go",
        "html",
        "css",
        "javascript",
        "typescript",
        "json",
        "yaml",
        "proto",
        "dockerfile",
        "markdown",
        "markdown_inline",
      },
    },
  },

  -- Mason: Install lsp servers, formatters, and linters
  -- Registry List: https://mason-registry.dev/registry/list
  {
    "williamboman/mason.nvim",
    opts = {
      max_concurrent_installers = 15,
      ensure_installed = {
        -- LSP servers
        "lua-language-server",
        "bash-language-server",
        "python-lsp-server",
        "gopls",
        "html-lsp",
        "css-lsp",
        "deno",
        "jq-lsp",
        "yaml-language-server",
        "helm-ls",
        -- Formatters
        "stylua",
        "shfmt",
        "blue",
        "usort",
        "gofumpt",
        "goimports-reviser",
        "golines",
        "prettier",
        -- Linters
        "shellcheck",
        "jsonlint",
        "yamllint",
      },
    },
  },

  -- Harpoon
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("harpoon"):setup()
    end,
  },

  -- Smart splits
  {
    "mrjones2014/smart-splits.nvim",
    -- unable to get proper behaviour while lazy loading
    -- makes minimal impact on startup time
    lazy = false,
  },

  -- Trouble
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    opts = {},
    lazy = true,
  },

  -- Vim-fugitive
  {
    "tpope/vim-fugitive",
    cmd = {
      "G",
      "Git",
    },
    lazy = true,
  },

  -- Vim-be-good
  {
    "ThePrimeagen/vim-be-good",
    cmd = {
      "VimBeGood",
    },
    lazy = true,
  },

  -- Vim helm template support
  {
    "towolf/vim-helm",
    ft = {
      "helm",
    },
    lazy = true,
  },

  -- Copilot
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot", -- only load when explicitly running :Copilot commands
    config = function()
      require("copilot").setup {
        -- use copilot-cmp instead of pannel or suggestion
        panel = { enabled = false },
        suggestion = { enabled = false },
      }
    end,
  },

  -- Copilot Completion
  {
    "zbirenbaum/copilot-cmp",
    event = "InsertEnter", -- loads on insert mode but won't provide completions until Copilot is enabled
    config = function()
      require("copilot_cmp").setup()
    end,
  },

  -- Copilot Chat
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    cmd = "CopilotChat",
    branch = "main",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" },
    },
    build = "make tiktoken",
    opts = {
      -- include the current buffer
      resources = { "buffer" },
    },
    lazy = true,
  },
}
