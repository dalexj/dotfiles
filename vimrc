filetype plugin indent on
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
syntax on
set background=dark
set hlsearch
set showcmd
set wildmenu
set hidden
set number
set autoread
" Terminal
" nmap <buffer> <Right> <Plug>(seeing-is-believing-myrun)
" nmap <buffer> <Left> <Plug>(seeing-is-believing-clear)
vnoremap . :norm.<CR> " in visual mode, "." will for each line, go into normal mode and execute the "."
cmap Q q
cmap W w
imap jk <Esc>
imap kj <Esc>
" idk if this works
set nocp
execute pathogen#infect()

" nerdtree stuff
autocmd vimenter * NERDTree
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <C-m> :NERDTreeToggle<CR>
" Because semicolons are worthless outside of insert mode
nnoremap ; :
vnoremap ; :
set runtimepath^=~/.vim/bundle/ctrlp.vim
