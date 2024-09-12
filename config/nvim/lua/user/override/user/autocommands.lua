vim.cmd([[
  augroup _yaml_settings
    autocmd!
    autocmd FileType yaml :setlocal ts=2 sts=2 sw=2 expandtab
  augroup end
]])
vim.cmd([[
  augroup _behat_settings
    autocmd!
    autocmd FileType feature :setlocal sw=4 ts=4 sts=4
  augroup end
]])
vim.cmd([[
  augroup _custom_filetypes
    autocmd!
    autocmd BufNewFile,BufRead .env.* setf sh
  augroup end
]])

