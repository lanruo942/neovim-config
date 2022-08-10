![macOS](https://img.shields.io/badge/macOS-%23.svg?style=flat-square&logo=apple&color=000000&logoColor=white)
![neovim](https://img.shields.io/badge/Neovim-0.8.0-blueviolet.svg?style=flat-square&logo=Neovim&logoColor=green)
![Lua](https://img.shields.io/github/languages/top/lanruo942/neovim-config?logo=lua)
![License](https://img.shields.io/github/license/lanruo942/neovim-config)

# Introduction

This repo hosts my Neovim configuration macOS. `init.lua` is the config entry point for terminal Neovim.

Most of my configuration process comes from [Neovim-from-scratch](https://github.com/LunarVim/Neovim-from-scratch). If you also want to learn you can click the link to view.

# Features

- Plugin management via [Packer.nvim](https://github.com/wbthomason/packer.nvim).

- Code, snippet, word auto-completion via [nvim-cmp](https://github.com/hrsh7th/nvim-cmp).

- Language server protocol (LSP) support via [Mason.nvim](https://github.com/williamboman/mason.nvim).

- Beautiful statusline via [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim).

- File tree explorer via [nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua).

- Code highlighting via [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter).

- Color theme via [nord.nvim](https://github.com/shaunsingh/nord.nvim) and other beautiful themes.

- File searching via [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim).

- Toggle Terminals via [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim).

- Code format, inject LSP diagnostics, and code actions via [null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim).

# Suggestion

I don't recommend you to just clone the whole repository and use it, you should have your own configuration. You can copy the parts you want and add them to your own configuration.

Some plugins require additional dependencies to be installed, if you encounter dependency errors please check the plugin's github page.

# Attention

The Alt key in vim corresponds to the macOS command key, which is bound to system and application-level keymaps, that cannot be mapped to vim shortcuts. If you want to edit the keymaps list using Alt and are using iterm2 terminal software, you can set preferences -> profiles -> keys -> Left Option Key to ESC+. Then your Option key will be mapped to the A/M (Alt/Meta) key in vim.

If you use other terminal software, please google for the setting method.

# Shortcuts

Most of the custom shortcuts are in the file /lua/summer/keymaps.lua, other plugins' shortcuts can be found in their respective configuration files. 

Some plugins don't have configured shortcuts but use default shortcuts, you can visit their github page to see the default shortcuts.
