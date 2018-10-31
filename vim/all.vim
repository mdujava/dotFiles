scriptencoding utf-8
set fileencoding=utf-8
set encoding=utf-8

execute pathogen#infect()
syntax on
filetype plugin indent on

" Set to auto read when a file is changed from the outside
set autoread

" Set 5 lines to the cursor - when moving vertically using j/k
set so=5
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

"au BufNewFile,BufRead *.txt setlocal OverLength /\%121v.\+/
"let &colorcolumn=join(range(81,999),",")
"let &colorcolumn="80,".join(range(400,999),",")

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

set nu
" set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<
set list

autocmd FileType c map <Leader>c :SyntasticCheck<CR>
autocmd FileType python map <Leader>c :call Flake8()<CR>

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

" reload vimrc after save
au BufWritePost .vimrc so ~/.vimrc

"
" run linter after saving .py file
" autocmd BufWritePost *.py call Flake8()
" autocmd BufNewFile,BufRead *.cpp set formatprg=astyle\ -T4pb
autocmd BufNewFile,BufRead *.c set formatprg=astyle\ -s4pHk3jA10

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

" Remove diacritical signs from characters in specified range of lines.
" Examples of characters replaced: á -> a, ç -> c, Á -> A, Ç -> C.
" Uses substitute so changes can be confirmed.
function! s:RemoveDiacritics(line1, line2)
  let diacs = 'áéíóúýĺŕťžšďľčň'  " lowercase diacritical signs
  let repls = 'aeiouylrtzsdlcn'  " corresponding replacements
  let diacs .= toupper(diacs)
  let repls .= toupper(repls)
  let diaclist = split(diacs, '\zs')
  let repllist = split(repls, '\zs')
  let trans = {}
  for i in range(len(diaclist))
    let trans[diaclist[i]] = repllist[i]
  endfor
  execute a:line1.','.a:line2 . 's/['.diacs.']/\=trans[submatch(0)]/gIce'
endfunction
command! -range=% RemoveDiacritics call s:RemoveDiacritics(<line1>, <line2>)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8

map , on <leader>
let mapleader = ","

"fast saving
nnoremap <leader>w :w<cr>

"mode changing
"inoremap wq <esc>

"spell checking
set spelllang=cs,sk,en
noremap <leader>sp :setlocal spell!<cr>

"paste mode toggle
noremap <leader>pp :setlocal paste!<cr>

"save backup and swap files to one directory
set backupdir=~/.vim/tmp
set directory=~/.vim/swap

"don't redraw when running macro
set lazyredraw

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UI
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"enable synstax highlighting
syntax enable

set number
"show title in OS status line
set title
set confirm

colorscheme mustang
set t_Co=256

"command line completion
set wildmenu
set wildmode=longest,list
set wildignore=*.o,*~,.swp

"show current position
set ruler

"highlight matching brackets for x tenths of second
set showmatch
set matchtime=2

"show line on 80 chars
set colorcolumn=80
highlight ColorColumn ctermbg=darkgray guibg=darkgray

"TODO fixme
"match Error /\%81v.\+/

"no errors sounds...
set novisualbell
set noerrorbells

"show cmd being executed (or number of lines in visual selection...)
set showcmd

"search as chars are typed, if search uppercase, be case sensitive, highlight
set incsearch
set hlsearch
set ignorecase
set smartcase
"hide highlight when enter is pressed
nnoremap <CR> :nohlsearch<CR><CR>

"number of lines around cursor
set scrolloff=5
set sidescrolloff=10

"set workdir to the currently edited file dirs
set autochdir

"reload when file is changed externally
set autoread

"current buffer can be put into background without saving
set hidden

"keep longer history
set history=500

"show characters on eol,...
set listchars=tab:>·,trail:~,extends:>,precedes:<
"set list

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax, folding, wrapping, indent...
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"folding stuff
set foldenable
set foldmethod=indent
"set foldmethod=syntax
set foldlevelstart=10
set foldnestmax=3

"toggle fold
nnoremap <space> za
" save folding when closing the file and restore when opening
"autocmd BufWinLeave *.* mkview
"autocmd BufWinEnter *.* silent loadview

"wrap visually only
set wrap
set showbreak=>
set linebreak
"uncomment to set hard wrapping
"set textwidth=80

"higlight extra whitespaces, errors like space folowed by tab...
highlight ExtraWhitespace ctermbg=darkred guibg=darkred
match ExtraWhitespace /\s\+$\| \+\ze\t/

"autoremove trailing whitespaces when saving
autocmd BufWritePre * :%s/\s\+$//e

"match also other tags and brackets with % (html)
runtime macros/matchit.vim

"clever indent
set autoindent

filetype plugin indent off
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Compiling, debugging...
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"compile button and moving around errors
noremap <F5> :w<cr>:make!<cr>
noremap <F6> :cp<cr>
noremap <F7> :cn<cr>
noremap <F8> :cl<cr>

"or more vim like keybindings
noremap cn <esc>:cn<cr>
noremap cp <esc>:cp<cr>
noremap cl <esc>:clist<cr>

"don't browse thought quickfix buffer when bnext/prev...
augroup qf
    autocmd!
    autocmd FileType qf set nobuflisted
augroup END
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" moving around, tabs, windows, buffers...
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"move vertically without skipping long visually wrapped lines
nnoremap j gj
nnoremap k gk

"tabs shortcuts
noremap <leader>tn :tabnew
noremap <leader>to :tabonly<cr>
noremap <leader>tc :tabclose<cr>
noremap <leader>tm :tabmove
"fill path to the current buffer's dir to tabedit
noremap <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
"next/prev tab
noremap <C-up> gt
noremap <C-down> gT

"windows
noremap <C-l> <C-W>l
noremap <C-h> <C-W>h
noremap <C-z> <C-W><
noremap <C-x> <C-W>>

"buffers
noremap <leader>be :e
"noremap <leader>bd :bdelete<cr>
"workaround for closing buffer with tagbar/nerdtree running - window is not closed
noremap <leader>bd :bprevious<CR>:bdelete #<CR>
noremap <C-j> :bprev<cr>
noremap <C-k> :bnext<cr>

"write with sudo
cmap w!! w !sudo tee > /dev/null %

"swap letters
nnoremap <silent> gs xph

"reselect lines after shifting
vnoremap < <gv
vnoremap > >gv

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"plugins shortcuts
noremap <leader>n :NERDTreeToggle<cr>
noremap <leader>v :Tagbar<cr>
noremap <leader>l :ToggleBufExplorer<cr>
noremap <leader>k :SyntasticToggleMode<cr>
nnoremap gd :YcmCompleter GoTo<CR>
nnoremap gi :YcmCompleter GoToInclude<CR>
nnoremap t :YcmCompleter GetType<CR>

"open tagbar on supported files during startup
autocmd VimEnter * nested :call tagbar#autoopen(1)

"nerdtree - open on start
"autocmd VimEnter * NERDTree | wincmd p

"hide crap
let NERDTreeIgnore=['\.pyc$', '\~$','\.o$']

"youcompleteme
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'
let g:ycm_extra_conf_vim_data   = ['&filetype']
let g:ycm_autoclose_preview_window_after_completion = 1

"delimitMate
let delimitMate_expand_space = 1
let delimitMate_expand_cr = 1

"ultisnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

""airline
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#whitespace#enabled = 1
"set laststatus=2

"syntastic
noremap <leader>m <esc>:lopen<cr>
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_html_checkers = ['w3']


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" rest
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" for hex editing
augroup Binary
    au!
    au BufReadPre  *.bin,*.hex let &bin=1
    au BufReadPost *.bin,*.hex if &bin | %!xxd
    au BufReadPost *.bin,*.hex set ft=xxd | endif
    au BufWritePre *.bin,*.hex if &bin | %!xxd -r
    au BufWritePre *.bin,*.hex endif
    au BufWritePost *.bin,*.hex if &bin | %!xxd
    au BufWritePost *.bin,*.hex set nomod | endif
augroup END

"autocompletion
"activate by ctrl-space
set omnifunc=syntaxcomplete#Complete

au FileType php setl ofu=phpcomplete#CompletePHP
au FileType html,xhtml setl ofu=htmlcomplete#CompleteTags
au FileType c setl ofu=ccomplete#Complete
au FileType css setl ofu=csscomplete#CompleteCSS
au FileType python setl ofu=pythoncomplete#Complete
au FileType javascript setl ofu=javascriptcomplete#CompleteJS
au FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
au BufNewFile,BufRead *.yml set filetype=yaml.ansible

"requires X11 vim package with clipboard installed
set clipboard=unnamed
