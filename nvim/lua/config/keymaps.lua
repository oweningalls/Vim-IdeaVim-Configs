local map = vim.keymap.set

-- Move through windows with <C - {hjkl}>
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })
map("t", "<C-h>", "<C-\\><C-n><C-w>h")
map("t", "<C-j>", "<C-\\><C-n><C-w>j")
map("t", "<C-k>", "<C-\\><C-n><C-w>k")
map("t", "<C-l>", "<C-\\><C-n><C-w>l")
map("i", "<C-h>", "<Esc><C-w>h")
map("i", "<C-j>", "<Esc><C-w>j")
map("i", "<C-k>", "<Esc><C-w>k")
map("i", "<C-l>", "<Esc><C-w>l")


-- ESC to get out of terminal mode 
map("t", "<Esc>", "<C-\\><C-n>")


-- Recenter on large jumps
map("n", "{", "{zz")
map("n", "}", "}zz")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")


-- Resize various windows with crtl - arrow keys
map("n", "<C-Up>", "<cmd>resize +2<CR>")
map("n", "<C-Down>", "<cmd>resize -2<CR>")
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>")
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>")

-- ctrl-backspace deletes previous word
map("t", "<C-BS>", "<C-w>")
map("i", "<C-BS>", "<C-w>")


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

-- execute last macro with Q
map("n", "Q", "@@")

-- Make search regex function very magic by default (more like normal regex)
map("n", "/", function()
  return "/\\v"
end, { expr = true })
map("n", "?", function()
  return "?\\v"
end, { expr = true })


-- Remove random highlighting from n presses
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Center screen after search jumps; skip if the search register is empty
map("n", "n", function()
  if vim.fn.getreg("/"):gsub("\\v", "") == "" then
    return
  end
  local key = vim.v.searchforward == 1 and "n" or "N"
  vim.cmd("normal! " .. key .. "zzzv")
end)

map("n", "N", function()
  if vim.fn.getreg("/"):gsub("\\v", "") == "" then
    return
  end
  local key = vim.v.searchforward == 1 and "N" or "n"
  vim.cmd("normal! " .. key .. "zzzv")
end)
