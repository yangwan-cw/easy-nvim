---@class snacks.dashboard.Config
return {
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        width = 60,
        height=60,
        pane_gap = 4,
        preset = {
          header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
          ]],
        },
        sections = {
          { section = "header" },
          { section = "keys", gap = 1, padding = 1 },

          {
            pane = 2,
            section = "terminal",
            cmd = "pokemon-colorscripts --no-title -r 1",
            height = 20,
            padding = 1,
          },

          { section = "startup" },
        },
      },
    },
  },
}
