-- Lazy.nvim 插件列表与初始化
require("lazy").setup({
  {
    "folke/tokyonight.nvim",
    lazy = false,       -- 启动时立刻加载
    priority = 1000,    -- 优先级高，先加载主题
    config = function()
      vim.cmd("colorscheme tokyonight")
    end,
  },

  -- 侧边栏：neo-tree
  {
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
  },

  -- 底部信息栏：lualine
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          icons_enabled = true,
          theme = "auto", -- 自动跟随当前 colorscheme（如 tokyonight）
          component_separators = { left = "│", right = "│" },
          section_separators = { left = "", right = "" },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { "filename" },
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      })
    end,
  },
})

