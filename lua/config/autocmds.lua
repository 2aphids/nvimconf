vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function() vim.highlight.on_yank() end,
    desc = "Briefly highlight yanked text"
})

-- https://vi.stackexchange.com/questions/37421/how-to-remove-neovim-trailing-white-space
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = {"*"},
    callback = function()
      local save_cursor = vim.fn.getpos(".")
      pcall(function() vim.cmd [[%s/\s\+$//e]] end)
      vim.fn.setpos(".", save_cursor)
    end,
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = {".xresources"},
    command = "ColorizerAttachToBuffer"
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    pattern = {".xresources"},
    callback = function()
      os.execute("xrdb ~/.xresources");
    end
})
