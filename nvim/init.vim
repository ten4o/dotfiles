call plug#begin()


" Distraction-free writing in Vim
" Plug 'junegunn/goyo.vim'

" Coc is an intellisense engine for vim8 & neovim
" Use release branch
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Or latest tag
"Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}

" This plugin is mainly used for locating files, buffers, mrus, ctags, gtags, etc. in large project.
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

" status line
Plug 'vim-airline/vim-airline'

call plug#end()

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
source ~/.config/nvim/coc.vim
let g:Lf_DefaultExternalTool='ag'

" Fix Coc Sign colors
hi CocErrorSign ctermbg=Red ctermfg=White
nnoremap <C-p> :Leaderf file<CR>

" find word under cursor
noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>")) <CR><CR>

" Coc Explorer
nmap <C-n> :CocCommand explorer<CR>

" Exit a terminal tab with <Esc>
tnoremap <Esc> <C-\><C-n>gt

" switch between header/source with F4
" CoC/clangd way
nmap <F4> :execute 'tabnew' CocRequest('clangd', 'textDocument/switchSourceHeader', {'uri': 'file://'.expand("%:p")})<CR>
nmap gh :execute 'tabnew' CocRequest('clangd', 'textDocument/switchSourceHeader', {'uri': 'file://'.expand("%:p")})<CR>

