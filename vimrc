" #### Vundle conf #### 
" #####################
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Bundle 'gmarik/Vundle.vim'

" My Bundles here:
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
Bundle 'vim-pandoc/vim-pandoc'
Bundle 'chikamichi/mediawiki.vim'

Bundle 'sgeb/vim-matlab'
Bundle 'djoshea/vim-matlab-fold'

Bundle 'git://vim-latex.git.sourceforge.net/gitroot/vim-latex/vim-latex'
"Bundle 'VOoM'

Bundle 'mikewest/vimroom'

call vundle#end()            " required
filetype plugin indent on     " required!
" or 
" filetype plugin on          " to not use the indentation settings set by plugins

" ### Vundle end


" enable the default matchit plugin
runtime macros/matchit.vim


" ##### Allgemeine settings #####
" ###############################

let mapleader = '\'	" leader

set mouse=a	" enable mouse support also in terminals

set noswapfile
set directory=~/tmp,/tmp,/var/tmp	" where to put swap and backup files
set backupdir=~/tmp,/tmp,/var/tmp
set autoread	" automatically load file on change

syntax on	" syntax highlighting on
set number	" show line numbers
set scrolloff=7

set smartindent	" Automatische Einrückung (Globale Konfiguration)
set smarttab
set expandtab shiftwidth=4 tabstop=4 softtabstop=4 " always expand tabs to 4 spaces

set ignorecase	" suche standardmäßig case insensitve
set smartcase	" smart case bei der Suche mit /

set diffopt=filler,vertical	" always split vertical for diffs

set spelllang=en_us,de_20	" set recognized languages


" ##### Colors & Highlighting #####
" #################################

" Colorscheme for Terminal
colorscheme solarized
if has('gui_running')
	set background=light
	set guifont=DejaVu\ Sans\ Mono\ 12
	"set columns=90
	"set lines=45 
else
	set t_Co=16 "use the 16 terminal colors
	set background=dark
end

"highligt current line
set cursorline

" Show trailing whitespace and spaces before a tab:
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$\| \+\ze\t/
" Todo, Fixme, etc.
highlight todo term=bold ctermfg=4 guifg=#dc322f
match todo /TODO/
match todo /FIXME/

" ##### Vimroom #####
" set appropriate background color (needs to check for light or dark!)
if has('gui_running')
  let g:vimroom_guibackground='#fdf6e3'
endif
let g:vimroom_width=86
" let g:vimroom_navigational_keys=0	" disable key remaping
" let g:vimroom_clear_line_numbers=0	" leave line numbers on


" ##### Vim-Latex #####
" #####################
" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" TIP: if you write your \label's as \label{fig:something}, then if you
" type in \ref{fig: and press <C-n> you will automatically cycle through
" all the figure labels. Very useful!
set iskeyword+=:

let g:Tex_DefaultTargetFormat = 'pdf' " set default tex target to latex
let g:Tex_MultipleCompileFormats = 'dvi,pdf' " make shure pdf targets are compiled multiple times if neccecary
let g:Tex_CompileRule_pdf = 'pdflatex -synctex=1 -interaction=nonstopmode $*' " set tex compile target to use synctex for forwards search in viewer
" WINDOWS: set SumatraPDF as viewer and set it up for backwards search
"let g:Tex_ViewRule_pdf = 'SumatraPDF -inverse-search "gvim -c \":RemoteOpen +\%l \%f\""'

" modify environment mappings
let g:Tex_PromptedEnvironments =
	\ 'equation,equation*,align,align*,$$,eqnarray*,eqnarray'
let g:Tex_HotKeyMappings = 
	\ 'equation*,equation,bmatrix'

" only a little indentation but tabstops stay longer
autocmd FileType tex setlocal expandtab shiftwidth=2 tabstop=4 softtabstop=2


" ##### MATLAB #####
" ##################

" from the matlab.vim package
"source $VIMRUNTIME/macros/matchit.vim 
" for the mlint compiler
"autocmd BufEnter *.m    compiler mlint 
" set tabstops etc. to 4 spaces
autocmd FileType matlab setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4

" ##### vim-pandoc options #####
" ########################

autocmd FileType pandoc setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4

let g:pandoc#command#latex_engine = 'pdflatex'

" ##### My mappings #####
" Taglist plugin
nnoremap <silent> <F8> :TlistToggle<CR>
" change current directory to where the opend file resides in
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
" Explore current directory to where the opend file resides in
nnoremap <leader>E :E %:p:h<CR>
" vim-latex save and compile
nnoremap <F2> :w<CR><leader>ll
" toggle search highlighting
nnoremap <leader>hl set hlsearch!<CR>


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
