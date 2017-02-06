scriptencoding utf-8
set fileencoding=utf-8
set encoding=utf-8

set nocompatible              " be iMproved, required
filetype plugin on

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

Plugin 'VundleVim/Vundle.vim'
Plugin 'nvie/vim-flake8'
"Plugin 'Lokaltog/vim-powerline'
Plugin 'powerline/powerline'
Plugin 'syngan/vim-vimlint'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-pathogen'
Plugin 'vim-scripts/DoxygenToolkit.vim'
"Plugin 'bbchung/clighter'
Plugin 'wakatime/vim-wakatime'
Plugin 'vim-latex/vim-latex'
Plugin 'tmhedberg/SimpylFold'

call vundle#end()            " required
filetype plugin indent on    " required

execute pathogen#infect()
syntax on
filetype plugin indent on

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"

let g:SimpylFold_fold_import = 1

" Set to auto read when a file is changed from the outside
set autoread

let mapleader = ","

nmap <leader>w :w!<cr>
nmap <Leader>e :e <C-R>=escape(expand("%:p:h"),' ') . '/'<CR>

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7
"
" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase
"
" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
"let &colorcolumn=join(range(81,999),",")
"let &colorcolumn="80,".join(range(400,999),",")

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

set nu
" set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<
set list
" reindent file
" map <Leader>f mzgg=G`z
map <Leader>f mzgggqG`z
map <Leader>l :SyntasticToggleMode<CR>
autocmd FileType c map <Leader>c :SyntasticCheck<CR>
autocmd FileType python map <Leader>c :call Flake8()<CR>

map <Leader>d :Dox<CR>

" fix Capitalize errors
command! Q q " Bind :Q to :q
command! Qall qall
command! QA qall
command! E e
command! W w
command! Wq wq

set laststatus=2
set lazyredraw " Don't redraw screen when running macros.

highlight StatusLine ctermfg=darkgrey ctermbg=lightRed
highlight NonText ctermfg=8 guifg=gray
highlight SpecialKey ctermfg=8

" search highlighting
highlight MatchParen ctermbg=LightRed ctermfg=LightRed
highlight Search ctermfg=yellow ctermbg=darkblue cterm=NONE
" hi Search guibg=LightBlue

set shiftround
au BufNewFile,BufRead *.txt setlocal nolist

" move in warped lines
nmap k gk
nmap j gj

" rename current file
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <Leader>n :call RenameFile()<cr>

" move accross splits with CTRL+hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Split window vertically
nmap <leader>v <C-w>v<C-w>l
" Split window horizontally
nmap <leader>s <C-w>s<C-w>j

" save as root
cmap w!! %!sudo tee > /dev/null %

" clear last search
noremap <silent><Leader>/ :nohls<CR>

" reload vimrc after save
au BufWritePost .vimrc so ~/.vimrc

" disable arrow keys
inoremap <Left>  <NOP>
inoremap <Right> <NOP>
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
nnoremap <Left>  <NOP>
nnoremap <Right> <NOP>
nnoremap <Up>    <NOP>
nnoremap <Down>  <NOP>

" better indetion
vnoremap < <gv
vnoremap > >gv
"
" run linter after saving .py file
" autocmd BufWritePost *.py call Flake8()
" autocmd BufNewFile,BufRead *.cpp set formatprg=astyle\ -T4pb
autocmd BufNewFile,BufRead *.c set formatprg=astyle\ -s4pHk3jA10

"refactoring
"local
nnoremap gr gd[{V%::s/<C-R>///gc<left><left><left>
"global
nnoremap gR gD:%s/<C-R>///gc<left><left><left>
" for hex editing
augroup Binary
    au!
    au BufReadPre  *.bin let &bin=1
    au BufReadPost *.bin if &bin | %!xxd
    au BufReadPost *.bin set ft=xxd | endif
    au BufWritePre *.bin if &bin | %!xxd -r
    au BufWritePre *.bin endif
    au BufWritePost *.bin if &bin | %!xxd
    au BufWritePost *.bin set nomod | endif
augroup END

"
"set foldmethod=expr foldexpr=getline(v:lnum)=~'^\s*'.&commentstring[0]
"autocmd FileType c setlocal foldmethod=expr foldexpr=getline(v:lnum)=~'^\s*//'
"autocmd FileType python setlocal foldmethod=expr foldexpr=getline(v:lnum)=~'^\s*#'

"augroup vimrc
"    au BufReadPre * setlocal foldmethod=indent
"    au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
"augroup END
set foldmethod=syntax
set clipboard=unnamed

"let g:clighter_autostart = 1
"let g:clighter_libclang_file = '/usr/lib/libclang.so'
"nmap <silent> <Leader>r :call clighter#Rename()<CR>
set textwidth=0 wrapmargin=0
set modeline
set modelines=5
