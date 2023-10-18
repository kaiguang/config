require "user.packer"
require "user.opt"
require "user.keymap"
require "user.colorscheme"
require "user.telescope"
require "user.treesitter"
require "user.lualine"
require "user.bufferline"
require "user.lsp"
require "user.null-ls"
require "user.cmp"
require "user.luasnip"
require "user.nvim-tree"
require "user.comment"

require("indent_blankline").setup {
    show_current_context = true,
}

-- Set cursor to vertical when leaving vim
vim.api.nvim_create_autocmd({"VimLeave"}, {
  pattern = {"*"},
  command = "set guicursor=a:ver100",
})
