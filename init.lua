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
-- vim.o.wildmenu = true
vim.o.showcmd = true
vim.o.showmatch = true
vim.o.inccommand = "split"
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.termguicolors = true
vim.o.winborder = "bold"

function get_child_notes()
  require'fzf-lua'.fzf_exec("get_child_notes.sh '"..vim.fs.basename(vim.api.nvim_buf_get_name(0)).."'", {
      actions = {
        ['default'] = require'fzf-lua'.actions.file_edit
      }
  })
end

-- misc
vim.keymap.set({"n", "i"}, '<C-z>',     "<cmd>:u<cr>")           -- ctrl Z, undo
vim.keymap.set({'n', 'i'}, '<C-S-z>',   "<C-r>")               -- ctrl shift Z, redo
vim.keymap.set({'i'},      '<A-3>',     "#")                   -- for macOS
vim.keymap.set({'n'},      '<Esc>',     "<cmd>nohlsearch<cr>") -- clear search highlight on esc
vim.keymap.set({'n', 'i'}, '<C-s>',     "<cmd>:w<cr>")
vim.keymap.set({'n', 'i'}, '<Leader>h', get_child_notes)

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

-- fzf
vim.keymap.set({'n', 'v'}, '<Leader>b', "<cmd>FzfLua buffers<cr>")
vim.keymap.set({'n', 'v'}, '<Leader>c', "<cmd>FzfLua colorschemes<cr>")
vim.keymap.set({'n', 'v'}, '<Leader>e', "<cmd>Neotree toggle reveal float<cr>")
vim.keymap.set({'n', 'v'}, '<Leader>f', "<cmd>FzfLua files<cr>")
vim.keymap.set({'n', 'v'}, '<Leader>o', "<cmd>FzfLua oldfiles<cr>")
vim.keymap.set({'n'},      '<Leader>g', "<cmd>FzfLua grep<cr>")
vim.keymap.set({'v'},      '<Leader>g', "<cmd>FzfLua grep_visual<cr>")
vim.keymap.set({'n', 'v'}, '<Leader>d', "<cmd>FzfLua git_diff<cr>")
vim.keymap.set({'n', 'v'}, '<Leader>z', "<cmd>FzfLua zoxide<cr>")

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

vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = {".xresources"},
    command = "ColorizerAttachToBuffer"
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
  "norcalli/nvim-colorizer.lua",
  "folke/which-key.nvim",
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }
  },
  {
    "ellisonleao/gruvbox.nvim",
    opts = { transparent_mode = true, }
  },
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      winopts = {
        fullscreen = true,
        border = "solid",
        preview = {
          hidden = true
        }
      },
      files = {
        prompt = "Files",
        file_icons = false
      },
      oldfiles = {
        prompt = "Files",
        file_icons = false
      }
    }
  },
  {
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
            require("neo-tree.command").execute({ action = "close" })
          end
        },
      }
    },
  }
})

require('colorizer').setup()

require('lualine').setup {
  options = { section_separators = '', component_separators = '' },
  sections = {
    lualine_a =
    {
      'mode',
      {
        'buffers',
        show_filename_only = false,
        mode = 3
      }
    },
    lualine_b = {'diff', 'diagnostics'},
    lualine_c = {
      'filename',
    },

    lualine_x = {'fileformat'},
    lualine_y = {},
    lualine_z = {'location'}
  },
}

vim.cmd [[colorscheme gruvbox]]
