return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  config = function()
    local treesitter = require("nvim-treesitter.configs")

    treesitter.setup({
      sync_install = true,
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = false },
      ensure_installed = {
        "json",
        "javascript",
        "typescript",
        "tsx",
        "yaml",
        "html",
        "css",
        "markdown",
        "markdown_inline",
        "bash",
        "lua",
        "vim",
        "dockerfile",
        "gitignore",
        "c",
        "rust",
        "gdscript",
        "gdshader",
        "godot_resource",
        "glsl",
      },
    })
  end,
}
