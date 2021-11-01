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

" wsl-copy,paste
let s:clip = '/mnt/c/Windows/System32/clip.exe'
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif