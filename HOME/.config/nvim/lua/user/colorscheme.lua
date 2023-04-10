local colorscheme = "kanagawa"

local status_ok, _ = pcall(vim.cmd.colorscheme, colorscheme)
if not status_ok then
  print('Not able to load colorscheme', colorscheme)
  return
end
