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


-- Resize various windows with crtl - arrow keys
map("n", "<C-Up>", "<cmd>resize +2<CR>")
map("n", "<C-Down>", "<cmd>resize -2<CR>")
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>")
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>")

-- ctrl-backspace deletes previous word
map("t", "<C-BS>", "<C-w>")
map("i", "<C-BS>", "<C-w>")