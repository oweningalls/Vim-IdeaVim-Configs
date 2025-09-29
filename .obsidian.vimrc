" allow it to work as a leader
unmap <Space>

" share the Vim clipboard with the system clipboard
set clipboard=unnamed

" don't put text in the clipboard by default
vnoremap d "_d
nnoremap d "_d
noremap x "_x
vnoremap c "_c
nnoremap c "_c
nnoremap D "_D

" Put deleted text into the clipboard
noremap <Space>d "*d
noremap <Space>c "*c
noremap <Space>D "*D

" jk to exit insert mode
inoremap jk <Esc>

" move between wrapped lines as though they're separate lines
nmap j gj
nmap k gk
