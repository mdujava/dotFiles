""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Load plugins using vundle
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off

"save backup and swap files to one directory
set undodir=$XDG_DATA_HOME/vim/undo/
set directory=$XDG_DATA_HOME/vim/swap/
set backupdir=$XDG_DATA_HOME/vim/backup/
set viminfo+='1000,n$XDG_DATA_HOME/vim/viminfo
set runtimepath=$XDG_CONFIG_HOME/vim,$VIMRUNTIME,$XDG_CONFIG_HOME/vim/after

let vimDir = "$XDG_DATA_HOME/vim/"
if !has("compatible")
    let &runtimepath .= ',' . expand(vimDir . '/bundle/Vundle.vim/')
    call vundle#rc(expand(vimDir . '/bundle/'))
    call vundle#begin()

    Plugin 'VundleVim/Vundle.vim'
    "Plugin 'wakatime/vim-wakatime'

    Plugin 'vim-latex/vim-latex'

    "Plugin 'neoclide/coc.nvim'
    "Plugin 'neoclide/coc-yaml'

    Plugin 'nvie/vim-flake8'
    "Plugin 'powerline/powerline'
    Plugin 'syngan/vim-vimlint'
    Plugin 'tpope/vim-pathogen'
    Plugin 'airblade/vim-gitgutter'
    Plugin 'godlygeek/tabular'
    Plugin 'croaker/mustang-vim'
    Plugin 'scrooloose/nerdtree'
    Plugin 'majutsushi/tagbar'
    Plugin 'jlanzarotta/bufexplorer'
    "Plugin 'Valloric/YouCompleteMe'
    Plugin 'SirVer/ultisnips'
    Plugin 'honza/vim-snippets'
    Plugin 'Raimondi/delimitMate'
    Plugin 'bling/vim-airline'
    "Plugin 'scrooloose/syntastic'
    Plugin 'vim-syntastic/syntastic'
    Plugin 'tpope/vim-fugitive'
    Plugin 'rhysd/vim-grammarous'
    Plugin 'universal-ctags/ctags'

    call vundle#end()
endif

let g:syntastic_javascript_eslint_generic = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = 'npm run lint --'
let g:syntastic_typescript_checkers = ['eslint']
let g:syntastic_typescript_eslint_exe = 'npm run lint --'

" let g:coc_force_debug = 1

set exrc "folder specific rc

" Transparent editing of gpg encrypted files.
augroup encrypted
au!

" First make sure nothing is written to ~/.viminfo while editing
" an encrypted file.
autocmd BufReadPre,FileReadPre      *.gpg set viminfo=
" We don't want a swap file, as it writes unencrypted data to disk
autocmd BufReadPre,FileReadPre      *.gpg set noswapfile
" Switch to binary mode to read the encrypted file
autocmd BufReadPre,FileReadPre      *.gpg set bin
autocmd BufReadPre,FileReadPre      *.gpg let ch_save = &ch|set ch=2
autocmd BufReadPre,FileReadPre      *.gpg let shsave=&sh
autocmd BufReadPre,FileReadPre      *.gpg let &sh='sh'
autocmd BufReadPre,FileReadPre      *.gpg let ch_save = &ch|set ch=2
autocmd BufReadPost,FileReadPost    *.gpg '[,']!gpg --decrypt --default-recipient-self 2> /dev/null
autocmd BufReadPost,FileReadPost    *.gpg let &sh=shsave
" Switch to normal mode for editing
autocmd BufReadPost,FileReadPost    *.gpg set nobin
autocmd BufReadPost,FileReadPost    *.gpg let &ch = ch_save|unlet ch_save
autocmd BufReadPost,FileReadPost    *.gpg execute ":doautocmd BufReadPost " . expand("%:r")
" Convert all text to encrypted text before writing
autocmd BufWritePre,FileWritePre    *.gpg set bin
autocmd BufWritePre,FileWritePre    *.gpg let shsave=&sh
autocmd BufWritePre,FileWritePre    *.gpg let &sh='sh'
autocmd BufWritePre,FileWritePre    *.gpg '[,']!gpg --encrypt --default-recipient-self 2>/dev/null
autocmd BufWritePre,FileWritePre    *.gpg let &sh=shsave
" Undo the encryption so we are back in the normal text, directly
" after the file has been written.
autocmd BufWritePost,FileWritePost  *.gpg silent u
autocmd BufWritePost,FileWritePost  *.gpg set nobin
augroup END

set clipboard=unnamed,unnamedplus,autoselect

source /home/mdujava/.config/vim/all.vim
source /home/mdujava/.config/vim/keymap.vim

hi SpecialKey ctermfg=240
