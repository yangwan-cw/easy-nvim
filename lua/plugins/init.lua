-- Lazy.nvim 插件列表与分文件管理
require("lazy").setup({
  require("plugins.tokyonight"),
  require("plugins.neo-tree"),
  require("plugins.lualine"),
  require("plugins.bufferline"),
  require("plugins.telescope"),
  require("plugins.treesitter"),
  require("plugins.mason"),
  require("plugins.dashboard"),
  require("plugins.mason-lspconfig"),
  require("plugins.lsp"),
  require("plugins.cmp"),
  require("plugins.indent-blankline"),
  require("plugins.autopairs"),
})

