return {
  {
    "saghen/blink.cmp",
    lazy = false,
    version = "1.*",
    dependencies = {
      "L3MON4D3/LuaSnip",
    },
    opts = {
      snippets = {
        preset = "luasnip",
      },
      keymap = {
        preset = "enter",
        ["<C-j>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-e>"] = { "hide", "fallback" },
        ["<CR>"] = { "accept", "fallback" },
        ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
        ["<C-b>"] = { "scroll_documentation_up", "fallback" },
        ["<C-f>"] = { "scroll_documentation_down", "fallback" },
      },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono",
      },
      completion = {
        list = {
          selection = {
            preselect = true,
            auto_insert = false,
          },
        },
        menu = {
          draw = {
            columns = {
              { "kind_icon" },
              { "label", "label_description", gap = 1 },
            },
          },
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
        },
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer", "codecompanion" },
      },
      signature = {
        enabled = true,
      },
    },
  },
}
