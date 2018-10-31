" leader
let mapleader = ","

nmap <Leader>e :e <C-R>=escape(expand("%:p:h"),' ') . '/'<CR>
nmap <leader>w :w!<cr>

" reindent file
" map <Leader>f mzgg=G`z
map <Leader>f mzgggqG`z
map <Leader>ll :SyntasticToggleMode<CR>

map <Leader>d :Dox<CR>

map <Leader>ss :sort<CR>gv
map <Leader>sn :sort n<CR>gv

" move in warped lines
nmap k gk
nmap j gj

let g:C_Ctrl_j = 'off'
" move accross splits with CTRL+hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Split window vertically
nmap <leader>v <C-w>v<C-w>l
" Split window horizontally
nmap <leader>b <C-w>s<C-w>j

" save as root
cmap w!! %!sudo tee > /dev/null %

" clear last search
noremap <silent><Leader>/ :nohls<CR>

" disable arrow keys
no <Down>   <NOp>
no <Left>   <NOp>
no <Right>  <NOP>
no <Up>     <NOp>
ino <Left>  <NOP>
ino <Right> <NOP>
ino <Up>    <NOP>
ino <Down>  <NOP>
vno <Left>  <NOP>
vno <Right> <NOP>
vno <Up>    <NOP>
vno <Down>  <NOP>

"" moving line of code
"nnoremap <C-k> :<C-u>silent! move-2<CR>==
"nnoremap <C-j> :<C-u>silent! move+<CR>==
"
"" moving block of code
"xnoremap <C-k> :<C-u>silent! '<,'>move-2<CR>gv=gv
"xnoremap <C-j> :<C-u>silent! '<,'>move'>+<CR>gv=gv

"no / /\v

" better indetion
vnoremap < <gv
vnoremap > >gv

"refactoring
"local
nnoremap gr gd[{V%::s/<C-R>///gc<left><left><left>
"global
nnoremap gR gD:%s/<C-R>///gc<left><left><left>

command! MakeTags !ctags -R .

" fix Capitalize errors
command! Q q " Bind :Q to :q
command! Qall qall
command! QA qall
command! E e
command! W w
command! Wq wq
command! WQ wq

