function imap(lhs, rhs, opts)
  vim.keymap.set("i", lhs, rhs, opts)
  tmap(lhs, rhs, opts)
end

function nmap(lhs, rhs, opts)
  vim.keymap.set("n", lhs, rhs, opts)
  tmap(lhs, rhs, opts)
end

function vmap(lhs, rhs, opts)
	vim.keymap.set("v", lhs, rhs, opts)
  tmap(lhs, rhs, opts)
end

function tmap(lhs, rhs, opts)
	vim.keymap.set("t", lhs, rhs, opts)
end
