return {
  {
    "stevearc/conform.nvim",
    opts = require "configs.conform",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    config = function(_, opts)
      local cmp = require "cmp"

      opts.preselect = cmp.PreselectMode.None
      opts.completion.completeopt = "noselect"

      cmp.setup(opts)
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = function()
      require("nvim-treesitter").install {
        "lua",
        "html",
        "css",
        "javascript",
        "rust",
        "c",
      }
    end,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require "configs.whichkey"
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      on_attach = require("configs.nvimtree").on_attach,
    },
  },
  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },
}
