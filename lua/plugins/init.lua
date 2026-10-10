return {
  { -- Parser
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufNewFile", "BufReadPost" },
    config = require("configs.nvim-treesitter"),
  },

  { -- Completion
    "saghen/blink.cmp",
    version = "*",
    event = { "CmdLineEnter", "InsertEnter" },
    opts = require("configs.blink"),
  },

  { -- Portable package manager for LSP, DAP, linters, and formatters
    "mason-org/mason.nvim",
    build = ":MasonUpdate",
    cmd = "Mason",
    event = { "BufNewFile", "BufReadPost" },
    opts = require("configs.mason"),
  },

  { -- Configs for LSP
    "neovim/nvim-lspconfig",
    event = { "BufAdd", "BufNewFile", "BufReadPre" },
    config = require("configs.nvim-lspconfig"),
  },

  { -- DAP client
    "mfussenegger/nvim-dap",
    dependencies = "igorlfs/nvim-dap-view",
    cmd = { "DapContinue", "DapToggleBreakpoint" },
    config = require("configs.nvim-dap").config,
  },

  { -- Visualize debugging sessions
    "igorlfs/nvim-dap-view",
    cmd = "DapViewToggle",
    opts = require("configs.nvim-dap-view"),
  },

  { -- Linter
    "mfussenegger/nvim-lint",
    event = { "BufNewFile", "BufReadPre", "BufWritePost" },
    config = require("configs.nvim-lint"),
  },

  { -- Formatter
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require("configs.conform"),
  },
  { --NeoTree (file meneger)
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false,                    -- neo-tree will lazily load itself
  },
  {                                  --Neogit
    "NeogitOrg/neogit",
    lazy = true,
    dependencies = {
      -- Only one of these is needed.
      "sindrets/diffview.nvim",        -- optional
      "esmuellert/codediff.nvim",      -- optional
      -- For a custom log pager
      "m00qek/baleia.nvim",            -- optional
      -- Only one of these is needed.
      "nvim-telescope/telescope.nvim", -- optional
      "ibhagwan/fzf-lua",              -- optional
      "nvim-mini/mini.pick",           -- optional
      "folke/snacks.nvim",             -- optional
    },
    cmd = "Neogit",
    keys = {
      { "<leader>gg", "<cmd>Neogit<cr>", desc = "Show Neogit UI" }
    }
  },
  { --cmake-tools
    'Civitasv/cmake-tools.nvim', opts = {}
  },
  -- Автозакрытие HTML/XML тегов через treesitter
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  -- Emmet (разворачивание div.hero -> <div class="hero">)
  {
    "mattn/emmet-vim",
    ft = { "html", "css", "scss", "less", "javascript", "typescript", "vue", "svelte" },
    init = function()
      vim.g.user_emmet_leader_key = '<C-y>'
      vim.g.user_emmet_install_global = 0
      vim.cmd([[autocmd FileType html,css,javascript EmmetInstall]])
    end,
  },
}
