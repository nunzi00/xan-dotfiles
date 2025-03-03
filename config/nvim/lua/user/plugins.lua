local fn = vim.fn

-- Automatically install lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
--
-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
  return
end

-- Install your plugins here
lazy.setup({
  "nvim-lua/plenary.nvim", -- Useful lua functions used by lots of plugins
  "windwp/nvim-autopairs", -- Autopairs, integrates with both cmp and treesitter
  { "phpactor/phpactor", build = "composer install", ft = "php"},
  -- { "rest-nvim/rest.nvim", dependencies = {"nvim-lua/plenary.nvim"} },
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
  },
  -- {
  --   "rest-nvim/rest.nvim",
  --   ft = "http",
  --   dependencies = { "luarocks.nvim" },
  --   config = function()
  --     require("rest-nvim").setup()
  --   end
  -- },
  { "numToStr/Comment.nvim" },
  { "JoosepAlviste/nvim-ts-context-commentstring" },
  { "nvim-tree/nvim-web-devicons", lazy = false },
  { "mubisco/idx.nvim", opts = { disableKeymaps = false } },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy= false,
    dependencies = {"nvim-tree/nvim-web-devicons"},
    config = function ()
      require("nvim-tree").setup {
        update_focused_file = {
          enable = true,
          update_cwd = true,
        },
        renderer = {
          root_folder_modifier = ":t",
          -- icons = {
          --   glyphs = {
          --     default = "",
          --     symlink = "",
          --     folder = {
          --       arrow_open = "",
          --       arrow_closed = "",
          --       default = "",
          --       open = "",
          --       empty = "",
          --       empty_open = "",
          --       symlink = "",
          --       symlink_open = "",
          --     },
          --     git = {
          --       unstaged = "",
          --       staged = "S",
          --       unmerged = "",
          --       renamed = "➜",
          --       untracked = "U",
          --       deleted = "",
          --       ignored = "◌",
          --     },
          --   },
          -- },
        },
        diagnostics = {
          enable = true,
          show_on_dirs = true,
          icons = {
            hint = "󰉀",
            info = "",
            warning = "",
            error = "",
          },
        },
        view = {
          width = 40,
          side = "left",
        }
      }
    end
  },
  { "akinsho/bufferline.nvim" },
  { "moll/vim-bbye" },
  { "nvim-lualine/lualine.nvim" },
  { "akinsho/toggleterm.nvim" },
  { "chrisbra/csv.vim" }, -- Improve Csv visualization
  { "goolord/alpha-nvim" },
  { "folke/which-key.nvim" },

  -- Cmp 
  "hrsh7th/nvim-cmp", -- The completion plugin
  "hrsh7th/cmp-buffer", -- buffer completions
  "hrsh7th/cmp-path", -- path completions
  "saadparwaiz1/cmp_luasnip", -- snippet completions
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-nvim-lua",

  -- Snippets
  "L3MON4D3/LuaSnip", --snippet engine
  "rafamadriz/friendly-snippets", -- a bunch of snippets to use

  -- LSP
  "neovim/nvim-lspconfig", -- enable LSP
  "williamboman/mason.nvim", -- simple to use language server installer
  "williamboman/mason-lspconfig.nvim",
  "nvimtools/none-ls.nvim",
  "jose-elias-alvarez/nvim-lsp-ts-utils",
  "RRethy/vim-illuminate",
  "onsails/lspkind.nvim",

  -- Copilot
  -- { 'github/copilot.vim' },
  {
    "zbirenbaum/copilot.lua",
    lazy = true,
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    config = function ()
      require("copilot_cmp").setup()
    end
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    opts = {
      show_help = "yes", -- Show help text for CopilotChatInPlace, default: yes
      debug = false, -- Enable or disable debug mode, the log file will be in ~/.local/state/nvim/CopilotChat.nvim.log
      disable_extra_info = 'no', -- Disable extra information (e.g: system prompt) in the response.
      language = "English" -- Copilot answer language settings when using default prompts. Default language is English.
      -- proxy = "socks5://127.0.0.1:3000", -- Proxies requests via https or socks.
      -- temperature = 0.1,
    },
    build = function()
      vim.notify("Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim.")
    end,
    event = "VeryLazy",
    keys = {
      { "<leader>ccb", ":CopilotChatBuffer ", desc = "CopilotChat - Chat with current buffer" },
      { "<leader>cce", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
      { "<leader>cct", "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate tests" },
      {
        "<leader>ccT",
        "<cmd>CopilotChatVsplitToggle<cr>",
        desc = "CopilotChat - Toggle Vsplit", -- Toggle vertical split
      },
      {
        "<leader>ccv",
        ":CopilotChatVisual ",
        mode = "x",
        desc = "CopilotChat - Open in vertical split",
      },
      {
        "<leader>ccx",
        ":CopilotChatInPlace<cr>",
        mode = "x",
        desc = "CopilotChat - Run in-place code",
      },
      {
        "<leader>ccf",
        "<cmd>CopilotChatFixDiagnostic<cr>", -- Get a fix for the diagnostic message under the cursor.
        desc = "CopilotChat - Fix diagnostic",
      },
      {
        "<leader>ccr",
        "<cmd>CopilotChatReset<cr>", -- Reset chat history and clear buffer.
        desc = "CopilotChat - Reset chat history and clear buffer",
      }
    },
  },
  {
    "zbirenbaum/copilot-cmp",
    config = function ()
      require("copilot_cmp").setup()
    end
  },
  -- Git
  "lewis6991/gitsigns.nvim",
  "tpope/vim-fugitive",

  -- Telescope
  "nvim-telescope/telescope.nvim",
  -- Install telescope-media-files

  -- Treesitter
  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},

  -- Debugger
  'mfussenegger/nvim-dap',
  'theHamsta/nvim-dap-virtual-text',
  {"rcarriga/nvim-dap-ui", dependencies={"nvim-neotest/nvim-nio"}},

  -- Tests
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "olimorris/neotest-phpunit",
      "nvim-neotest/neotest-go",
      "marilari88/neotest-vitest",
      "nvim-neotest/neotest-jest"
    }
  },

  -- Harpoon
  {"theprimeagen/harpoon"},

  -- Colorschemes
  "lunarvim/colorschemes",
  "folke/tokyonight.nvim",
  "loctvl842/monokai-pro.nvim",
  'Siphalor/vim-atomified',
  'patstockwell/vim-monokai-tasty',
  'nanotech/jellybeans.vim',
  'sainnhe/sonokai',
{"johmsalas/text-case.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  config = function()
    require("textcase").setup({})
    require("telescope").load_extension("textcase")
  end,
  keys = {
    "ga", -- Default invocation prefix
    { "fr", "<cmd>TextCaseOpenTelescope<CR>", mode = { "n", "x" }, desc = "Telescope" },
  }},
--   {
--   'kiddos/gemini.nvim',
--   build = { 'pip install -r requirements.txt', ':UpdateRemotePlugins' },
--   config = function()
--     require('gemini').setup({
--         menu_key = '<C-c>',
--       })
--   end
-- }
{
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "hrsh7th/nvim-cmp", -- Optional: For using slash commands and variables in the chat buffer
    "nvim-telescope/telescope.nvim", -- Optional: For using slash commands
    { "stevearc/dressing.nvim", opts = {} }, -- Optional: Improves `vim.ui.select`
  },

    config = function()
      require("codecompanion").setup({
        adapters = {
          gemini = function()
            return require("codecompanion.adapters").extend("gemini", {
              env = {
                api_key = "AIzaSyCraPaTokY8tOt9TiVon-sLx2oylxLt2c8"
              },
            })
          end,
        },
        strategies = {
          chat = {
            adapter = "gemini",
          },
          inline = {
            adapter = "gemini",
          },
          agent = {
            adapter = "gemini",
          },
        },
      })
    end,
    keys = {
      {'<C-c>', "<cmd>Telescope codecompanion<cr>"},
      {'<C-a>', "<cmd>CodeCompanionChat Toggle<cr>"},
      {'ga',"<cmd>CodeCompanionChat Add<cr>",mode = {"v"}},
    },
}
})

