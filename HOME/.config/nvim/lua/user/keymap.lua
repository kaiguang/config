vim.keymap.set('', '<C-h>', '<C-w>h')
vim.keymap.set('', '<C-j>', '<C-w>j')
vim.keymap.set('', '<C-k>', '<C-w>k')
vim.keymap.set('', '<C-l>', '<C-w>l')

vim.keymap.set('', '˙', ':vertical resize -2<Enter>') -- <Opt-h>
vim.keymap.set('', '∆', ':resize -2<Enter>')          -- <Opt-j>
vim.keymap.set('', '˚', ':resize +2<Enter>')          -- <Opt-k>
vim.keymap.set('', '¬', ':vertical resize +2<Enter>') -- <Opt-l>

vim.keymap.set('', '<Space>t', ':NvimTreeToggle<Enter>')

vim.keymap.set('', '<Space>f', ':Telescope find_files<Enter>')
vim.keymap.set('', '<Space>g', ':Telescope git_files<Enter>')
vim.keymap.set('', '<Space>/', ':Telescope live_grep<Enter>')

-- bufferline
vim.keymap.set('',  '<C-,>',     ':BufferLineCyclePrev<Enter>')
vim.keymap.set('',  '<C-.>',     ':BufferLineCycleNext<Enter>')
vim.keymap.set('',  '≤',         ':BufferLineMovePrev<Enter>') -- <Opt-,>
vim.keymap.set('',  '≥',         ':BufferLineMoveNext<Enter>') -- <Opt-.>
vim.keymap.set('',  '<C-p>',     ':BufferLinePick<Enter>')
vim.keymap.set('',  '<C-c>',     ':BufferLinePickClose<Enter>')
vim.keymap.set('',  '<Space>l',  ':BufferLineCloseLeft<Enter>')
vim.keymap.set('',  '<Space>r',  ':BufferLineCloseRight<Enter>')

-- LSP
vim.keymap.set('',  ',h',        vim.lsp.buf.hover)
vim.keymap.set('',  ',d',        vim.lsp.buf.definition)
vim.keymap.set('',  ',c',        vim.lsp.buf.code_action)
vim.keymap.set('',  ',e',        vim.lsp.buf.declaration)
vim.keymap.set('',  ',r',        vim.lsp.buf.references)
vim.keymap.set('',  ',<Enter>',  vim.lsp.buf.rename)
vim.keymap.set('',  ',i',        vim.lsp.buf.implementation)
vim.keymap.set('',  ',o',        vim.diagnostic.open_float)
vim.keymap.set('',  ',f',        vim.lsp.buf.format)

vim.keymap.set('',  ',w',        ':w<Enter>')
vim.keymap.set('',  ',q',        ':q<Enter>')

-- Keymaps for treesitter incremental selection are defined in the treesitter.lua file.
-- init_selection = "<Down>",
-- node_incremental = "<Right>",
-- scope_incremental = "<Up>",
-- node_decremental = "<Left>",
