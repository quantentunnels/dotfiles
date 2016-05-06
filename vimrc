" #### Vundle conf #### 
" #####################
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" My Plugins here:
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

"Plugin 'bling/vim-bufferline'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'keith/tmux.vim'
Plugin 'junegunn/goyo.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-repeat'
Plugin 'freitass/todo.txt-vim'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'chikamichi/mediawiki.vim'
Plugin 'sgeb/vim-matlab'
Plugin 'djoshea/vim-matlab-fold' " TODO does the matlab folding even work?
Plugin 'quantentunnels/vim-ijmacro' "my ijmacro syntax plugin
Plugin 'Align'
Plugin 'coot/atp_vim' "Automatic Latex Plugin

call vundle#end()            " required
filetype plugin indent on     " required!
" or 
" filetype plugin on          " to not use the indentation settings set by plugins

" ### Vundle end


" enable the default matchit plugin
runtime macros/matchit.vim


" ##### Allgemeine settings #####
" ###############################

let mapleader = '\' " leader

set mouse=a " enable mouse support also in terminals

set noswapfile
set directory=~/tmp,/tmp,/var/tmp   " where to put swap and backup files
set backupdir=~/tmp,/tmp,/var/tmp
set autoread    " automatically load file on change

set hlsearch
set incsearch   " show match instantaneously while typing
set path+=**    " allow the use of :find to recursivley search for files
set wildignore+=tags

syntax on   " syntax highlighting on
set number  " show line numbers
set scrolloff=3

set smartindent " Automatische Einrückung (Globale Konfiguration)
set smarttab
set expandtab shiftwidth=4 tabstop=4 softtabstop=4 " always expand tabs to 4 spaces

set ignorecase  " suche standardmäßig case insensitve
set smartcase   " smart case bei der Suche mit /

set diffopt=filler,vertical " always split vertical for diffs

set splitright

set laststatus=2    " alsways show statusline

set spelllang=en_us,de_20   " set recognized languages


" ##### Colors & Highlighting #####
" #################################

" Colorscheme for Terminal
if has('gui_running')
    let g:solarized_menu=0
    set background=light
    set guifont=DejaVu\ Sans\ Mono\ 12
    "set columns=90
    "set lines=45 
else
    set t_Co=16 "use the 16 terminal colors
    set background=dark
end
colorscheme solarized

"highligt current line
set cursorline

" Show trailing whitespace and spaces before a tab:
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$\| \+\ze\t/
" Todo, Fixme, etc.
highlight fixme term=reverse cterm=reverse ctermfg=1 guifg=#dc322f
"match fixme /TODO/
match fixme /FIXME/

" ##### Airline #####
"let g:airline_theme = 'solarized'

let g:airline_left_sep = '▶'
let g:airline_right_sep= '◀'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.linenr = '␤'

" disable whitespace checking
"let g:airline#extensions#whitespace#enabled = 1
"let g:airline#extensions#bufferline#enabled = 1

" ##### Goyo #####
let g:goyo_linenr = 0

" ##### Tmux #####
let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_save_on_switch = 1
let g:BASH_Ctrl_j = 'off' " turn of bash line feed for the following to work
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-;> :TmuxNavigatePrevious<cr>


" ##### Vim-ATP (Latex) #####
" ###########################
let b:atp_Viewer = 'evince'

" " modify environment mappings
" let g:Tex_PromptedEnvironments =
"     \ 'equation,equation*,align,align*,$$,eqnarray*,eqnarray'
" let g:Tex_HotKeyMappings =
"     \ 'equation*,equation,bmatrix'
" 
" " only a little indentation but tabstops stay longer
" autocmd FileType tex setlocal expandtab shiftwidth=2 tabstop=4 softtabstop=2


" ##### MATLAB #####
" ##################

" for the mlint compiler
autocmd BufEnter *.m    compiler mlint 

" ##### vim-pandoc options #####
" ########################

let g:pandoc#command#latex_engine = 'pdflatex'

" ##### My mappings #####
" diable dreadful Q
noremap Q <Nop>
" set working dir to current dir
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
" :Explore current directory to where the opend file resides in
nnoremap <leader>E :E %:p:h<CR>
" vim-latex save and compile
nnoremap <F2> :w<CR><leader>ll
" toggle search highlighting
nnoremap <F7> :set hlsearch!<CR>
" mute search highlighting
nnoremap <silent> <C-p> :<C-u>nohlsearch<CR><C-p>
" toogle Goyo
nmap <F12> :Goyo<CR>

" ##### Windows specific settings #####
" adjust configuration for such hostile environment as Windows {{{
if has("win32") || has("win16")
  lang C
  set viminfo='20,\"512,nc:/tmp/_viminfo
  set encoding=utf-8 " set encoding to Unicode
  set fileencoding=utf-8
  " set font and size
 set guifont=Lucida_Sans_Typewriter:h10:cANSI
" Fix backspace in windows
  set backspace=2
  set backspace=indent,eol,start
endif
