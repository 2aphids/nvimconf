vim.lsp.enable({
  "gdscript",
  "gdshader"
})

local capabilities = require('blink.cmp').get_lsp_capabilities()
require("lspconfig").gdscript.setup(capabilities);

if vim.fn.filereadable(vim.fn.getcwd() .. "/project.godot") == 1 then
  local addr = "./godot.pipe"
  vim.fn.serverstart(addr);
end
