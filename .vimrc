set nocompatible " required
set encoding=utf-8  " The encoding displayed.
set fileencoding=utf-8  " The encoding written to file.
set hls
set is
set nrformats=

filetype off     " required
syntax enable

" Enable folding
set foldmethod=indent
set foldlevel=99

" Press Space to turn off highlighting and clear any message already displayed.
:nnoremap <C-Space> :nohlsearch<Bar>:echo<CR>

" Folding with spacebar
nnoremap <space> za

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
 
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all Plugins here
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'tpope/vim-commentary'
Plugin 'matze/vim-move'
Plugin 'majutsushi/tagbar'
Plugin 'Yggdroot/indentLine'

" All Plugins must be added before the following line

call vundle#end()            " required
filetype plugin indent on    " required

let g:SimpylFold_docstring_preview=1

" copy and paste to/from vIM and the clipboard
nnoremap <C-y> +y
vnoremap <C-y> +y
nnoremap <C-p> +P
vnoremap <C-p> +P

" access system clipboard
set clipboard=unnamed

" Identation
au BufNewFile,BufRead *.py,*.css,*.js,*.jsx,*.scss,*.html,*.cpp,*.hpp,*.c,*.h
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set expandtab |
    \ set autoindent |
    \ set shiftround |
    \ set fileformat=unix |

" Flag Whitespaces
highlight BadWhiteSpace ctermbg=white
au BufRead,BufNewFile *.py,*pyw,*.c,*.h,*.js,*.cpp,*.hpp,*.html match BadWhitespace /\s\+$/

" Choose colorscheme
if has('gui_running')
	set background=dark
	colorscheme solarized
else
	colorscheme zenburn
endif

" Leading spaces
let g:indentLine_enabled = 0
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceCha = '.'


" Line Numbering
set nu

"Ignore this files
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" Only open nerdtree if no file was specified on startup
function! StartUpNerdtree()
	if 0 == argc()
		NERDTree
        endif
endfunction

autocmd VimEnter * call StartUpNerdtree()

" Backups
if has('persistent_undo')
	set undodir=~/.vim/tmp/undo//     " undo files
	set undofile
	set undolevels=3000
	set undoreload=10000
endif
	
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files
set backup
set noswapfile

" Powerline
set laststatus=2
set t_Co=256
set statusline=%f
set statusline+=\ %h%w%m%r
set statusline+=%=
set statusline+=%-16(%{exists('g:loaded_fugitive')?fugitive#statusline():''}\%)
set statusline+=\ %P/%L
set statusline+=\

let g:move_key_modifier = 'C'

"Switch split vertical
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

"Remap
noremap  <F6> :NERDTreeTabsToggle<CR>
noremap  <TAB> :tabp<CR>
noremap  <S-TAB> :tabn<CR>
nmap <silent> <C-D> :NERDTreeToggle<CR>

"Tagbar
noremap <F8> :TagbarToggle<CR>

"Disable Arrows
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Disable Arrow keys in Insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>
