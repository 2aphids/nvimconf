return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim"
  },
  opts = {
    close_if_last_window = true,
    window = {
      mappings = {
        ["l"] = "open",
        ["<C-e>"] = "close_window",
      },
    },
    event_handlers = {
      {
        event = "file_open_requested",
        handler = function()
          -- auto close
          -- vim.cmd("Neotree close")
          -- OR
          require("neo-tree.command").execute({ action = "close" })
        end
      },
    }
  },
}
