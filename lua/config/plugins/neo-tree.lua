require("config.utils")

nmap('<C-e>', "<cmd>Neotree<cr>", {})

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
  },
}
