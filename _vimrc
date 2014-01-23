set nocompatible	" Required for Vundle
filetype off		" Required for Vundle

" Start Vundle before everything else
" I Install on main folder because im on Windows 
" and I like to have same conf for all users
set rtp+=$VIM/vimfiles/bundle/vundle/
call vundle#rc("$VIM/vimfiles/bundle/")
Bundle 'gmarik/vundle'

" Personal Bundles
Bundle 'Lokaltog/powerline-fonts'
Bundle 'bling/vim-airline'
Bundle 'mattn/emmet-vim'
Bundle 'yurivecchi/desertEx'

" Good configs, keep this from original install
source $VIMRUNTIME/vimrc_example.vim

set diffexpr=MyDiff()
function MyDiff()
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
set guifont=Inconsolata\ for\ Powerline:h11
if has("win32")
	au GUIEnter * simalt ~x
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
