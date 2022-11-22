local configs = require("nvim-treesitter.configs")
configs.setup {
  ensure_installed = {'c', 'javascript', 'python', 'elixir', 'rust'},
  sync_install = true,
  ignore_install = { "" }, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = false,
  },
  indent = { enable = true, disable = { "yaml" } },
}

