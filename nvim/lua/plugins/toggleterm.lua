return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = {
      { "<leader>t", "<cmd>ToggleTerm<CR>", desc = "Toggle terminal 1" },
      { "<leader>1", "<cmd>1ToggleTerm<CR>", desc = "Toggle terminal 1" },
      { "<leader>2", "<cmd>2ToggleTerm<CR>", desc = "Toggle terminal 2" },
      { "<leader>3", "<cmd>3ToggleTerm<CR>", desc = "Toggle terminal 3" },
    },
    opts = {
      size = 15,
      open_mapping = [[<C-\>]],
      direction = "horizontal", -- "horizontal" | "vertical" | "float" | "tab"
      shell = "pwsh.exe",
      persist_size = true,
      close_on_exit = true,
      start_in_insert = true,
      on_open = function()
        vim.cmd("startinsert")
      end,
      dir = function()
        return vim.fn.getcwd()
      end,
    },
  },
}