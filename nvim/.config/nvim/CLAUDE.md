# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Configuration Architecture

This is a Neovim configuration based on kickstart.nvim with a modular custom extension structure:

### Core Structure
- `init.lua`: Main configuration entry point that sets up leader keys, basic options, keymaps, LSP, and plugin loading
- `lua/custom/options.lua`: Custom Neovim options (line numbers disabled, clipboard sync, splits, etc.)
- `lua/custom/keymaps.lua`: Extensive custom keybindings and autocommands
- `lua/custom/plugins/`: Directory containing modular plugin configurations
- `lazy-bootstrap.lua`: Lazy.nvim package manager bootstrap
- `kickstart/plugins/`: Base kickstart plugin configurations

### Plugin Management
Uses Lazy.nvim for plugin management. Plugins are loaded from:
1. Core plugins defined in `init.lua`
2. Kickstart plugins from `require 'kickstart.plugins.*'`
3. Custom plugins imported via `{ import = 'custom.plugins' }`

### Key Custom Configurations

#### Navigation & Editing
- `H`/`L`: Jump to beginning/end of line
- `J`/`K`: Move 6 lines down/up with centering
- `<C-d>`/`<C-u>`: Half-page scroll with centering
- `vv`: Select entire buffer
- Custom split resizing with `<leader>r[hjkl]`

#### File Management
- Neo-tree positioned on right side with `<leader>fn`
- Oil file explorer with `<leader>fo`
- Arrow.nvim for file navigation with `<leader>p`/`<leader>n`

#### Git Integration
- Fugitive for Git operations with custom keybindings in git buffers
- Auto-configured push/pull/stash commands when in fugitive buffer
- Gitsigns for line blame toggle

#### Language Support
Configured LSP servers:
- `lua_ls`: Lua language server
- `ts_ls`: TypeScript/JavaScript
- `astro`: Astro framework
- `pyright`: Python
- `emmet_language_server`: HTML/CSS/JS emmet support

Formatters via conform.nvim:
- `stylua`: Lua formatting
- `isort` + `black`: Python formatting
- `prettier`/`prettierd`: JavaScript formatting

## Development Commands

### Plugin Management
- `:Lazy`: Open Lazy.nvim plugin manager
- `:Lazy update`: Update all plugins
- `:Mason`: Open Mason tool installer for LSP servers and formatters

### LSP & Diagnostics
- `<leader>d`: Toggle diagnostics display
- `gd`: Go to definition
- `gr`: Go to references  
- `<leader>ca`: Code actions
- `<leader>rn`: Rename symbol

### File Operations
- `<leader>w`: Save file (`:update`)
- `<leader>q`: Quit
- `<leader>Q`: Force quit
- `<leader>bda`: Delete all buffers except current

### Git Operations (in fugitive buffer)
- `<leader>p`: Git push
- `<leader>P`: Git pull --rebase
- `<leader>t`: Git push -u origin (with branch name completion)
- `<leader>ss`: Git stash save -u (interactive)
- `<leader>sa`: Git stash save -u "ES setup"

### Search & Replace
- `<C-r>` (visual mode): Search and replace selected text
- `s`/`ss`/`S`: Substitute operations via substitute.nvim

## Important Notes

### Disabled Features
- Line numbers are disabled by default (`lua/custom/options.lua:7-8`)
- Can be toggled with `<leader>tn` (numbers) and `<leader>tr` (relative numbers)

### AI Integration
- ClaudeCode.nvim is configured with keybindings under `<leader>a`
- Avante.nvim is currently commented out in `lua/custom/plugins/avante.lua`

### Custom Autocommands
- Highlight on yank is enabled
- Special fugitive buffer keybindings auto-configured via `ericlunadev` augroup
- Custom Browse command for opening URLs (macOS-specific using `open`)

### Special Utilities
- Pytest command copying: `<leader>pyt` copies `pytest <current-file> -vv -s` to clipboard
- Transparent background support via transparent.nvim
- Multiple cursor support via vim-visual-multi
- Enhanced text objects via nvim-various-textobjs and treesitter-textobjects