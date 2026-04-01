return {
  {
    "danymat/neogen",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    keys = {
      {
        "<leader>cg",
        function()
          require("neogen").generate()
        end,
        desc = "生成注释",
      },
    },
    config = function()
      require("neogen").setup({})
    end,
  },
}
