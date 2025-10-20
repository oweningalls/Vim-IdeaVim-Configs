" this specifies what character represents <leader> in mappings
let mapleader=" "

" stuff for searching in a file
set ignorecase
set smartcase
set incsearch
set hlsearch
set visualbell

set scrolloff=10
" share the Vim clipboard with the system clipboard
set clipboard+=unnamed

" don't put text in the clipboard by default
nnoremap d "_d
vnoremap d "_d
nnoremap x "_x
vnoremap x "_x
nnoremap c "_c
vnoremap c "_c
nnoremap C "_C
nnoremap D "_D

" make Y copy the rest of the line instead of the whole line
noremap Y y$

" Put deleted text into the clipboard
noremap <leader>d "*d
noremap <leader>c "*c
noremap <leader>D "*D

" jk or kj to exit insert mode
inoremap jk <Esc>
inoremap kj <Esc>

" disable arrow keys
noremap <up> <NOP>
noremap <down> <NOP>
noremap <left> <NOP>
noremap <right> <NOP>

" * to search currently selected text
vnoremap * "ty/<C-r>t<CR>N

colorscheme desert

" H goes to beginning of line
nnoremap H ^
" L goes to end of line
nnoremap L $
" J and K to move between paragraphs
nnoremap J {
nnoremap K }
