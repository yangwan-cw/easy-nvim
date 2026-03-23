return {
  -- 侧边栏：neo-tree
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  cmd = "Neotree",
  keys = {
    {
      "<leader>e",
      "<cmd>Neotree toggle filesystem reveal=true<CR>",
      desc = "切换文件树（neo-tree）",
    },
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true,
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = true,
      filesystem = {
        bind_to_cwd = true,
        follow_current_file = {
          enabled = true,
        },
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
        },
        use_libuv_file_watcher = true,
      },
      window = {
        width = 30,
        mappings = {
          ["<space>"] = "none",
        },
      },
    })
  end,
}

