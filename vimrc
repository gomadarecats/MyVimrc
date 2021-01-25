scriptencoding utf-8
set encoding=utf-8
set fileencodings=utf-8,sjis,iso-2022-jp,euc-jp
set fileformats=unix,dos,mac

set nocompatible
set backspace=indent,eol,start
set formatoptions+=mM

augroup enhancedime
  autocmd!
augroup END

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent

set wrapscan
set wildmenu

nnoremap <Esc><Esc> :noh<CR>
nnoremap ; :
nnoremap :<S-q> :q!
nnoremap <Tab> >>
nnoremap <S-Tab> <<
nnoremap <Down> gj
nnoremap <Up> gk
cnoremap ;<S-q> q!
cnoremap ;vdiff vertical diffsplit
cnoremap ;vsed %s
inoremap ( ()<Left>
inoremap { {}<Left>
inoremap [ []<Left>
inoremap < <><Left>
inoremap ' ''<Left>
inoremap " ""<Left>
inoremap ` ``<Left>
inoremap {<CR> {}<Left><CR><Esc><<<S-o>
inoremap <S-Tab> <Esc><<<S-a>

set number
set noruler
set nolist
set wrap
set laststatus=1
set cmdheight=1
set showcmd
set title
set relativenumber
set clipboard=unnamed,autoselect
set syntax=on

set nobackup
set noswapfile
set noundofile

set browsedir=buffer

set splitbelow
set splitright

colorscheme pablo

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
