vim.cmd [[
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR> 
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200}) 
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
  augroup end

  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap spell
  augroup end

  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap spell
  augroup end

  augroup _asm
    autocmd!
    autocmd FileType asm setlocal tabstop=8 shiftwidth=8
  augroup end

  augroup _zig
    autocmd!
    autocmd FileType zig setlocal expandtab
  augroup end

  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd = 
  augroup end

]]

