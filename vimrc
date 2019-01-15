set encoding=utf-8
scriptencoding utf-8
set fileencodings=iso-2022-jp,cp932,sjis,euc-jp,utf-8

set nocompatible
set backspace=indent,eol,start

augroup enhancedime
    autocmd!
augroup END

set expandtab

set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smartindent
set autoindent
set wrapscan
set showmatch
set wildmenu
set formatoptions+=mM

inoremap ( ()<Left>
inoremap { {}<Left>
inoremap [ []<Left>
inoremap < <><Left>
inoremap ' ''<Left>
inoremap " ""<Left>
inoremap ` ``<Left>
inoremap （ （）<Left>
inoremap 「 「」<Left>
inoremap {<Enter> {}<Left><CR><ESC><<<S-o>
inoremap <S-Tab> <ESC><<<S-a>
nnoremap :<S-q> :q!
nnoremap <Tab> >>
nnoremap \<C-i> <C-i>
nnoremap <S-Tab> <<
nnoremap ; :
nnoremap <Down> gj
nnoremap <Up> gk

set clipboard=unnamedplus

set number
set noruler
set nolist
set wrap
set incsearch
set laststatus=1
set cmdheight=1
set showcmd
set title
set syntax=on

colorscheme pablo

set noswapfile
set nobackup

augroup enhancedime
    autocmd InsertLeave * call IME()
    autocmd InsertLeave * call ESC()
    autocmd InsertEnter * call INS()
augroup END

function IME()
    let g:imstat =  system('fcitx-remote')
endfunction

function ESC()
    if (g:).imstat == 2
        call system('fcitx-remote -c')
    endif
endfunction

function INS()
    if exists('g:imstat')
        if (g:).imstat == 2
            call system('fcitx-remote -o')
        endif
    endif
endfunction
