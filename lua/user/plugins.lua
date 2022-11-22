local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.notify("Could not require packer")
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used by lots of plugins
  use "TimUntersberger/neogit" -- Magit-like git manager
  use "jiangmiao/auto-pairs" -- Autocomplete brackets and parens
  use "tpope/vim-endwise" -- Auto complete language keyword pairs
  use({
    "kylechui/nvim-surround", -- Text objects for surrounding
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({})
    end
  })
  use {
    "andymass/vim-matchup", -- Jump around matching keywords with %
    setup = function()
      -- may set any options here
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end
  }
  use {
    "karb94/neoscroll.nvim",  -- Smooth scrolling animations
    config = function()
      require('neoscroll').setup({
        -- All these keys will be mapped to their corresponding default scrolling animation
        mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>',
        '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
        hide_cursor = false,          -- Hide cursor while scrolling
        stop_eof = true,             -- Stop at <EOF> when scrolling downwards
        respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
        easing_function = nil,       -- Default easing function
        pre_hook = nil,              -- Function to run before the scrolling animation starts
        post_hook = nil,             -- Function to run after the scrolling animation ends
        performance_mode = false,    -- Disable "Performance Mode" on all buffers.
      })
    end
  }
  use {
    'nvim-lualine/lualine.nvim', -- Simple status line
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require('lualine').setup{
        options = {
          icons_enabled = false,
          theme = 'auto'
        }
      }
    end
  }
  use {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }
  use {
    "lukas-reineke/indent-blankline.nvim", -- Indent lines
    config = function()
      require("indent_blankline").setup{
        show_current_context = true,
        show_current_context_start = true
      }
    end
  }
  use 'airblade/vim-gitgutter' -- Git hints
  use 'justinmk/vim-sneak' -- Better text navigation
  use "lunarvim/darkplus.nvim" -- Colors :)
  use "drewtempelmeyer/palenight.vim" -- 
  use "folke/tokyonight.nvim"
  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"
  use  "lukas-reineke/cmp-rg" 
  use { 
    "ggandor/leap.nvim",
    config = function()
      require('leap').add_default_mappings()
    end 
  }
  use {
    "terrortylor/nvim-comment",
    config = function()
      require('nvim_comment').setup(
      {
        {
          -- Linters prefer comment and line to have a space in between markers
          marker_padding = true,
          -- should comment out empty or whitespace only lines
          comment_empty = true,
          -- trim empty comment whitespace
          comment_empty_trim_whitespace = true,
          -- Should key mappings be created
          create_mappings = true,
          -- Normal mode mapping left hand side
          line_mapping = "gcc",
          -- Visual/Operator mapping left hand side
          operator_mapping = "gc",
          -- text object mapping, comment chunk,
          comment_chunk_text_object = "ic",
          -- Hook function to call before commenting takes place
          hook = nil
        }
      }

      )
    end
  }
  use {
    "ggandor/flit.nvim",
    config = function()
      require('flit').setup {
        keys = { f = 'f', F = 'F', t = 't', T = 'T' },
        -- A string like "nv", "nvo", "o", etc.
        labeled_modes = "v",
        multiline = true,
        -- Like `leap`s similar argument (call-specific overrides).
        -- E.g.: opts = { equivalence_classes = {} }
        opts = {}
      }
    end
  }
  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer

  use "https://git.sr.ht/~whynothugo/lsp_lines.nvim"
  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use 'nvim-telescope/telescope-media-files.nvim'
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
  -- Sidebar 
  use "sidebar-nvim/sidebar.nvim"
  use "nixprime/cpsm"
  -- use {
  --   "gelguy/wilder.nvim"
  --   config = function()
  --    
  --   end
  -- }
  use 'nvim-tree/nvim-web-devicons'
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  use {
    "nvim-telescope/telescope-frecency.nvim" ,
    requires = {"kkharji/sqlite.lua"}
  }
  use "gelguy/wilder.nvim"
  use "nvim-tree/nvim-tree.lua"
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }
  use { "nvim-telescope/telescope-file-browser.nvim" }
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
