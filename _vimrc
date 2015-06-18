set nocompatible	" Required for Vundle
filetype off		" Required for Vundle

" Start Vundle before everything else
if has('win32')
	set rtp+=~/.vim/bundle/vundle/
	call vundle#rc("~/.vim/bundle/")
else
	set rtp+=~/.vim/bundle/vundle/
	call vundle#rc("~/.vim/bundle/")
endif
Plugin 'gmarik/vundle'

" Personal Bundles
Plugin 'yurivecchi/desertEx'
Plugin 'Lokaltog/powerline-fonts'
Plugin 'bling/vim-airline'
Plugin 'mattn/emmet-vim'
Plugin 'joonty/vdebug'
Plugin 'tpope/vim-repeat'
Plugin 'vim-scripts/visualrepeat'
Plugin 'sumpygump/php-documentor-vim'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'junegunn/vim-easy-align'
Plugin 'scrooloose/syntastic'
Plugin 'wakatime/vim-wakatime'
Plugin 'altercation/vim-colors-solarized'

" Good configs, keep this from original install
source $VIMRUNTIME/vimrc_example.vim

" let Syntastic use tidy5 (considering you already installed it)
let g:syntastic_html_tidy_exec = 'tidy5'
let g:syntastic_php_checkers = ['php']
let g:syntastic_html = ['tidy']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Activate omnicompletion
set omnifunc=syntaxcomplete#Complete

" Scheme, font, always start maximized in windows
set background=dark
colorscheme solarized
highlight Normal guibg=gray6
highlight CursorLine guibg=gray10
highlight LineNr guifg=burlywood3 guibg=gray12

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

" Maintain the tabs
set switchbuf=usetab,newtab

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

" next and previous at middle
nnoremap n nzz
nnoremap N Nzz

" TAB size
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Backup, Swap and Undo Files Management
"
" http://stackoverflow.com/questions/4331776/change-vim-swap-backup-undo-file-name
"
" Save your backups to a less annoying place than the current directory.
" If you have .vim-backup in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/backup or . if all else fails.
if isdirectory($HOME . '/.vim/backup') == 0
  :silent !mkdir -p ~/.vim/.backup >/dev/null 2>&1
endif
set backupdir-=.
set backupdir+=.
set backupdir-=~/
set backupdir^=~/.vim/.backup//
set backupdir^=./.vim-backup/
set backup

" Save your swp files to a less annoying place than the current directory.
" If you have .vim-swap in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/swap, ~/tmp or .
if isdirectory($HOME . '/.vim/swap') == 0
  :silent !mkdir -p ~/.vim/.swap >/dev/null 2>&1
endif
set directory=./.vim-swap//
set directory+=~/.vim/.swap//
set directory+=~/tmp//
set directory+=.

" viminfo stores the the state of your previous editing session
set viminfo+=n~/.vim/.viminfo

" Set path to actual file
set autochdir

if exists("+undofile")
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  " This is only present in 7.3+
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/.undo > /dev/null 2>&1
  endif
  set undodir=./.vim-undo//
  set undodir+=~/.vim/.undo//
  set undofile
endif

" XDebug Options
if !exists("g:vdebug_options")
    let g:vdebug_options = {}
endif
if !exists("g:vdebug_features")
    let g:vdebug_features = {}
endif
let g:vdebug_features["max_children"] = 512
let g:vdebug_options["break_on_open"] = 0
let g:vdebug_options["ide_key"] = "VimXDebug"

" Sessions
set ssop-=options    " do not store global and local values in a session
set ssop-=folds      " do not store folds

" Fold
set foldmethod=indent
autocmd Syntax * normal zR

" Search Highlight
set ignorecase
set smartcase

" (Un)Serialiaze PHP strings
vmap <leader>s <esc>:'<,'> !php -r 'echo serialize(eval("return " . file_get_contents("php://stdin") . ";"));'<CR>
vmap <leader>u <esc>:'<,'> !php -r 'var_export(unserialize(file_get_contents("php://stdin")));'<CR>

" (En|De)code PHP strings
vmap <leader>e <esc>:'<,'> !php -r 'echo base64_encode(eval("return " . file_get_contents("php://stdin") . ";"));'<CR>
vmap <leader>d <esc>:'<,'> !php -r 'var_export(base64_decode(file_get_contents("php://stdin")));'<CR>

" Diff Options
set diffopt+=iwhite

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(LiveEasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(LiveEasyAlign)

" More signs for GitGutter
let g:gitgutter_max_signs=9999
