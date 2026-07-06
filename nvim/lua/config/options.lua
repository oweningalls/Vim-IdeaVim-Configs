vim.g.mapleader = " "

local opt = vim.opt
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true
opt.visualbell = true
opt.scrolloff = 10

opt.clipboard = "unnamedplus"
opt.relativenumber = true
opt.number = true

local map = vim.keymap.set

-- Delete/change/cut into the void register so it never clobbers your last yank
map("n", "d", '"_d')
map("v", "d", '"_d')
map("n", "x", '"_x')
map("v", "x", '"_x')
map("n", "c", '"_c')
map("v", "c", '"_c')
map("n", "C", '"_C')
map("n", "D", '"_D')

-- Y copies to end of line instead of the whole line
map("n", "Y", "y$")
map("v", "Y", "y$")

-- Explicit opt-in: <leader>d/c/D put deleted text on the system clipboard
map("n", "<leader>d", '"+d')
map("v", "<leader>d", '"+d')
map("n", "<leader>c", '"+c')
map("v", "<leader>c", '"+c')
map("n", "<leader>D", '"+D')

-- jk or kj to get out of insert mode 
map("i", "jk", "<Esc>")
map("i", "kj", "<Esc>")

-- Remove arrow keys to encourage hjkl
map("n", "<up>", "<NOP>")
map("n", "<down>", "<NOP>")
map("n", "<left>", "<NOP>")
map("n", "<right>", "<NOP>")
map("v", "<up>", "<NOP>")
map("v", "<down>", "<NOP>")
map("v", "<left>", "<NOP>")
map("v", "<right>", "<NOP>")
map("i", "<up>", "<NOP>")
map("i", "<down>", "<NOP>")
map("i", "<left>", "<NOP>")
map("i", "<right>", "<NOP>")

-- * to search currently selected text
map("v", "*", '"ty/<C-r>t<CR>N')

-- H goes to beginning of line
map("n", "H", "^")
-- L goes to end of line
map("n", "L", "$")

-- J and K to move up and down half a page
map("n", "K", "<C-u>")
map("n", "J", "<C-d>")

-- execute last macro with Q
map("n", "Q", "@@")

-- Make search regex function very magic by default (more like normal regex)
map("n", "/", function()
  return "/\\v"
end, { expr = true })
map("n", "?", function()
  return "?\\v"
end, { expr = true })



-- Whenever entering terminal window enter insert mode
vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter" }, {
  callback = function()
    if vim.bo.buftype == "terminal" then
      vim.defer_fn(function()
        vim.cmd("startinsert")
      end, 10)
    end
  end,
})

-- Remove random highlighting from n presses
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

map("n", "n", function()
  if vim.fn.getreg("/"):gsub("\\v", "") == "" then
    return
  end
  vim.cmd("normal! nzzzv")
end)

map("n", "n", function()
  if vim.fn.getreg("/"):gsub("\\v", "") == "" then
    return
  end
  vim.cmd("normal! nzzzv")
end)

vim.api.nvim_create_autocmd("CmdlineLeave", {
  callback = function()
    local cmdtype = vim.fn.getcmdtype()
    if (cmdtype == "/" or cmdtype == "?") and vim.v.event.abort then
      vim.fn.setreg("/", "")
      vim.cmd("nohlsearch")
    end
  end,
})