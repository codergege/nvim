return {
  ---------- UI ----------
  -- https://github.com/folke/tokyonight.nvim
  { "folke/tokyonight.nvim" },
  -- https://github.com/akinsho/bufferline.nvim
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
  },
  -- https://github.com/moll/vim-bbye
  { "moll/vim-bbye" },
  -- https://github.com/nvim-lualine/lualine.nvim
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  -- https://nvimdev.github.io/indentmini/
  {
    "nvimdev/indentmini.nvim",
    event = "BufEnter",
  },
  ---------- File System ----------
  -- https://github.com/nvim-tree/nvim-tree.lua
  { "kyazdani42/nvim-tree.lua" },
  -- https://github.com/nvim-telescope/telescope.nvim
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  ---------- Lang ----------
  --- LSP
  -- https://github.com/williamboman/mason.nvim
  { "williamboman/mason.nvim" },
  -- https://github.com/williamboman/mason-lspconfig.nvim
  { "williamboman/mason-lspconfig.nvim" },
  -- https://github.com/neovim/nvim-lspconfig
  { "neovim/nvim-lspconfig" },
  -- https://nvimdev.github.io/lspsaga/
  {
    "nvimdev/lspsaga.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter", -- optional
      "nvim-tree/nvim-web-devicons", -- optional
    },
  },
  --- tree-sitter
  -- https://github.com/nvim-treesitter/nvim-treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
  -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  -- https://github.com/chrisgrieser/nvim-various-textobjs
  {
    "chrisgrieser/nvim-various-textobjs",
    event = "VeryLazy",
    opts = {
      keymaps = {
        useDefaults = true,
      },
    },
  },
  --- none-ls
  -- https://github.com/nvimtools/none-ls.nvim
  {
    "nvimtools/none-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  --- formatter
  -- https://github.com/stevearc/conform.nvim
  {
    "stevearc/conform.nvim",
    opts = {},
  },
  --- cmp
  { "hrsh7th/nvim-cmp" },
  -- Snippet engine
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },
  -- Completion sources
  { "hrsh7th/cmp-nvim-lsp" }, -- { name = nvim_lsp }
  { "hrsh7th/cmp-buffer" }, -- { name = 'buffer' },
  { "hrsh7th/cmp-path" }, -- { name = 'path' }
  { "hrsh7th/cmp-cmdline" }, -- { name = 'cmdline' }
  -- common snippets
  { "rafamadriz/friendly-snippets" },
  -- https://github.com/chrisgrieser/nvim-scissors
  {
    "chrisgrieser/nvim-scissors",
    dependencies = "nvim-telescope/telescope.nvim",
    opts = {
      snippetDir = vim.fn.stdpath("config") .. "/snippets",
    },
  },
  -- https://github.com/folke/trouble.nvim
  { "folke/trouble.nvim" },
  --- UI
  -- https://github.com/onsails/lspkind-nvim
  { "onsails/lspkind-nvim" },
  ---------- DAP ----------
  -- https://github.com/mfussenegger/nvim-dap
  -- { "mfussenegger/nvim-dap" },
  ---------- Build System ----------
  -- https://github.com/Civitasv/cmake-tools.nvim
  -- { "Civitasv/cmake-tools.nvim" },
  ---------- Editing ----------
  -- https://github.com/numToStr/Comment.nvim
  { "numToStr/Comment.nvim" },
  -- https://github.com/windwp/nvim-autopairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },
  -- https://neovimcraft.com/plugin/folke/todo-comments.nvim/
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  ---------- git ----------
  -- https://github.com/lewis6991/gitsigns.nvim
  -- { "lewis6991/gitsigns.nvim" },
  ---------- AI ----------
  -- https://github.com/luozhiya/fittencode.nvim
  {
    "luozhiya/fittencode.nvim",
  },
  -- https://github.com/Exafunction/codeium.vim
  -- {
  --   "Exafunction/codeium.vim",
  --   event = "BufEnter",
  -- },
  -- https://github.com/Exafunction/codeium.nvim
  -- {
  --   "Exafunction/codeium.nvim",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "hrsh7th/nvim-cmp",
  --   },
  -- },
  ---------- Others ----------
  -- https://github.com/akinsho/toggleterm.nvim
  { "akinsho/toggleterm.nvim", version = "*", config = true },
  ---------- mini ----------
  -- https://github.com/echasnovski/mini.nvim
  { "echasnovski/mini.nvim", version = false },
}
