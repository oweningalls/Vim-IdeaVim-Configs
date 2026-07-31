return {
  {
    "ahmedkhalf/project.nvim",
    event = "VeryLazy",
    opts = {
      detection_methods = { "pattern" },
      patterns = { ".git", "package.json", "*.sln", "*.csproj" },
    },
    config = function(_, opts)
  require("project_nvim").setup(opts)
  require("telescope").load_extension("projects")

  -- Safety net: force-save project history on quit, in case the plugin's
  -- own internal autocmd doesn't fire (seen this happen on this setup).
    vim.api.nvim_create_autocmd("VimLeavePre", {
    callback = function()
      require("project_nvim.utils.history").write_projects_to_history()
    end,
  })
end,
  },
}