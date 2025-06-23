require("config.utils")

nmap('<Leader>t', "<cmd>ToggleTerm<cr>")
imap('<Leader>t', "<cmd>ToggleTerm<cr>")
vmap('<Leader>t', "<cmd>ToggleTerm<cr>")

return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup()
  end
}
