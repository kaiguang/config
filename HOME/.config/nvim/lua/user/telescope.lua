require('telescope').setup{
  defaults = {
    scroll_strategy = "limit",
  },
  pickers = {
    find_files = {
      hidden = true,
    },
    live_grep = {
      additional_args = function()
        return {'--hidden'}
      end
    }
  }
}
