-- Move cursor to other windows
vim.keymap.set('',  '<C-h>',           '<C-w>h')
vim.keymap.set('',  '<C-j>',           '<C-w>j')
vim.keymap.set('',  '<C-k>',           '<C-w>k')
vim.keymap.set('',  '<C-l>',           '<C-w>l')

vim.keymap.set('',  '<Space>t',        ':NvimTreeToggle<Enter>')
vim.keymap.set('',  '<Space>m',        ':Neoformat<Enter>')
vim.keymap.set('',  '<Space>g',        ':GitBlameToggle<Enter>')

vim.keymap.set('',  '<Space>f',        ':Telescope find_files<Enter>')
vim.keymap.set('',  '<Space>/',        ':Telescope live_grep<Enter>')

-- bufferline
vim.keymap.set('',  '˙',               ':BufferLineCyclePrev<Enter>') -- <Opt-h>
vim.keymap.set('',  '¬',               ':BufferLineCycleNext<Enter>') -- <Opt-l>
vim.keymap.set('',  '≤',               ':BufferLineMovePrev<Enter>')  -- <Opt-,>
vim.keymap.set('',  '≥',               ':BufferLineMoveNext<Enter>')  -- <Opt-.>
vim.keymap.set('',  '<Space>p',        ':BufferLinePick<Enter>')
vim.keymap.set('',  '<Space>c',        ':BufferLinePickClose<Enter>')
vim.keymap.set('',  '<Space>l',        ':BufferLineCloseLeft<Enter>')
vim.keymap.set('',  '<Space>r',        ':BufferLineCloseRight<Enter>')

-- LSP
vim.keymap.set('n',  'gd',             vim.lsp.buf.definition)
vim.keymap.set('n',  'gr',             vim.lsp.buf.references)
vim.keymap.set('n',  'gh',             vim.lsp.buf.hover)
vim.keymap.set('n',  'ga',             vim.lsp.buf.code_action)
vim.keymap.set('n',  '<Space><Enter>', vim.lsp.buf.rename)
vim.keymap.set('n',  'go',             vim.diagnostic.open_float)

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

-- Bind p in visual mode to paste without overriding the current register
vim.keymap.set('v', 'p', 'pgvy')
-- Alternatively you can put it in the black hole register
-- vim.keymap.set('v', 'p', '"_dP')

-- leap.nvim
-- Searching in all windows (including the current one) on the tab page.
vim.keymap.set('n', 's', function()
  require('leap').leap { target_windows = vim.tbl_filter(
    function (win) return vim.api.nvim_win_get_config(win).focusable end,
    vim.api.nvim_tabpage_list_wins(0)
  )}
end)
