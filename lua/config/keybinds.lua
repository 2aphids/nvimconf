function map(modes, cmd, opts)
  for i = 1, #modes do
    local ch = modes:sub(i,i)
    vim.keymap.set(ch, cmd, opts)
  end
end

-- misc
map('n', '<C-z>',   "<cmd>:u<cr>", {})     -- ctrl Z, undo
map('i', '<C-z>',   "<cmd>:u<cr>", {})     -- ctrl Z, undo
map('n', '<C-S-z>', "<C-r>", {})           -- ctrl shift Z, redo
map('i', '<C-S-z>', "<C-r>", {})           -- ctrl shift Z, redo
map('i', '<A-3>',   "#")                   -- for macOS
map('n', '<Esc>',   "<cmd>nohlsearch<cr>") -- clear search highlight on esc
map('n', '<C-s>',   "<cmd>:w<cr>", {})
map('i', '<C-s>',   "<cmd>:w<cr>", {})

-- file search
map('nv', '<Leader>e', "<cmd>Neotree toggle<cr>")
map('nv', '<Leader>y', "<cmd>Yazi<cr>")

-- buffers
map('n', '<A-1>', "<cmd>BufferLineGoToBuffer 1<cr>", {})
map('n', '<A-2>', "<cmd>BufferLineGoToBuffer 2<cr>", {})
map('n', '<A-3>', "<cmd>BufferLineGoToBuffer 3<cr>", {})
map('n', '<A-4>', "<cmd>BufferLineGoToBuffer 4<cr>", {})
map('n', '<A-5>', "<cmd>BufferLineGoToBuffer 5<cr>", {})
map('n', '<A-6>', "<cmd>BufferLineGoToBuffer 6<cr>", {})
map('n', '<A-7>', "<cmd>BufferLineGoToBuffer 7<cr>", {})
map('n', '<A-8>', "<cmd>BufferLineGoToBuffer 8<cr>", {})
map('n', '<A-9>', "<cmd>BufferLineGoToBuffer 9<cr>", {})
map('n', '<A-0>', "<cmd>BufferLineGoToBuffer -1<cr>", {})
map('n', '<A-l>', "<cmd>BufferLineCycleNext<cr>", {})
map('n', '<A-h>', "<cmd>BufferLineCyclePrev<cr>", {})

map('nv', '<A-w>', "<cmd>BufferLineCycleNext<cr><cmd>bd #<cr>", {})

-- indent & unindent
map('v', '<Tab>',   "<C->>gv")
map('v', '<S-Tab>', "<C-<>gv")

-- window navigation
map('nt', '<c-h>', "<cmd>wincmd h<cr>", {})
map('nt', '<c-j>', "<cmd>wincmd j<cr>", {})
map('nt', '<c-k>', "<cmd>wincmd k<cr>", {})
map('nt', '<c-l>', "<cmd>wincmd l<cr>", {})

-- terminal
map('nv', '<Leader>t', "<cmd>ToggleTerm<cr>")

-- fzf
map('nv', '<Leader>b',  "<cmd>FzfLua buffers<cr>")
map('nv', '<Leader>c',  "<cmd>FzfLua colorschemes<cr>")
map('nv', '<Leader>d',  "<cmd>FzfLua oldfiles<cr>")
map('nv', '<Leader>f',  "<cmd>FzfLua files<cr>")
map('n',  '<Leader>gr', "<cmd>FzfLua grep<cr>")
map('v',  '<Leader>g',  "<cmd>FzfLua grep_visual<cr>")
map('nv', '<Leader>gd', "<cmd>FzfLua git_diff<cr>")
map('nv', '<Leader>o',  "<cmd>FzfLua files<cr>")
map('nv', '<Leader>z',  "<cmd>FzfLua zoxide<cr>")
