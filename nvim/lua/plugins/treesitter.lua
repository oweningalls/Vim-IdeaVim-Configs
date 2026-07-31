return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-treesitter").install({
        "typescript", "tsx", "html", "css", "scss", "json",
        "c_sharp", "lua", "vim", "vimdoc", "bash",
      })

      -- The new API doesn't auto-enable highlighting/indent on its own;
      -- this autocmd turns it on for every buffer treesitter has a parser for.
      vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
          local ok = pcall(vim.treesitter.start, args.buf)
          if ok then
            vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })
    end,
  },
}