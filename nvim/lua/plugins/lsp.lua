return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      require("mason").setup()

      require("mason-lspconfig").setup({
        ensure_installed = { "ts_ls", "angularls", "html", "cssls" },
      })

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(event)
          local map = function(keys, fn, desc)
            vim.keymap.set("n", keys, fn, { buffer = event.buf, desc = desc })
          end
          map("gd", vim.lsp.buf.definition, "Go to definition")
          map("gr", vim.lsp.buf.references, "Go to references")
          map("K", vim.lsp.buf.hover, "Hover documentation")
          map("<leader>rn", vim.lsp.buf.rename, "Rename symbol")
          map("<leader>ca", vim.lsp.buf.code_action, "Code action")
        end,
      })

      -- Native config API (0.11+) replaces require('lspconfig').X.setup({})
      vim.lsp.config("ts_ls", { capabilities = capabilities })

      vim.lsp.config("angularls", {
        capabilities = capabilities,
        on_new_config = function(new_config, new_root_dir)
          new_config.cmd = {
            "ngserver",
            "--stdio",
            "--tsProbeLocations", new_root_dir .. "/node_modules",
            "--ngProbeLocations", new_root_dir .. "/node_modules",
          }
        end,
      })

      vim.lsp.config("html", { capabilities = capabilities })
      vim.lsp.config("cssls", { capabilities = capabilities })

      vim.lsp.enable({ "ts_ls", "angularls", "html", "cssls" })

      vim.diagnostic.config({ virtual_text = { prefix = "●" } })
    end,
  },
}