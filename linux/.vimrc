syntax on
set tabstop=2
set shiftwidth=2
set expandtab
set ai
set smartindent
set number
set hlsearch
set ruler
set incsearch
set ignorecase
set smartcase
set nobackup
set noswapfile
set autoread
set hidden
set showcmd
set virtualedit=onemore
set laststatus=2
set backspace=indent,eol,start
set clipboard=unnamedplus,autoselect
colorscheme peachpuff
nnoremap <C-j> 5j
noremap <C-k> 5k
highlight Comment ctermfg=green

" insert
imap <C-p> <Up>
imap <C-n> <Down>
imap <C-b> <Left>
imap <C-f> <Right>
imap <C-a> <Home>
imap <C-e> <End>
imap <C-d> <Del>
imap <C-h> <BS>
imap <C-m> <CR>
imap <C-k> <C-r>=<SID>kill()<CR>

function! s:kill()
let [text_before, text_after] = s:split_line()
if len(text_after) == 0
  normal! J
else
  call setline(line('.'), text_before)
endif
return ''
endfunction

function! s:split_line()
let line_text = getline(line('.'))
let text_after  = line_text[col('.')-1 :]
let text_before = (col('.') > 1) ? line_text[: col('.')-2] : ''
return [text_before, text_after]
endfunction

" wsl-copy,paste
let s:clip = '/mnt/c/Windows/System32/clip.exe'
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif
