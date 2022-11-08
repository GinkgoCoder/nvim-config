local packer = require("packer")

packer.startup({
  function(use)
    use("wbthomason/packer.nvim")
    use("arcticicestudio/nord-vim")
    use("folke/tokyonight.nvim")
    use {
      'romgrk/barbar.nvim',
      requires = { 'kyazdani42/nvim-web-devicons' }
    }
    -- use { 'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons' }
    -- use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" } })
    use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
    use({ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } })
    use({ "nvim-tree/nvim-tree.lua", requires = { "nvim-tree/nvim-web-devicons" } })
    use("glepnir/dashboard-nvim")
    use("ahmedkhalf/project.nvim")
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
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
    use("preservim/tagbar")
    use { "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" }
  end,
  config = {
    display = {
      open_fn = function()
        return require("packer.util").float({ border = "single" })
      end,
    },
  },
})
