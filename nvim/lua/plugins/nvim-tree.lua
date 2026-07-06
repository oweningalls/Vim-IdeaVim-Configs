return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file explorer" },
    },
    opts = {
      view = {
        width = 30,
      },
      filters = {
        dotfiles = false, -- show hidden files like .gitignore
      },
      git = {
        enable = true, -- show git status markers in the tree
      },
    },
  },
}