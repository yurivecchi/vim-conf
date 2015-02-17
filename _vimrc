set nocompatible	" Required for Vundle
filetype off		" Required for Vundle

" Start Vundle before everything else
set rtp+=~/.vim/bundle/vundle/
call vundle#rc("~/.vim/bundle/")
Plugin 'gmarik/vundle'

" Personal Bundles
Plugin 'yurivecchi/desertEx'
Plugin 'Lokaltog/powerline-fonts'
Plugin 'bling/vim-airline'
Plugin 'mattn/emmet-vim'

" Good configs, keep this from original install
source $VIMRUNTIME/vimrc_example.vim

set diffexpr=YyDiff()
function! YvDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

" Activate omnicompletion
set omnifunc=syntaxcomplete#Complete

" Scheme, font, always start maximized in windows
colorscheme desertEx
set guifont=Inconsolata\ for\ Powerline\ 12
if has("win32")
	au GUIEnter * simalt ~x
	set guifont=Inconsolata\ for\ Powerline:h11
endif

" always utf8
set enc=utf8

" Highlight cursorline
set cursorline

" Line numbers
set number

" vim-airline using powerline fonts
let g:airline_powerline_fonts = 1

" always show statusline
set laststatus=2

" Always in directory
set autochdir

" tab navigation
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew .<CR>
nnoremap <C-End>   :tabclose<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>
inoremap <C-tab>   <Esc>:tabnext<CR>
inoremap <C-t>     <Esc>:tabnew .<CR>
inoremap <C-End>   <Esc>:tabclose<CR>

" Paste, Copy, Cut
nnoremap <S-Insert> "+P
inoremap <S-Insert> <C-o>"+P
vnoremap <S-Insert> "+P
nnoremap <C-Insert> "+y
inoremap <C-Insert> <C-o>"+y
vnoremap <C-Insert> "+y
nnoremap <C-Delete> "+x
inoremap <C-Delete> <C-o>"+x
vnoremap <C-Delete> "+x

" TAB size
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
