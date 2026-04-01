return {
  -- 语法高亮与缩进：nvim-treesitter
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    -- 当前版本入口：nvim-treesitter.init 中转到 config.lua
    require("nvim-treesitter").setup({
      ensure_installed = { "c", "go", "java", "lua", "python", "typescript", "javascript" },
      sync_install = false,
      auto_install = false,
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
    })
  end,
}
