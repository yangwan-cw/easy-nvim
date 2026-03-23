return {
  -- 标签页：bufferline
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers",
        separator_style = "thin",
        always_show_bufferline = true,
        show_buffer_close_icons = true,
        show_close_icon = false,
        color_icons = true,
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level)
          local icon = level:match("error") and "E" or "W"
          return " " .. icon .. count
        end,
        offsets = {
          {
            filetype = "neo-tree",
            text = "文件树",
            text_align = "left",
          },
        },
      },
    })

    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }
    map("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", opts)
    map("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", opts)
    map("n", "<leader>bd", "<cmd>BufferLinePickClose<CR>", opts)
    map("n", "<leader>bo", "<cmd>BufferLineCloseOthers<CR>", opts)
    map("n", "<leader>br", "<cmd>BufferLineCloseRight<CR>", opts)
    map("n", "<leader>bl", "<cmd>BufferLineCloseLeft<CR>", opts)
    for i = 1, 9 do
      map("n", "<leader>" .. i, "<cmd>BufferLineGoToBuffer " .. i .. "<CR>", opts)
    end
  end,
}

