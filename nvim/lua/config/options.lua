vim.g.mapleader = " "

local opt = vim.opt
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true
opt.visualbell = true
opt.scrolloff = 5

opt.clipboard = "unnamedplus"
opt.relativenumber = true
opt.number = true

local map = vim.keymap.set

