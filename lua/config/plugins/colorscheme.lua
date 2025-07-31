return {
    'lcroberts/persistent-colorscheme.nvim',
    lazy = false,
    priority = 1000, -- Plugin should be loaded early
    dependencies = {
        {
            'folke/tokyonight.nvim',
            opts = {
              transparent = true,
            },
            {
              "ellisonleao/gruvbox.nvim",
              opts = {
                transparent_mode = true,
              }
            },
            {
              "catppuccin/nvim",
              name = "catppuccin",
              opts = {
                transparent_background = true,
              }
            },
        },
    },
    opts = {
        colorscheme = 'tokyonight',
    },
}
