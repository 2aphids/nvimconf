return {
    'lcroberts/persistent-colorscheme.nvim',
    lazy = false,
    priority = 1000, -- Plugin should be loaded early
    dependencies = {
        'RRethy/nvim-base16', -- Lots of baked-in themes and support to add more
        {
            -- 'folke/tokyonight.nvim',
            -- opts = {
            -- style = 'night',
            -- },
            { "ellisonleao/gruvbox.nvim"     },
            { "sainnhe/sonokai"              },
            { "catppuccin/nvim"              },
            { "danilo-augusto/vim-afterglow" },
        },
    },
    opts = {
        colorscheme = 'tokyonight',
    },
}
