require("config.utils")

nmap("<C-o>", "<cmd>Telescope find_files<cr>", {})

return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = "nvim-lua/plenary.nvim",
  config = function()
    require("telescope").setup {
      pickers = {
        find_files = {
          hidden = true,
        }
      },
      defaults = {
        mappings = {
          i = {
            ["<esc>"] = close,
            ["<C-o>"] = close,
          },
          n = {
            ["<esc>"] = close,
            ["<C-o>"] = close,
          }
        }
      }
    }
  end,
}
