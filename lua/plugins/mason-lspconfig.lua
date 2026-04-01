return {
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig"
    },
    config = function()
      require("mason-lspconfig").setup({
        -- 这里列出你希望 Mason 自动确保安装的语言服务器
        ensure_installed = {
          "lua_ls",
          "pyright",
          "ts_ls",
          "clangd",
          "gopls",
          "jdtls",
        },
        automatic_installation = true,
      })
    end,    
  },
}
