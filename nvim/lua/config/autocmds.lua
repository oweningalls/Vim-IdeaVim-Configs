local map = vim.keymap.set
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

vim.api.nvim_create_autocmd("CmdlineLeave", {
  callback = function()
    local cmdtype = vim.fn.getcmdtype()
    if (cmdtype == "/" or cmdtype == "?") and vim.v.event.abort then
      vim.fn.setreg("/", "")
      vim.cmd("nohlsearch")
    end
  end,
})

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argc() > 0 then
      require("nvim-tree.api").tree.open()
      require("toggleterm").toggle()
      vim.cmd("wincmd p") -- return focus to the main editor window, not the tree/terminal
    end
  end,
})



vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
	callback = function()
		if vim.bo.modified and not vim.bo.readonly and vim.bo.buftype == "" and vim.fn.expand ("%") ~= "" then
			vim.cmd("silent! write")
		end
	end,
})
