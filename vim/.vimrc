scriptencoding utf-8
set fileencoding=utf-8
set encoding=utf-8

" warp long lines
set wrap

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","

nmap <leader>w :w!<cr>
map <Leader>e :e <C-R>=escape(expand("%:p:h"),' ') . '/'<CR>

" Set 7 lines to the cursor - when moving vertically using j/k
set so=5

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

set nu
" set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<
set list
map <F7> mzgg=G`z
highlight NonText ctermfg=8 guifg=gray
highlight SpecialKey ctermfg=8

command! Q q " Bind :Q to :q
command! Qall qall
command! QA qall
command! E e
command! W w
command! Wq wq

set laststatus=2
set lazyredraw " Don't redraw screen when running macros.
highlight StatusLine ctermfg=darkgrey ctermbg=yellow

set shiftround
au BufNewFile,BufRead *.txt setlocal nolist

nmap k gk
nmap j gj

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

hi MatchParen cterm=none ctermbg=black ctermfg=yellow
