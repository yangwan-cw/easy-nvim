return {
  {
    "olimorris/codecompanion.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    keys = {
      { "<leader>at", "<cmd>CodeCompanionChat Toggle<CR>", desc = "CodeCompanion: 切换对话" },
      { "<leader>af", "<cmd>CodeCompanionActions<CR>", desc = "CodeCompanion: 动作面板" },
      { "<leader>an", "<cmd>CodeCompanionChat<CR>", desc = "CodeCompanion: 新建对话" },
      { "<leader>aa", "<cmd>CodeCompanion<CR>", desc = "CodeCompanion: 询问代码" },
      { "<leader>ap", "<cmd>CodeCompanionCmd /buffer<CR>", desc = "CodeCompanion: 基于当前 buffer 提问" },
    },
    config = function()
      local key = vim.fn.system("security find-generic-password -s codecompanion-deepseek-api-key -w 2>/dev/null")
      key = vim.trim(key or "")
      if key ~= "" then
        vim.env.DEEPSEEK_API_KEY = key
      end

      require("codecompanion").setup({
        strategies = {
          chat = {
            adapter = "deepseek",
          },
          inline = {
            adapter = "deepseek",
          },
          cmd = {
            adapter = "deepseek",
          },
        },
        adapters = {
          deepseek = function()
            return require("codecompanion.adapters").extend("deepseek", {
              env = {
                api_key = "DEEPSEEK_API_KEY",
              },
              schema = {
                model = {
                  default = "deepseek-chat",
                },
              },
            })
          end,
        },
      })
    end,
  },
}
