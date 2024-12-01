require("config.utils")

nmap("<C-o>", "<cmd>Telescope find_files<cr>", {})

return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = "nvim-lua/plenary.nvim",
  config = function()
    require("telescope").setup {
      defaults = {
        mappings = {
          i = {
            ["<esc>"] = close,
          },
          n = {
            ["<esc>"] = close,
          }
        }
      }
    }
  end,
}
