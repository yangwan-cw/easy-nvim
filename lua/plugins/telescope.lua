return {
  -- 模糊搜索：telescope
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local telescope = require("telescope")
    telescope.setup({
      defaults = {
        prompt_prefix = "> ",
        selection_caret = "> ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "bottom",
            preview_width = 0.55,
            results_width = 0.8,
          },
        },
        file_ignore_patterns = {
          "%.git/",
          "node_modules/",
          "%.o",
          "%.so",
          "%.pyc",
          "__pycache__/",
          "%.swp",
          "%.swo",
        },
      },
    })

    local builtin = require("telescope.builtin")
    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }
    map("n", "<leader>ff", builtin.find_files, { desc = "搜索文件" })
    map("n", "<leader>fg", builtin.live_grep, { desc = "搜索内容" })
    map("n", "<leader>fb", builtin.buffers, { desc = "搜索缓冲区" })
    map("n", "<leader>gf", builtin.git_files, { desc = "Git 文件" })
    map("n", "<leader>fr", builtin.oldfiles, { desc = "最近文件" })
    map("n", "<leader>fh", builtin.help_tags, { desc = "帮助文档" })
  end,
}

