return {
  "folke/tokyonight.nvim",
  lazy = false, -- 启动时立刻加载
  priority = 1000, -- 优先级高，先加载主题
  config = function()
    vim.cmd("colorscheme tokyonight")
  end,
}

