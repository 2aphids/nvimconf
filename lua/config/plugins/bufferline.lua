require("config.utils")

nmap('<A-1>', "<cmd>BufferLineGoToBuffer 1<cr>", {})
nmap('<A-2>', "<cmd>BufferLineGoToBuffer 2<cr>", {})
nmap('<A-3>', "<cmd>BufferLineGoToBuffer 3<cr>", {})
nmap('<A-4>', "<cmd>BufferLineGoToBuffer 4<cr>", {})
nmap('<A-5>', "<cmd>BufferLineGoToBuffer 5<cr>", {})
nmap('<A-6>', "<cmd>BufferLineGoToBuffer 6<cr>", {})
nmap('<A-7>', "<cmd>BufferLineGoToBuffer 7<cr>", {})
nmap('<A-8>', "<cmd>BufferLineGoToBuffer 8<cr>", {})
nmap('<A-9>', "<cmd>BufferLineGoToBuffer 9<cr>", {})
nmap('<A-0>', "<cmd>BufferLineGoToBuffer -1<cr>", {})
nmap('<A-l>', "<cmd>BufferLineCycleNext<cr>", {})
nmap('<A-h>', "<cmd>BufferLineCyclePrev<cr>", {})

nmap('<A-w>', "<cmd>BufferLineCycleNext<cr><cmd>bd #<cr>", {})

return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("bufferline").setup()
  end,
}
