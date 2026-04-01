return {
  "folke/tokyonight.nvim",
  lazy = false, -- 启动时立刻加载
  priority = 1000, -- 优先级高，先加载主题
  config = function()
    require("tokyonight").setup({
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    })
    vim.cmd("colorscheme tokyonight")
  end,
}
