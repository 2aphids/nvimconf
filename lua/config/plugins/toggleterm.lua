require("config.utils")

return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup{
      hide_numbers = true,
      autochdir = true
    }
  end
}
