local packer = require("packer")

packer.startup({
  function(use)
    use("wbthomason/packer.nvim")
    use("arcticicestudio/nord-vim")
    use("folke/tokyonight.nvim")
    use({ "projekt0n/github-nvim-theme" })
    use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" } })
    use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
    use("arkav/lualine-lsp-progress")
    use({ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } })
    use({ "nvim-tree/nvim-tree.lua", requires = { "nvim-tree/nvim-web-devicons" } })
    use("glepnir/dashboard-nvim")
    use("ahmedkhalf/project.nvim")
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    use({ "williamboman/mason.nvim" })
    use({ "williamboman/mason-lspconfig.nvim" })
    use("neovim/nvim-lspconfig")
    -- auto complete
    -- autocomplete engine
    use("hrsh7th/nvim-cmp")
    -- snippet engine
    use("hrsh7th/vim-vsnip")
    -- auto complete source
    use("hrsh7th/cmp-vsnip")
    use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
    use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
    use("hrsh7th/cmp-path") -- { name = 'path' }
    use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }
    -- common snippet
    use("rafamadriz/friendly-snippets")
    use("lukas-reineke/indent-blankline.nvim")
    use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })
    use("puremourning/vimspector")
    use("numToStr/Comment.nvim")
    use({ "kylechui/nvim-surround", tag = "*" })
    use({ "akinsho/toggleterm.nvim", tag = "*" })
    use({ "neoclide/coc.nvim", branch = "release" })
    use("preservim/vim-markdown")
    use({
      "iamcco/markdown-preview.nvim",
      run = "cd app && npm install",
      setup = function()
        vim.g.mkdp_filetypes = { "markdown" }
      end,
      ft = { "markdown" },
    })
  end,
  config = {
    display = {
      open_fn = function()
        return require("packer.util").float({ border = "single" })
      end,
    },
  },
})
