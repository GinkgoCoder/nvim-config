# Introduction

This repository is used to setup a neo-vim for the development.

## Prerequisites

| name    | version |
| ------- | ------- |
| neovim  | >=9.0   |
| Packer  | latest  |
| zip     | latest  |
| nodejs  | >=16.0  |
| python3 | 3       |

## Install

1. Copy the whole folder into `~/.config/nvim`
2. Open `nvim`, run `PackerSync` twice`

## Language Support

- Python
  - `pip install autopep8`
- Rust
- Markdown
- Lua

## Plugin

- [barbar](https://github.com/romgrk/barbar.nvim) for the tab of the editor
- [lualine](https://github.com/nvim-lualine/lualine.nvim) for the status lualine
- [telescope](https://github.com/nvim-telescope/telescope.nvim) for the dialog to search
- [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua) for the file structure
- [dashboard](https://github.com/glepnir/dashboard-nvim) for the welcome screen
- [project](https://github.com/ahmedkhalf/project.nvim) for saving the projects
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) for the source file parser and syntax
- [indent-blankline](https://github.com/lukas-reineke/indent-blankline.nvim) for showing the indentation depth
- [null-ls](https://github.com/jose-elias-alvarez/null-ls.nvim) for formatting the code
- [coc](https://github.com/neoclide/coc.nvim) for code completion
- [toggleterm](https://github.com/akinsho/toggleterm.nvim) for terminal interaction
- [Friendly-snippets](https://github.com/rafamadriz/friendly-snippets) for more snippets
- [vim-markdown](https://github.com/preservim/vim-markdown) and [markdown-preview](https://github.com/iamcco/markdown-preview.nvim) for the markdown editing
- [Comment](https://github.com/numToStr/Comment.nvim) for commenting
- [Tagbar](https://github.com/preservim/tagbar) for tagging the source file
- [nvim-surround](https://github.com/kylechui/nvim-surround) for surrounding the word with quote or double quote
