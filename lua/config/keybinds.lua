require("config.utils")

-- misc
nmap('<C-q>',   "<cmd>:q<cr><cr>", {}) -- ctrl Q, quit
nmap('<C-z>',   "<cmd>:u<cr>", {})     -- ctrl Z, undo
imap('<C-z>',   "<cmd>:u<cr>", {})     -- ctrl Z, undo
nmap('<C-S-z>', "<C-r>", {})           -- ctrl shift Z, redo
imap('<C-S-z>', "<C-r>", {})           -- ctrl shift Z, redo
imap('<A-3>',   "#")                   -- for macOS
nmap('<Esc>',   "<cmd>nohlsearch<cr>") -- clear search highlight on esc
nmap('<C-s>',   "<cmd>:w<cr>", {})
imap('<C-s>',   "<cmd>:w<cr>", {})

-- buffers
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

nvmap('<A-w>', "<cmd>BufferLineCycleNext<cr><cmd>bd #<cr>", {})

-- indent & unindent
vmap('<Tab>',   "<C->>gv")
vmap('<S-Tab>', "<C-<>gv")

-- window navigation
ntmap('<c-h>', "<cmd>wincmd h<cr>", {})
ntmap('<c-j>', "<cmd>wincmd j<cr>", {})
ntmap('<c-k>', "<cmd>wincmd k<cr>", {})
ntmap('<c-l>', "<cmd>wincmd l<cr>", {})

-- terminal
nvmap('<Leader>t', "<cmd>ToggleTerm<cr>")

-- fzf
nvmap('<Leader>b', "<cmd>FzfLua buffers<cr>")
nvmap('<Leader>c', "<cmd>FzfLua colorschemes<cr>")
nvmap('<Leader>d', "<cmd>FzfLua oldfiles<cr>")
nvmap('<Leader>f', "<cmd>FzfLua files<cr>")
 nmap('<Leader>g', "<cmd>FzfLua grep<cr>")
 vmap('<Leader>g', "<cmd>FzfLua grep_visual<cr>")
nvmap('<Leader>z', "<cmd>FzfLua zoxide<cr>")
