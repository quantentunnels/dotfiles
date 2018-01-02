" #### Vundle conf #### 
" #####################
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" My Plugins here:
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'junegunn/goyo.vim'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'

"Language/Syntax support
Plugin 'majutsushi/tagbar'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'chikamichi/mediawiki.vim'
Plugin 'sgeb/vim-matlab'
Plugin 'djoshea/vim-matlab-fold' " TODO does the matlab folding even work?
Plugin 'lervag/vimtex' "Latex compilation Plugin
"Plugin '4Evergreen4/vim-hardy' "Arduino IDE integration
Plugin 'keith/tmux.vim'
Plugin 'freitass/todo.txt-vim'
"Plugin 'quantentunnels/vim-ijmacro'
Plugin 'sirtaj/vim-openscad'
Plugin 'vim-scripts/workflowish'

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
map Q <Nop> " disable ex mode
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
set smarttab expandtab
set shiftwidth=4 tabstop=4 softtabstop=4 " always expand tabs to 4 spaces

set ignorecase  " suche standardmäßig case insensitve
set smartcase   " smart case bei der Suche mit /

set diffopt=filler,vertical " always split vertical for diffs

set splitright

set laststatus=2    " alsways show statusline

set spelllang=en_us,de_20   " set recognized languages


" ##### Colors & Highlighting #####
" #################################

" Colorscheme for Terminal
colorscheme solarized
set background=light
if has('gui_running')
    let g:solarized_menu=0
    set guifont=DejaVu\ Sans\ Mono\ 12
    "set columns=90
    "set lines=45 
else
    set t_Co=16 "use the 16 terminal colors
end

"highligt current line
set cursorline

" all of these do not seem to work
" " Show trailing whitespace and spaces before a tab:
" highlight ExtraWhitespace ctermbg=red guibg=red
" match ExtraWhitespace /\s\+$\| \+\ze\t/
" " Todo, Fixme, etc.
" highlight fixme term=reverse cterm=reverse ctermfg=1 guifg=#dc322f
" "match fixme /TODO/
" match fixme /FIXME/

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
let g:goyo_linenr = 1
let g:goyo_width = 85
let g:goyo_height = "85%"

" ##### Tmux #####
let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_save_on_switch = 1
let g:BASH_Ctrl_j = 'off' " turn of bash line feed for the following to work
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-;> :TmuxNavigatePrevious<cr>


" ##### vimtex (Latex) #####
" ###########################
let g:vimtex_view_method = 'zathura'
"let g:vimtex_view_use_temp_files = 1
let g:vimtex_fold_enabled = 1
let g:vimtex_fold_manual = 1
let g:vimtex_quickfix_open_on_warning = 0

" " only a little indentation but tabstops stay longer
autocmd FileType tex setlocal expandtab shiftwidth=2 tabstop=4 softtabstop=2

" use tex highlighting for .tikz files
autocmd BufRead,BufNewFile *.tikz set filetype=tex



" ##### MATLAB #####
" ##################

" for the mlint compiler
"autocmd BufEnter *.m    compiler mlint 

" ##### tab separated file settings
autocmd BufEnter *.tsv setlocal nosmarttab noexpandtab shiftwidth=16 tabstop=16 softtabstop=16

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
" mute search highlighting
nnoremap <silent> <C-p> :<C-u>nohlsearch<CR><C-p>
" display Tagbar
nnoremap <F8> :TagbarToggle<CR>
" toggle search highlighting
nnoremap <F9> :set hlsearch!<CR>
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
