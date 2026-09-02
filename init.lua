--=----------=--
--=---OPTS---=--
--=----------=--
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.o.undofile = true
vim.o.undodir = os.getenv("HOME") .. "/.config/nvim/.undodir"
vim.o.scrolloff = 1000
vim.o.number = true
vim.o.relativenumber = true
vim.o.clipboard = "unnamedplus"
vim.o.syntax = "on"
vim.o.autoindent = true
vim.o.cursorline = true
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.encoding = "UTF-8"
vim.o.ruler = true
vim.o.mouse = "a"
vim.o.title = true
vim.o.hidden = true
vim.o.ttimeoutlen = 0
vim.o.wildmenu = true
vim.o.showcmd = true
vim.o.showmatch = true
vim.o.inccommand = "split"
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.termguicolors = true
vim.o.winborder = "bold"

--=----------=--
--=---BIND---=--
--=----------=--
vim.keymap.set({'n', 'i'}, '<C-S-z>',   "<C-r>")               -- ctrl shift Z, redo
vim.keymap.set({'i'},      '<A-3>',     "#")                   -- for macOS
vim.keymap.set({'n'},      '<Esc>',     "<cmd>nohlsearch<cr>") -- clear search highlight on esc
vim.keymap.set({'n', 'i'}, '<C-s>',     "<cmd>:w<cr>")
vim.keymap.set({'n', 'v', 'i'}, '<F5>', "<cmd>:make<cr>")

-- buffers
vim.keymap.set({'n'},      '<A-1>', "<cmd>bp<cr>")
vim.keymap.set({'n'},      '<A-2>', "<cmd>bn<cr>")
vim.keymap.set({'n', 'v'}, '<A-w>', "<cmd>bd<cr>")

-- indent & unindent
vim.keymap.set({'v'}, '<Tab>',   "<C->>gv")
vim.keymap.set({'v'}, '<S-Tab>', "<C-<>gv")

-- window navigation
vim.keymap.set({'n', 't'}, '<c-h>', "<cmd>wincmd h<cr>")
vim.keymap.set({'n', 't'}, '<c-j>', "<cmd>wincmd j<cr>")
vim.keymap.set({'n', 't'}, '<c-k>', "<cmd>wincmd k<cr>")
vim.keymap.set({'n', 't'}, '<c-l>', "<cmd>wincmd l<cr>")

vim.keymap.set({'n', 'v'}, '<Leader>b', "<cmd>FzfLua buffers<cr>")
vim.keymap.set({'n', 'v'}, '<Leader>c', "<cmd>FzfLua colorschemes<cr>")
vim.keymap.set({'n', 'v'}, '<Leader>e', "<cmd>lua MiniFiles.open()<cr>")
vim.keymap.set({'n', 'v'}, '<Leader>f', "<cmd>FzfLua files<cr>")
vim.keymap.set({'n', 'v'}, '<Leader>o', "<cmd>FzfLua oldfiles<cr>")
vim.keymap.set({'n'},      '<Leader>g', "<cmd>FzfLua grep_live<cr>")
vim.keymap.set({'n', 'v'}, '<Leader>d', "<cmd>e %:p:h<cr>") -- change working dir to current file's

vim.lsp.enable('lua_ls')
vim.lsp.enable('cssls')
vim.lsp.enable('clangd')
vim.lsp.enable('gdscript')
vim.lsp.enable('gdshader')
vim.lsp.enable('ts_ls')

--=----------=--
--=-AUTOCMDS-=--
--=----------=--
vim.api.nvim_create_autocmd("FileType", {
  pattern = "gdshader",
  callback = function()
    vim.bo.commentstring = "// %s"
  end
})

vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function() vim.highlight.on_yank() end,
    desc = "Briefly highlight yanked text"
})

-- https://vi.stackexchange.com/questions/37421/how-to-remove-neovim-trailing-white-space
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = {"*"},
    callback = function()
      local save_cursor = vim.fn.getpos(".")
      pcall(function() vim.cmd [[%s/\s\+$//e]] end)
      vim.fn.setpos(".", save_cursor)
    end,
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    pattern = {".xresources"},
    callback = function()
      os.execute("xrdb ~/.xresources");
    end
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    pattern = {"dunstrc"},
    callback = function()
      os.execute("kill $(pidof dunst); dunst & disown; notify-send -i ~/pic/react/ragebait.png title body....");
    end
})

--=----------=--
--=---PLUG---=--
--=----------=--
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "ibhagwan/fzf-lua",
  },
  {
  "folke/which-key.nvim",
  },
  {
  "HoNamDuong/hybrid.nvim",
  },
  {
    "nvim-mini/mini.nvim",
    version = '*',
  },
  {
    "ellisonleao/gruvbox.nvim",
    opts = { transparent_mode = true, }
  },
  {
    "nvim-treesitter/nvim-treesitter",
    branch = 'master',
    lazy = false,
    build = ":TSUpdate"
  },
  {
    'gmr458/cold.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('cold').setup({ transparent_background = true })
      vim.cmd.colorscheme 'cold'
    end,
  },
  {
    "GustavEikaas/easy-dotnet.nvim",
    dependencies = { "nvim-lua/plenary.nvim", 'folke/snacks.nvim', },
    config = function()
      require("easy-dotnet").setup({
        lsp = {
          auto_refresh_codelens = false,
        }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "folke/lazydev.nvim",
      ft = "lua",
      opts = {
      	library = {
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        }
      },
    },
  },
  {
    "saghen/blink.cmp",
    version = "1.*",
    dependencies = { "rafamadriz/friendly-snippets" },
    opts = {
      keymap     = { preset = "default" },
      appearance = { nerd_font_variant = "mono" },
      completion = { documentation = { auto_show = false } },
      sources    = { default = { "lsp", "path", "snippets", "buffer" } },
      fuzzy      = { implementation = "lua" }
    },
    opts_extend = { "sources.default" }
  },
})

require('mini.indentscope').setup()
require('mini.icons').setup()
require('mini.jump').setup()
require('mini.statusline').setup()

require('mini.hipatterns').setup({
  highlighters = {
    -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
    fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
    hack  = { pattern = '%f[%w]()HACK()%f[%W]',  group = 'MiniHipatternsHack'  },
    todo  = { pattern = '%f[%w]()TODO()%f[%W]',  group = 'MiniHipatternsTodo'  },
    note  = { pattern = '%f[%w]()NOTE()%f[%W]',  group = 'MiniHipatternsNote'  },
    -- Highlight hex color strings (`#rrggbb`) using that color
    hex_color = require('mini.hipatterns').gen_highlighter.hex_color(),
  },
})

require('mini.files').setup({
  windows = {
    preview = true,
    width_preview = 60
  }
})

require('mini.cmdline').setup({
  delay = 5.0,
})

require("hybrid").setup({
  terminal_colors = true,
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = false,
    emphasis = true,
    comments = true,
    folds = true,
  },
  strikethrough = true,
  inverse = true,
  transparent = true,
})

vim.cmd [[colorscheme hybrid]]
