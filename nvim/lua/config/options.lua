-- Shared core (mapleader, search options, common keymaps) lives in ~/.vimrc,
-- which is also sourced by .ideavimrc and .vscodevimrc. Neovim-only settings
-- go below the source line and override the shared base where they overlap.
vim.cmd.source(vim.fn.expand("~/.vimrc"))

local opt = vim.opt
opt.scrolloff = 5 -- override .vimrc's 10
