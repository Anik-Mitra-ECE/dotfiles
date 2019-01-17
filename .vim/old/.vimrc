
""""""""""""""""""""VUNDLE CONFIG""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

:" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'Chiel92/vim-autoformat'
Plugin 'flazz/vim-colorschemes'
Plugin 'itchyny/lightline.vim' 	  " Statusline in vim
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'bogado/file-line'         " open file at a specific line   $ vim test.c:115
Plugin 'kien/ctrlp.vim'           " fuzzy file finder using CTRL+P
Plugin 'DavidEGx/ctrlp-smarttabs' " While inside ctrlp, CTRL+F to see the tabs
Plugin 'kuoe0/vim-janitor'
""toggle comment with >> "gcc" and in visual mode, "gc"
Plugin 'vim-scripts/tComment'

" Reads any .editorconfig files and sets spacing etc automatically
Plugin 'editorconfig/editorconfig-vim'


" Code snippets -------------------------- -------------------------
Plugin 'SirVer/ultisnips'             " tracking the snippet engine
Plugin 'ZaheenAzad/vim-snippets'           " main engine for the snippet
Plugin 'ervandew/supertab'              " supertab makes tab work with autocomplete and ultisnips


Plugin 'fisadev/vim-isort'
if has('python')
  Plugin 'pignacio/vim-yapf-format'
  Plugin 'vim-scripts/indentpython.vim'
endif

" terminal inside vim
" read -> https://www.micronbot.com/useful-plugins/vim-conque-term.html
Plugin 'rosenfeld/conque-term'

" Bundle 'Valloric/YouCompleteMe'

call vundle#end()            " required
" allow plugins by file type (required for plugins!)
filetype plugin on
filetype indent on
"=========================================================="
"""" Settings yapf
map <C-o> :YapfFullFormat<CR>
imap <C-o> <ESC>:YapfFormat<CR>i
vmap <C-o> :YapfFormat<CR>

"""" Settings for ctrlp
" don't change working directory
let g:ctrlp_working_path_mode = 0
let g:ctrlp_extensions = ['smarttabs']
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn|node_modules)$',
  \ 'file': '\.pyc$\|\.pyo$',
  \ }
"========================================================"
-""""""""""""""""Chiel92/vim-autoformat"""""""""""""""""
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0


"""""""""""""""""""Snippet""""""""""""""""""""""
" Trigger configuration.
" press tab to edit the next keyword and ctrl+b to edit previous
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

""""""""""""""""NERDTree""""""""""""""""""""""""""""""
let NERDTreeShowHidden=1
let g:NERDTreeWinSize=45
let NERDTreeMinimalUI=1
let NERDTreeHijackNetrw=1
let NERDTreeCascadeSingleChildDir=0
let NERDTreeCascadeOpenSingleChildDir=0
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeShowIgnoredStatus = 0
let g:NERDTreeDirArrowExpandable = '§'
let g:NERDTreeDirArrowCollapsible = 'x'
let NERDTreeIgnore=['\.pyc$', '\~$','\.vim$','\.o$''\.swp$','\.git$'] "ignore files in NERDTree


""""""""""""""""Airline""""""""""""""""""""""""""""""
" Allow powerline symbols to show up
let g:airline_powerline_fonts = 1
let g:airline_left_sep  = '>> '
let g:airline_right_sep = '<< '
let g:airline_left_alt_sep = '>'
let g:airline_right_alt_sep = '>'
let g:airline#extensions#tabline#enabled = 2
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = '§'
let g:airline#extensions#tabline#left_alt_sep = '>'
let g:airline#extensions#tabline#right_sep = '§'
let g:airline#extensions#tabline#right_alt_sep = '>'

let g:airline_theme= 'luna'
"================================================================"
""" Extra confuguration needed for C autocompletion in YOUCompleteMe
""" Read : https://wiki.archlinux.org/index.php/Vim/YouCompleteMe#C.2FC.2B.2B
""" Read : http://unixnme.blogspot.de/2017/03/how-to-install-youcompleteme-vim-plugin.html
" let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
"==================================================================================="

let g:scavenger_auto_clean_up_on_write = 1
colorscheme Monokai


"============================ ======================= ==========================================="


syntax enable
filetype plugin on
filetype indent on      " load filetype-specific indent files
let mapleader=","       " leader is comma

"==========================================================================="
" toggle gundo
nnoremap <leader>u :GundoToggle<CR>

" vertical and Horizontal split
nnoremap <leader>vs :vsplit<CR>
nnoremap <leader>hs :split<CR>

" ============ Terminal emulator  ================
" open terminal with ,tr or ,tv
" nnoremap <leader>tr :belowright split term://bash
" nnoremap <leader>tv :belowright vsplit term://bash
" To map <Esc> to exit terminal-mode:

" vertical and Horizontal split bash terminal
nnoremap <leader>tv :vsplit \| terminal<CR>
nnoremap <leader>tr :split \| terminal<CR>

" Toggle NERDtree with ,ne and F6
nnoremap <leader>ne :NERDTreeToggle<cr>
nnoremap <F6> :NERDTreeToggle<CR>

""""""""""Adding copy paste functionality like windows"""""""""
set clipboard=unnamedplus
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa
"=================================================================================="
" Search and Replace
" read - http://vim.wikia.com/wiki/Search_and_replace
" and - https://medium.com/@schtoeffel/you-don-t-need-more-than-one-cursor-in-vim-2c44117d51db
" %s/foo/<c-r><c-a>/g   " Replace each occurrence of 'foo' with the WORD under the cursor (delimited by whitespace).
" nmap <Leader>sr :%s//<Left><Left>	   "Change all matching of 'search' to 'replace'
"Change only whole words exactly matching 'search' to 'replace' with -confirmation.
nnoremap <Leader>sr :%s/\<s\>/r/gc

" search the number of occurences of search with ,sc
nnoremap <Leader>sc :%s/s//gn
inoremap <Leader>sc <Esc>:%s/s//gn

" press ,sh to toggle hlsearch
nnoremap <silent><expr> <Leader>sh (&hls && v:hlsearch ? ':nohls' : ':set hls')."\n"

"============================ Navigation ==========================================="
" jj is the ESCAPE(esc)
inoremap jj <Esc>

"The following trick means that the cursor will not move if ESC is pressed
set virtualedit=onemore
inoremap <Esc> <Esc>`^


" move to beginning/end of line
nnoremap B 0
nnoremap E $
" $/0 doesn't do anything
" nnoremap $ <nop>
" nnoremap 0 <nop>

" Move up/down editor lines
nnoremap j gj
nnoremap k gk
noremap H 5h
noremap L 5l
noremap J 5j
noremap K 5k
nnoremap <Leader>d ddO<Esc> 		" delete the current line and insert a new line there
" tab navigation mappings
nnoremap tn :tabnext<CR>
nnoremap tp :tabprev<CR>
nnoremap tm :tabm<Space>
nnoremap tt :tabnew<Space>
nnoremap ts :tab split<CR>  		" copy current windown and create new tab of its own
nnoremap tc :tabclose<CR>   		" close current tab

" Move visual block
vnoremap J xp´[V´]
vnoremap K xkp´[V´]

" navigate windows with meta+arrows (altGr+Arrow)
map <M-Right> <c-w>l
map <M-Left> <c-w>h
map <M-Up> <c-w>k
map <M-Down> <c-w>j
imap <M-Right> <ESC><c-w>l
imap <M-Left> <ESC><c-w>h
imap <M-Up> <ESC><c-w>k
imap <M-Down> <ESC><c-w>j

"==========================================================================="
" To use `ALT+{h,j,k,l}` to navigate windows from any mode:
tnoremap <Esc> <C-\><C-n>
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

"==========================================================================="
""" Press F2 or ctrl+s to save from anymode
" Insert mode it will save and go back to inser mode"
nnoremap <F2> :w<CR>
vmap <F2> <Esc><F2>gv
" inoremap <F2> <ESC>:w<CR>i  " in Insert mode it will save and go back to insert mode"
inoremap <F3> <c-o>:w<cr>     " save and go to normal mode
" --------Only works with neovim-----------------
nmap <c-s> :wa<CR>
vmap <c-s> <Esc><c-s>gv
imap <c-s> <c-o><c-s>   "
" ------------------------------------------------

" --------status line -----------
set statusline+=%#warning#
" set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
"==========================================================================="
set mouse=a             " enable mouse scrolling with scroll wheel also select all visual mood
set expandtab           " Insert spaces when TAB is pressed.
set tabstop=4           " number of visual spaces per TAB
set softtabstop=4       " number of spaces in tab when editing
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)
set shiftwidth=4        " Indentation amount for < and > commands.

set number relativenumber   " show line numbers
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
set lazyredraw          " redraw only when we need to.

set path+=**	        " Search down into subfolders
set ignorecase          " When both ingnorecase and smartcase are on,
set smartcase           " if a pattern contains an uppercase, its only then case sensitive
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

"===================================================="
" set modelines=1
set hidden		        " Allow hidden buffers
set ttyfast		        " Rendering
set laststatus=2	    " Status bar
set showmode            " Shows Insert or command mode

set shell=/bin/bash

" For % key --> jump arooud matching parenthesises, comments...
set showmatch
set matchtime=3

set autoread            " Set to auto read when a file is changed from the outside
set nowrap              " don't wrap lines
set title               " change the terminal's title
set visualbell          " don't beep
set t_vb=               " don't show visual bell
set nolist              " Dont Show problematic characters.

" More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.

if !&scrolloff
   set scrolloff=3      " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
   set sidescrolloff=5  " Show next 5 columns while side-scrolling.
endif
set nostartofline       " Do not jump to first character with page commands.
"===================================================="
" (useful for handling the permission-denied error) saves the file as SUDO all time
" enter ":W" to save as sudo
cnoremap W w !sudo tee > /dev/null %
" Working with split screen nicely - Resize Split When the window is resized"
au VimResized * :wincmd =
autocmd FileType c,cpp,java setlocal equalprg=clang-format   " but you need >> sudo apt install clang-format
"===================================================="
" Wildmenu completion "
set wildmenu            		      " visual autocomplete for command menu
set wildmode=list:longest
set wildignore+=.hg,.git,.svn 		" Version Controls"
set wildignore+=*.aux,*.out,*.toc "Latex Indermediate files"
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg,*.zip,*.rar         "Binary Imgs"
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest,*.exe,*.so,*.jar  "Compiled Object files"
set wildignore+=*.spl 			  " Compiled speolling world list"
set wildignore+=*.sw? 			  " Vim swap files"
set wildignore+=*.DS_Store 		  " OSX SHIT"
set wildignore+=*.luac			  " Lua byte code"
set wildignore+=migrations 		  " Django migrations"
set wildignore+=*.pyc 			  " Python Object codes"
set wildignore+=*.orig,*.rej      " Merge resolution files"
set wildignore+=*.stats,*.bak     " Pylint stats and backup file

"===================================================="
" Netrw supports reading and writing files across networks
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

"===================================================="

" No More up down arrow Keys when you are in vim
" nnoremap <up> <nop>
" nnoremap <down> <nop>
" nnoremap <left> <nop>
" nnoremap <right> <nop>
" inoremap <up> <nop>
" inoremap <down> <nop>
" inoremap <left> <nop>
" inoremap <right> <nop>

"========================================================"
"            Function Setup                              "
"========================================================"
function! ShowDiagrapsh()
    :digraphs
    call getchar()
    return "\<C-K>"
endfunction

inoremap <expr> <C-K> ShowDiagrapsh()

"===================================================="
" toggle Relative or absolute number lines
function! NumberToggle()
    if(&rnu == 0)
       set relativenumber
    else
       set norelativenumber
    endif
endfunction

nnoremap <Leader>rn :call NumberToggle()<CR>

"===================================================="

" function ShowSpaces(...)
" Implement <<<<<<<<<<
" for now, press ,dw to delete trailing white spaces
" autocmd BufWritePre * :%s/\s\+$//e
"nnoremap <silent><Leader>dw :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
"===================================================="

" press ,wc to toggle wrap
nmap <silent><Leader>wc :set wrap!<CR>

"==========================================================================="


" =================================================================
" File type and folding
" press ,fc to fold the entire code
nnoremap <leader>fc :%g/^{/normal! zf%<Esc>
" close all folds zM. fold level by level zm. open all folds zR and zr (level by level).
set foldenable          	" enable folding
"set foldlevelstart=10   	" open most folds by default
" set foldnestmax=1    		" 2 nested fold max
" autocmd FileType c,cpp,java set foldmethod=syntax
" autocmd FileType Python set foldmethod=indent       " fold based on indent level or use >> set foldmethod=syntax "
" set foldmethod=marker   	"-> equivalent to enabling folding based on regions in Visual Studio Code
set foldmarker=##-,-##  	"-> configuration for the fold markers, their default values are {{{,}}}

 "===================================================="
 "FILETYPES
au BufRead,BufNewFile */templates/*.html setlocal filetype=htmldjango.html
augroup json_autocmd
  autocmd FileType json set foldmethod=syntax
augroup END
au BufRead,BufNewFile rc.lua setlocal foldmethod=marker
au FileType python setlocal foldlevel=1000
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=markdown
au FileType ruby setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType sql DBCheckModeline

" Read PDF files in vim with ":Rpdf example.pdf" command
:command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> -
:command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> - |fmt -csw78
" END FILETYPES }}}
"
"===================================================="
"==========================================================================="










"==========================================================================="
"=========================== Backups ======================================="
" better backup, swap and undos storage
set directory=~/.vim/dirs/tmp     " directory to place swap files in
set backup                        " make backup files
set backupdir=~/.vim/dirs/backups " where to put backup files
set undofile                      " persistent undos - undo after you re-open the file
set undodir=~/.vim/dirs/undos
set viminfo+=n~/.vim/dirs/viminfo
" store yankring history file there too
let g:yankring_history_dir = '~/.vim/dirs/'

" create needed directories if they don't exist
if !isdirectory(&backupdir)
    call mkdir(&backupdir, "p")
endif
if !isdirectory(&directory)
    call mkdir(&directory, "p")
endif
if !isdirectory(&undodir)
    call mkdir(&undodir, "p")
endif
