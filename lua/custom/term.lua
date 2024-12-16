vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
  command = 'autocmd TermOpen * setlocal nonumber norelativenumber',
})
