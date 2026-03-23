return {
  -- 语法高亮与缩进：nvim-treesitter（只启用 C）
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    -- 当前版本入口：nvim-treesitter.init 中转到 config.lua
    require("nvim-treesitter").setup({
      -- 只安装 C 语言解析器，避免装一堆不用的
      ensure_installed = { "c" },
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

