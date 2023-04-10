-- Options
vim.opt.backup = false            -- creates a backup file
vim.opt.breakindent = true        -- Every wrapped line will continue visually indented (same amount of space as the beginning of that line).
vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.opt.cursorline = true         -- highlight the current line
vim.opt.expandtab = true          -- convert tabs to spaces
vim.opt.fileencoding = "utf-8"    -- the encoding written to a file
vim.opt.ignorecase = true         -- ignore case in search patterns
vim.opt.linebreak = true          -- companion to wrap, don't split words
vim.opt.mouse = "a"               -- allow the mouse to be used in neovim
vim.opt.number = true             -- set numbered lines
vim.opt.scrolloff = 8             -- minimal number of screen lines to keep above and below the cursor
vim.opt.shiftwidth = 0            -- the number of spaces inserted for each indentation, when set to 0 it is the "tabstop" value
vim.opt.showmode = false          -- we don't need to see things like                                                                         -- INSERT -- anymore
vim.opt.showtabline = 2           -- always show tabs
vim.opt.sidescrolloff = 8         -- minimal number of screen columns either side of cursor if wrap is `false`
vim.opt.signcolumn = "yes"        -- Alaways show the signcolumn
vim.opt.smartcase = true          -- smart case
vim.opt.smartindent = true        -- make indenting smarter again
vim.opt.softtabstop = -1          -- When "sts" is negative, the value of "shiftwidth" is used.
vim.opt.splitbelow = true         -- force all horizontal splits to go below current window
vim.opt.splitright = true         -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false          -- creates a swapfile
vim.opt.tabstop = 2               -- insert 2 spaces for a tab
vim.opt.termguicolors = true      -- set term gui colors (most terminals support this)
vim.opt.undofile = true           -- enable persistent undo

-- Diable netrw to use nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- git-blame
vim.g.gitblame_enabled = 0                      -- Disable on start-up
vim.g.gitblame_date_format = "%Y-%m-%d %X (%a)" -- Custom date format

-- Add icons to the signcolumn
vim.fn.sign_define("DiagnosticSignError",  { text = "",  texthl = "DiagnosticSignError",  numhl = "DiagnosticSignError"  })
vim.fn.sign_define("DiagnosticSignWarn",   { text = "",  texthl = "DiagnosticSignWarn",   numhl = "DiagnosticSignWarn"  })
vim.fn.sign_define("DiagnosticSignHint",   { text = "",  texthl = "DiagnosticSignHint",   numhl = "DiagnosticSignHint"  })
vim.fn.sign_define("DiagnosticSignInfo",   { text = "",  texthl = "DiagnosticSignInfo",   numhl = "DiagnosticSignInfo"  })

-- Diagnostic config
vim.diagnostic.config({
  virtual_text = false,
  float = {
    border = "rounded",
    source = "always",
  },
})
