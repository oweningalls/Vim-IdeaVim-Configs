return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find files" },
      { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Grep in project" },
      { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Find open buffers" },
      { "<leader>fp", "<cmd>Telescope projects<CR>", desc = "Find recent projects" },
    },
opts = {
  defaults = {
    file_ignore_patterns = { "node_modules", "%.git/", "bin/", "obj/" },
  },
  pickers = {
    find_files = {
      hidden = true,
    },
    live_grep = {
      additional_args = { "--hidden" },
    },
  },
},  
},
}
