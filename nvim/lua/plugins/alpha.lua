return {
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      dashboard.section.header.val = {
        "                                                     ",
        "  ███╗   ██╗ ██╗   ██╗ ██╗ ███╗   ███╗               ",
        "  ████╗  ██║ ██║   ██║ ██║ ████╗ ████║               ",
        "  ██╔██╗ ██║ ██║   ██║ ██║ ██╔████╔██║               ",
        "  ██║╚██╗██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║               ",
        "  ██║ ╚████║  ╚████╔╝  ██║ ██║ ╚═╝ ██║               ",
        "  ╚═╝  ╚═══╝   ╚═══╝   ╚═╝ ╚═╝     ╚═╝               ",
        "                                                     ",
      }

      dashboard.section.buttons.val = {
        dashboard.button("p", "  Find project", "<cmd>Telescope projects<CR>"),
        dashboard.button("f", "  Find file", "<cmd>Telescope find_files<CR>"),
        dashboard.button("g", "  Grep in project", "<cmd>Telescope live_grep<CR>"),
        dashboard.button("e", "  File explorer", "<cmd>NvimTreeToggle<CR>"),
        dashboard.button("q", "  Quit", "<cmd>qa<CR>"),
      }

      alpha.setup(dashboard.config)
    end,
  },
}