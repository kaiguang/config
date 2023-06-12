-- Move cursor to other windows
vim.keymap.set('',  '<C-h>',           '<C-w>h')
vim.keymap.set('',  '<C-j>',           '<C-w>j')
vim.keymap.set('',  '<C-k>',           '<C-w>k')
vim.keymap.set('',  '<C-l>',           '<C-w>l')

-- Resize windows
vim.keymap.set('',  '˙',               ':vertical resize -2<Enter>') -- <Opt-h>
vim.keymap.set('',  '∆',               ':resize -2<Enter>')          -- <Opt-j>
vim.keymap.set('',  '˚',               ':resize +2<Enter>')          -- <Opt-k>
vim.keymap.set('',  '¬',               ':vertical resize +2<Enter>') -- <Opt-l>

vim.keymap.set('',  '<Space>t',        ':NvimTreeToggle<Enter>')
vim.keymap.set('',  '<Space>m',        ':Neoformat<Enter>')
vim.keymap.set('',  '<Space>g',        ':GitBlameToggle<Enter>')

vim.keymap.set('',  '<Space>f',        ':Telescope find_files<Enter>')
vim.keymap.set('',  '<Space>/',        ':Telescope live_grep<Enter>')

-- bufferline
vim.keymap.set('',  '<M-Left>',        ':BufferLineCyclePrev<Enter>')
vim.keymap.set('',  '<M-Right>',       ':BufferLineCycleNext<Enter>')
vim.keymap.set('',  '≤',               ':BufferLineMovePrev<Enter>') -- <Opt-,>
vim.keymap.set('',  '≥',               ':BufferLineMoveNext<Enter>') -- <Opt-.>
vim.keymap.set('',  '<Space>p',        ':BufferLinePick<Enter>')
vim.keymap.set('',  '<Space>c',        ':BufferLinePickClose<Enter>')
vim.keymap.set('',  '<Space>l',        ':BufferLineCloseLeft<Enter>')
vim.keymap.set('',  '<Space>r',        ':BufferLineCloseRight<Enter>')

-- LSP
vim.keymap.set('',  '<Space>h',        vim.lsp.buf.hover)
vim.keymap.set('',  '<Space>d',        vim.lsp.buf.definition)
vim.keymap.set('',  '<Space>a',        vim.lsp.buf.code_action)
vim.keymap.set('',  '<Space>n',        vim.lsp.buf.declaration)
vim.keymap.set('',  '<Space>e',        vim.lsp.buf.references)
vim.keymap.set('',  '<Space><Enter>',  vim.lsp.buf.rename)
vim.keymap.set('',  '<Space>i',        vim.lsp.buf.implementation)
vim.keymap.set('',  '<Space>o',        vim.diagnostic.open_float)

-- Diffview
vim.keymap.set('',  '<Space>v',        ':DiffviewOpen<Enter>')
vim.keymap.set('',  '<Space>b',        ':DiffviewClose<Enter>')

vim.keymap.set('',  '<Space>w',        ':w<Enter>')
vim.keymap.set('',  '<Space>q',        ':q<Enter>')

-- Use treesitter to fold
vim.keymap.set('', '<Space>z', function()
  vim.opt.foldmethod = 'expr'
  vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
end)

-- Keymaps for treesitter incremental selection are defined in the treesitter.lua file.
-- init_selection = "<Down>",
-- node_incremental = "<Right>",
-- scope_incremental = "<Up>",
-- node_decremental = "<Left>",

-- Clear search highlight when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', ':nohls<Enter>')

-- leap.nvim
-- Searching in all windows (including the current one) on the tab page.
vim.keymap.set('n', 's', function()
  require('leap').leap { target_windows = vim.tbl_filter(
    function (win) return vim.api.nvim_win_get_config(win).focusable end,
    vim.api.nvim_tabpage_list_wins(0)
  )}
end)
