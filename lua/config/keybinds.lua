require("config.utils")

-- misc
nmap('<C-s>',   "<cmd>StripWhitespace<cr><cmd>:w<cr>", {}) -- ctrl S, strip whitespace & save
nmap('<C-q>',   "<cmd>:q<cr><cr>", {})                     -- ctrl Q, quit
nmap('<C-n>',   "<cmd>set nu!<cr>")
imap('<A-3>',   "#")                                       -- for macOS
vmap('<Tab>',   "<C->>gv")
vmap('<S-Tab>', "<C-<>gv")

-- window navigation
nmap('<c-h>', "<cmd>wincmd h<cr>", {})
nmap('<c-j>', "<cmd>wincmd j<cr>", {})
nmap('<c-k>', "<cmd>wincmd k<cr>", {})
nmap('<c-l>', "<cmd>wincmd l<cr>", {})
