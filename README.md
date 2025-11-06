# My NvChad Configuration

This is a fork of the [NvChad starter](https://github.com/NvChad/starter) repository, configured for my personal development workflow.

## What is NvChad?

NvChad is a Neovim configuration framework. The main [NvChad repo](https://github.com/NvChad/NvChad) is loaded as a plugin, providing the base UI and functionality. This starter repo contains only the user customizations and plugin configurations.

## Installation

To use this configuration:

```bash
# Clone this repo as your Neovim config and start nvim
git clone https://github.com/tfeist12/NvChadConfig ~/.config/nvim --depth 1 && nvim
```

On first launch, Neovim will:

1. Install lazy.nvim (plugin manager)
2. Install NvChad as a plugin
3. Install all configured plugins
4. Download LSP servers, formatters, and linters via Mason

**This may take a few minutes!**

## Custom Changes

This configuration includes the following customizations beyond the default NvChad setup:

### Theme & UI

- **Theme**: Tokyo Night
- **Dashboard**: Custom nvdash buttons including Harpoon integration
- **Relative line numbers** enabled

### Plugins Added

- **Harpoon**: Quick file navigation
- **Trouble**: Better diagnostics UI
- **Smart-splits**: Improved window navigation and resizing
- **Copilot.lua**: GitHub Copilot AI suggestions
- **Copilot-cmp**: Copilot integration with nvim-cmp
- **CopilotChat**: Chat interface for GitHub Copilot
- **Vim-fugitive**: Git integration
- **Vim-helm**: Helm template support
- **Vim-be-good**: Vim motion practice

### LSP & Formatting

- **LSP Servers** (via Mason): lua_ls, bashls, pylsp, gopls, html, cssls, denols, jqls, yamlls, helm_ls
- **Formatters** (via conform.nvim): stylua, shfmt, blue, usort, gofumpt, goimports-reviser, golines, prettier
- **Linters** (via nvim-lint): shellcheck, jsonlint, yamllint

### Tree-sitter Parsers

Configured for: vim, lua, vimdoc, bash, python, go, html, css, javascript, typescript, json, yaml, proto, dockerfile, markdown

## File Structure

```
~/.config/nvim/
├── init.lua                     # Entry point
├── lua/
│   ├── chadrc.lua               # NvChad UI configuration
│   ├── options.lua              # Neovim options
│   ├── mappings.lua             # Custom keybindings
│   ├── autocmds.lua             # Autocommands
│   ├── configs/                 # Plugin configurations
│   │   ├── cmp.lua
│   │   ├── conform.lua
│   │   ├── lspconfig.lua
│   │   ├── nvim-lint.lua
│   │   └── telescope-harpoon.lua
│   └── plugins/
│       └── plugins.lua          # Plugin specifications
└── lazy-lock.json               # Plugin version lock file
```

## Credits

- [NvChad](https://github.com/NvChad/NvChad) - The Neovim configuration framework
- [NvChad Starter](https://github.com/NvChad/starter) - Base configuration template
- [LazyVim](https://github.com/LazyVim/starter) - Inspiration for the starter approach
