require("config.utils")

-- misc
nmap('<C-s>',   "<cmd>StripWhitespace<cr><cmd>:w<cr>", {}) -- ctrl S, strip whitespace & save
imap('<C-s>',   "<cmd>StripWhitespace<cr><cmd>:w<cr>", {}) -- ctrl S, strip whitespace & save
nmap('<C-q>',   "<cmd>:q<cr><cr>", {})                     -- ctrl Q, quit
nmap('<C-z>',   "<cmd>:u<cr>", {})                         -- ctrl Z, undo
imap('<C-z>',   "<cmd>:u<cr>", {})                         -- ctrl Z, undo
nmap('<C-S-z>', "<C-r>", {})                               -- ctrl shift Z, redo
imap('<C-S-z>', "<C-r>", {})                               -- ctrl shift Z, redo
nmap('<C-n>',   "<cmd>set nu!<cr>")
imap('<A-3>',   "#")                                       -- for macOS
vmap('<Tab>',   "<C->>gv")
vmap('<S-Tab>', "<C-<>gv")

-- window navigation
nmap('<c-h>', "<cmd>wincmd h<cr>", {})
nmap('<c-j>', "<cmd>wincmd j<cr>", {})
nmap('<c-k>', "<cmd>wincmd k<cr>", {})
nmap('<c-l>', "<cmd>wincmd l<cr>", {})
