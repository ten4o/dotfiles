" VIM Configuration File
" Description: Optimized for C/C++ development, but useful also for other things.
" Author: Gerhard Gappmeier
"

" Auto close brackets, braces etc
ino " ""<left>
ino ' ''<left>
ino ( ()<left>
ino ) ()<left>
ino [ []<left>
ino { {}<left>
ino {<CR> {<CR>}<ESC>O
ino #in #include <><Left>
ino #d #define<Space>

set scrolloff=5
" auto save file
set autowrite
" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
" disable vi compatibility (emulation of old bugs)
set nocompatible
" use indentation of previous line
set autoindent
" use intelligent indentation for C
set smartindent
" configure tabwidth and insert spaces instead of tabs
set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
set noexpandtab        " don't expand tabs to spaces
" wrap lines at 120 chars. 80 is somewaht antiquated with nowadays displays.
set textwidth=120
" set vertical ruler
set colorcolumn=121
highlight ColorColumn ctermbg=9 guibg=red
" turn search highlighting on
se hlsearch
" show trailing spaces
se list
se listchars=trail:-,tab:\ \ 
" turn syntax highlighting on
set t_Co=256
syntax on
" colorscheme wombat256
" turn line numbers on
set number
" highlight matching braces
set showmatch
" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */

" Install OmniCppComplete like described on http://vim.wikia.com/wiki/C++_code_completion
" This offers intelligent C++ completion when typing ‘.’ ‘->’ or <C-o>
" Load standard tag files
set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/gl
set tags+=~/.vim/tags/sdl
set tags+=~/.vim/tags/qt4


" Enhanced keyboard mappings
"
" in normal mode F2 will save the file
nmap <F2> :w<CR>
" in insert mode F2 will exit insert, save, enters insert again
imap <F2> <ESC>:w<CR>i
" goto definition with F3
map <F3> <C-]>
" switch between header/source with F4
map <F4> :vs %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
" recreate tags file with F5
map <F5> :!ctags -R –c++-kinds=+p –fields=+iaS –extra=+q .<CR>
" build using make with <F7>
map <F7> :make<CR>
" build using makeprg with <S-F7>
map <S-F7> :make clean all<CR>
" space = page down
nmap <Space> <PageDown>
" cc for command prompt
nnoremap cc :
" yank to clipboard
map Y "+y

" in diff mode we use the spell check keys for merging
if &diff
  " diff settings
  map <M-Down> ]c
  map <M-Up> [c
  map <M-Left> do
  map <M-Right> dp
  map <F9> :new<CR>:read !svn diff<CR>:set syntax=diff buftype=nofile<CR>gg
else
  " spell settings
  :setlocal spell spelllang=en
  " set the spellfile - folders must exist
  set spellfile=~/.vim/spellfile.add
  map <M-Down> ]s
  map <M-Up> [s
endif

" ASM files
autocmd FileType asm setlocal shiftwidth=8 tabstop=8

" text files
autocmd FileType txt setlocal nowrap textwidth=0
autocmd FileType text setlocal nowrap textwidth=0

" Zig files
autocmd FileType zig setlocal expandtab

if has("gui_running")
	  set guifont=Inconsolata\ Medium\ 16
endif

set nospell

