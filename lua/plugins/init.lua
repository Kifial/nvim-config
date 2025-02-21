local builtin_plugins = {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      "debugloop/telescope-undo.nvim",
    },
    config = function()
      require("plugins.configs.telescope")
    end
  },
  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    config = function()
      require("nvim-tree").setup(require("plugins.configs.tree"))
    end,
  },
  {
    "williamboman/mason.nvim",
    lazy = false,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("plugins.configs.lspconfig")
    end
  },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    config = function()
      require("plugins.configs.typescript-tools")
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      {
        -- snippet plugin
        "L3MON4D3/LuaSnip",
        dependencies = "rafamadriz/friendly-snippets",
        opts = { history = true, updateevents = "TextChanged,TextChangedI" },
        config = function(_, opts)
          require("luasnip").config.set_config(opts)
          require("plugins.configs.luasnip")
        end,
      },

      -- autopairing of (){}[] etc
      { "windwp/nvim-autopairs" },

      -- cmp sources plugins
      {
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "onsails/lspkind.nvim",
      },
    },
    opts = function()
      require("plugins.configs.cmp")
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvimtools/none-ls-extras.nvim" },
    lazy = false,
    config = function()
      require("plugins.configs.null-ls")
    end
  },
  -- {
  --   "Mofiqul/vscode.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("vscode").setup({})
  --
  --     vim.cmd([[colorscheme vscode]])
  --   end
  -- },
  -- {
  --   "catppuccin/nvim",
  --   name = "catppuccin",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("catppuccin").setup({
  --       flavour = "macchiato"
  --     })
  --
  --     vim.cmd([[colorscheme catppuccin]])
  --   end
  -- },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "storm", -- or "night" | "moon" | "day"

        on_colors = function(colors)
          colors.bg = "#1e1e1e"
          colors.fg = "#d1d8f8"
        end,

        on_highlights = function(hl, c)
          hl.LineNr = { fg = "#ffcc00" }      -- Relative line numbers
          hl.LineNrAbove = { fg = "#999999" } -- Relative line numbers
          hl.LineNrBelow = { fg = "#999999" } -- Relative line numbers
          hl.Keyword = { fg = c.orange }      -- Async/Await color
          hl.Special = { fg = "#f45fe6" }
          hl.Statement = { fg = "#b77eff" }
          hl.Identifier = { fg = "#b77eff" }
          hl["@lsp.type.interface"] = { fg = "#38caa0" }
          hl.Type = { fg = "#38caa0" }
          hl.Function = { fg = "#ffe66e" }
          hl["@property"] = { fg = "#d1d8f8" }
          hl["@lsp.type.variable"] = { fg = "#67d1f6" }
          hl["@lsp.typemod.type.defaultLibrary"] = { fg = "#4ec9a6" }
          hl["@type.builtin"] = { fg = "#4ec9a6" }
        end
      })

      vim.cmd([[colorscheme tokyonight]])
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = function()
      require("plugins.configs.treesitter")
    end,
  },
  {
    "rachartier/tiny-code-action.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim" },
    },
    event = "LspAttach",
    config = function()
      require('plugins.configs.tiny-code-actions')
    end
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("which-key").setup()
    end,
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
  {
    "chentoast/marks.nvim",
    event = "VeryLazy",
    opts = function()
      require("plugins.configs.marks")
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = function()
      require("plugins.configs.lualine")
    end
  },
  {
    "tpope/vim-fugitive"
  },
  {
    "github/copilot.vim"
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = function()
      require("plugins.configs.gitsigns")
    end
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = function()
      require("plugins.configs.harpoon")
    end
  }
}

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { builtin_plugins },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "tokyonight" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

local user_grp = vim.api.nvim_create_augroup("LazyUserGroup", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = "lazy",
  desc = "Quit lazy with <esc>",
  callback = function()
    vim.keymap.set(
      "n",
      "<esc>",
      function() vim.api.nvim_win_close(0, false) end,
      { buffer = true, nowait = true }
    )
  end,
  group = user_grp,
})
