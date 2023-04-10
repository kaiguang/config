require("mason").setup()
require("mason-lspconfig").setup()

local lspconfig = require('lspconfig')

lspconfig.bashls.setup{}
lspconfig.cssls.setup{}
lspconfig.html.setup{}
lspconfig.jsonls.setup{}
lspconfig.lua_ls.setup{
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" }
      },
    }
  }
}
lspconfig.pyright.setup{}
lspconfig.tailwindcss.setup{}
lspconfig.tsserver.setup{}
lspconfig.yamlls.setup{}

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

