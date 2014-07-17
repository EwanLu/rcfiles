" Encoding settings
set encoding=utf-8
set langmenu=zh_TW.UTF-8
language message zh_TW.UTF-8
set fileformat=unix
set ambiwidth=double

" Show mode on bottom-left
set showmode

" Show command on bottom-right
set showcmd

" Color settings
syntax on
set hlsearch
set bg=dark

" Tab charactor related settings
set expandtab       " changes user pressed TAB to spaces
set tabstop=4       " changes the width of the TAB character
set shiftwidth=4    " >>, <<, == width and automatic indent width
set listchars=tab:>-
set list
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType xml  setlocal shiftwidth=2 tabstop=2
autocmd FileType make setlocal noexpandtab

" Ignore case on searching
set ic

" Show the coordinate of cursor
set ru

" Enable backspace
set bs=2

" Tabline setting in .vim/plugin/tabline.vim
hi TabLine     ctermfg=black ctermbg=white    "not active tab page label
hi TabLineSel  ctermfg=grey  ctermbg=black    "active tab page label
hi TabLineFill ctermfg=grey  ctermbg=white    "fill the other place
hi VIMlogo     ctermfg=white ctermbg=blue

" Hot-keys

" move moving between long wrapped lines
" must use nnoremap #no recursive map
nnoremap k gk
nnoremap j gj

nmap <C-j> :tabp<CR>
imap <C-j> <ESC><C-j>a
nmap <C-k> :tabn<CR>
imap <C-k> <ESC><C-k>a

nmap <C-t> :tabe<SPACE>
imap <C-t> <ESC><C-t>

nmap <C-p> :tabm -1<CR>
imap <C-p> <ESC><C-p>a
nmap <C-n> :tabm +1<CR>
imap <C-n> <ESC><C-n>a

" generate a checkbox at the beginning of line
nmap <C-c> :call Add_checkbox()<CR>
imap <C-c> <ESC>:call Add_checkbox()<CR>
vmap <C-c> :call Add_checkbox()<CR>

" Show line numbers
set nu

" Indent related settings

" Set cindent
set ai
set shiftwidth=4

" Status line
set laststatus=2
set wildmenu

set scrolloff=5


" My functions!

" Add a line under a rst title
function! Title(type)
    if len(a:type) == 1
        execute "normal yyp$r" . a:type
    else
        echom "Title type must be only one charactor"
    endif
endfunction
command! -nargs=1 Title call Title(<f-args>)

function! Add_checkbox ()
    let l:line = getline('.')
    if l:line[0:2] == '[ ]'
        let l:line = '[v]' . l:line[3:]
    elseif l:line[0:2] == '[v]'
        let l:line = '[x]' . l:line[3:]
    elseif l:line[0:2] == '[x]'
        let l:line = '[ ]' . l:line[3:]
    else
        let l:line = '[ ] ' . l:line
    endif
    call setline('.', l:line)
    echom ""
endfunction
