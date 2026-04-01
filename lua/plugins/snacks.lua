return {
  {
    "folke/snacks.nvim",
    keys = {
      { "<leader>ff", function() Snacks.picker.files({ cwd = vim.fn.getcwd(), hidden = true, ignored = true }) end, desc = "搜索文件" },
      { "<leader>fg", function() Snacks.picker.grep({ cwd = vim.fn.getcwd(), hidden = true, ignored = true }) end, desc = "搜索内容" },
      { "<leader>fs", function() Snacks.picker.lines() end, desc = "搜索当前文件内容" },
      { "<leader>fb", function() Snacks.picker.buffers() end, desc = "搜索缓冲区" },
      { "<leader>gf", function() Snacks.picker.git_files({ cwd = vim.fn.getcwd() }) end, desc = "Git 文件" },
      { "<leader>fr", function() Snacks.picker.recent() end, desc = "最近文件" },
      { "<leader>fh", function() Snacks.picker.help() end, desc = "帮助文档" },
    },
    opts = {
      picker = {
        enabled = true,
        grep = {
          cmd = "/opt/homebrew/bin/rg",
        },
      },
      input = { enabled = true },
      notifier = { enabled = true },
    },
  },
}
