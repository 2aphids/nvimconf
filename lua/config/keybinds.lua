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

-- indent & unindent
vmap('<Tab>',   "<C->>gv")
vmap('<S-Tab>', "<C-<>gv")

-- window navigation
nmap('<c-h>', "<cmd>wincmd h<cr>", {})
nmap('<c-j>', "<cmd>wincmd j<cr>", {})
nmap('<c-k>', "<cmd>wincmd k<cr>", {})
nmap('<c-l>', "<cmd>wincmd l<cr>", {})
