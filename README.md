![dash](doc/dashboard.PNG)

### Introduction

This is my personal Neovim config which I use for web development. I used [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) to make my config, you should check them out if you want to **start your Neovim journey**.

### Plugins

These are the plugins i use:

- Bufferline/Top bar - [nvim-cokeline](https://github.com/willothy/nvim-cokeline) 

- Colorscheme/Theme - [grubbox.nvim](https://github.com/ellisonleao/gruvbox.nvim)

- Diagnostics, references, telescope results, quickfix and location list - [trouble.nvim](https://github.com/folke/trouble.nvim)

- Greeter/Dashboard - [alpha-nvim](https://github.com/goolord/alpha-nvim)

- Markdown preview - [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim)

- Organizized/Note taking - [neorg](https://github.com/nvim-neorg/neorg)

- Session manager - [neovim-session-manager](https://github.com/Shatur/neovim-session-manager)

- Sidebar file system manager - [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)

- Statusline/Bottom bar - [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)

- TODO comments - [todo-comments.nvim](https://github.com/folke/todo-comments.nvim)

- Window layout manager - [edgy.nvim](https://github.com/folke/edgy.nvim)

Plus the ones that came with kickstart.nvim.

### Installation

Neovim's configurations are located under the following paths, depending on your OS:

| OS | PATH |
| :- | :--- |
| Linux | `$XDG_CONFIG_HOME/nvim`, `~/.config/nvim` |
| MacOS | `$XDG_CONFIG_HOME/nvim`, `~/.config/nvim` |
| Windows (cmd)| `%userprofile%\AppData\Local\nvim\` |
| Windows (powershell)| `$env:USERPROFILE\AppData\Local\nvim\` |

Clone astro.nvim:

- on Linux and Mac
```sh
git clone https://github.com/Miloua91/astro.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
```

- on Windows (cmd)
```
git clone https://github.com/Miloua91/astro.nvim.git %userprofile%\AppData\Local\nvim\ 
```

- on Windows (powershell)
```
git clone https://github.com/Miloua91/astro.nvim.git $env:USERPROFILE\AppData\Local\nvim\ 
```
