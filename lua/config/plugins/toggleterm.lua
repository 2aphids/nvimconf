require("config.utils")

nmap('<C-/>', "<cmd>ToggleTerm<cr>")
imap('<C-/>', "<cmd>ToggleTerm<cr>")
vmap('<C-/>', "<cmd>ToggleTerm<cr>")

return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup {
      direction = "float",
    }
  end
}
