" Author: https://github.com/XaheenA
"================================================================================================"
"================================= GENERAL SETTINGS ============================================
"================================================================================================"
syntax enable
set encoding=utf-8
filetype plugin indent on      " load filetype-specific indent files
set smartindent
let mapleader=","              " leader is comma and space is localleader
let maplocalleader=' '
set updatetime=1000            " default is 4000
" OPEN URL USING --> gx
"==========================================================================="

" More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.
set fillchars+=vert:│	" better looking for windows separator
" Resize splits when the window is resized
" autocmd  VimResized * exe "normal! \<c-w>=    

" Faster split resizing with (+,-)
if bufwinnr(1)
    map + <C-W>+
    map - <C-W>-
    map = <C-W>=
    nnoremap <silent> <Leader>+ :exe "vertical resize +7" <CR>
    nnoremap <silent> <Leader>- :exe "vertical resize -7" <CR>
endif
 
" vertical and Horizontal split
nnoremap <Leader>vs :vsplit 
nnoremap <Leader>hs :split 

" Terminal emulator  =======================
" open terminal with ,tr or ,tv
" vertical and Horizontal split bash terminal
augroup terminal_buffer
    autocmd!
    autocmd VimResized * :wincmd =   " Working with split screen nicely
    autocmd BufWinEnter,WinEnter term://* exec 'normal! i'
    autocmd BufLeave term://* stopinsert
augroup END
nnoremap <leader>tv :vsplit \| terminal<CR>
nnoremap <leader>tr :split \| terminal<CR>
" nnoremap <leader>tr :belowright split term://bash
" nnoremap <leader>tv :belowright vsplit term://bash

" To map <Esc> to exit terminal-mode:
tnoremap <Esc> <C-\><C-n>
"=================================================================================="
" Search and Replace
" read - http://vim.wikia.com/wiki/Search_and_replace
" and - https://medium.com/@schtoeffel/you-don-t-need-more-than-one-cursor-in-vim-2c44117d51db
" %s/foo/<c-r><c-a>/g   " Replace each occurrence of 'foo' with the WORD under the cursor (delimited by whitespace).
" nnoremap <leader>sr :%s//<Left><Left>	   "Change all matching of 'search' to 'replace'
"Change only whole words exactly matching 'search' to 'replace' with -confirmation.
nnoremap <leader>sr :%s/\<S\>/R/gc

" replace visually selected section
" TODO

" going to the next one in a search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" Same when moving up and down
noremap <C-d> <C-d>zz
noremap <C-u> <C-u>zz
noremap <C-f> <C-f>zz
noremap <C-b> <C-b>zz

" search the number of occurences of search with ,sc
nnoremap <leader>sc :%s/s//gn
inoremap <leader>sc <Esc>:%s/s//gn

" search exact word
nnoremap <leader>se :/\<here\>

" press ,sh to toggle hlsearch
nnoremap <silent><expr> <leader>sh (&hls && v:hlsearch ? ':nohls' : ':set hls')."\n"

" sort visually selected texts
vnoremap <leader>so :sort<CR>

"=================================== Buffers ==================================="
" search in all buffers/tabs/splits
nnoremap  <leader>sb :cex [] <Bar> bufdo vimgrepadd /foo/g % <Bar> cw

" move around buffers
nnoremap  <leader>bn : bn <cr>
nnoremap  <leader>bp : bp <cr>

" open all buffers in it's own tab
nnoremap <leader>bt :bufdo tab split<CR>:tablast<CR>:tabclose<CR>:syntax on<CR>

" Close the current buffer
map <leader>bc :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>BC :bufdo bd<cr>

" Quickly open a buffer for scribble
map <leader>bo :e ~/Documents/tests/buffer<cr>

" Quickly open a markdown buffer for scribble
map <leader>bm :e ~/Documents/tests/buffer.md<cr>

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction
"============================ spell check=========================================="
set nospell             " no spell checking
nnoremap <leader>le :setlocal spell! spelllang=en_us<CR>
nnoremap <leader>ld :setlocal spell! spelllang=de_de<CR>
nnoremap <leader>ln :setlocal spell! nospell<CR>
nnoremap <leader>sn ]s
nnoremap <leader>sp [s
nnoremap <leader>sa zg
nnoremap <leader>s= z=
"============================ Navigation ==========================================="
" jj is the ESCAPE(esc)
inoremap jj <Esc>

"The following trick means that the cursor will not move if ESC is pressed
set virtualedit=onemore
inoremap <Esc> <Esc>`^

" Move up/down editor lines
nnoremap j gj
nnoremap k gk
nnoremap J 7j
"  0 beginning of the line, $ end of the line, ^ first nonblack charecter
nnoremap B ^
nnoremap E $
" noremap  K 5k 			-> instead open man page with it
" nnoremap <leader>d ddO<Esc> 		" delete the current line and insert a new line there -> S or cc
" inoremap <leader>d <Esc>dd$ 
" delete line in insert mode 		
inoremap <C-d> <Esc>ddO

" Use urlview to choose and open a url:
"nnoremap <leader>U :w<Home>silent <End> !urlview<CR>  " doesnt work on neovim
nnoremap <leader>U :term urlview %<CR>i


" tab navigation mappings
nnoremap tn :tabnext<CR>
nnoremap tp :tabprev<CR>
nnoremap tm :tabm<Space>
nnoremap tt :tabnew<Space>
nnoremap ts :tab split<CR>  		" copy current split and create new tab of its own
nnoremap tc :tabclose<CR>   		" close current tab


" Move visual block
vnoremap J :move '>+1<CR>gv=gv
vnoremap K :move '<-2<CR>gv=gv

" navigate windows with meta+arrows (alt+Arrow)
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
"============== Copy and Paste stuff ===================="
" -------- Only works with neovim -----------------
" save all buffers with ctrl+s
map  <c-s> <nop>
nnoremap <c-s> :wa<CR>
vnoremap <c-s> <Esc><c-s>gv
inoremap <c-s> <Esc>b:wa<CR>  " instead of Esc, use <c-o> to stay in insert mode after saving

map <c-a> <nop>
nnoremap <c-a>      gg0VG$             " select all with CTRL+a
inoremap <c-a> <Esc>gg0VG$
" ============ Adding copy paste functionality like windows ============
set clipboard=unnamedplus
" vmap <C-c> "+y
vnoremap <C-c> "*y :let @+=@*<CR>
vnoremap <C-x> "+c
vnoremap <C-v> c<ESC>"+p
inoremap <C-v> <ESC>"+pa
" ------------------------------------------------
" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy
nnoremap  <leader>Y  "+yg_

" Paste from clipboard
nnoremap <leader>pp "+P
vnoremap <leader>pp "+P

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy, which is the default
map Y yg_

" Align blocks of text and keep them selected
vmap < <gv
vmap > >gv

"==========================================================================="
set mouse=a             " enable mouse scrolling with scroll wheel also select all mood
" Highlight all occurrence of a selected word like notepad++
nnoremap <silent> <2-LeftMouse> :let @/='\V\<'.escape(expand('<cword>'), '\').'\>'<cr>:set hls<cr>
set expandtab           " Insert spaces when TAB is pressed.
set tabstop=4           " number of visual spaces per TAB
set softtabstop=4       " number of spaces in tab when editing
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)
set shiftwidth=4        " Indentation amount for < and > commands.

set number relativenumber   " show line numbers
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
set lazyredraw          " redraw only when we need to.

set path+=**		    " Search down into subfolders
set ignorecase          " When both ingnorecase and smartcase are on,
set smartcase           " if a pattern contains an uppercase, its only then case sensitive
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set ruler               " Display the cursor position on the last line of the screen
set conceallevel=0	" do not hide markdown
set isfname-==		" remove "=" from file name completion

" Local directories {{{
" set nobackup
" set undofile
set noswapfile          " no swap files
set backupdir =~/.vim/dirs/backups
set directory =~/.vim/dirs/directory
set undodir   =~/.vim/dirs/undos
"===================================================="
" set modelines=1
set hidden		 " Allow hidden buffers
set laststatus=2	 " Status bar
set showmode             " Shows Insert or command mode

set fileformats=unix,dos,mac
set formatprg=par\ -w80rj          " sudo apt install par

if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif

" % key --> jump arooud matching parenthesises, comments...
set showmatch
set matchtime=3
set mps+=<:>            " see :h matchpairs

set autoread            " Set to auto read when a file is changed from the outside
set nowrap              " don't wrap lines
set title               " change the terminal's title
set novisualbell        " don't beep
set noerrorbells        " don't beep
set nolist              " Show problematic characters.

"Map <C-L> (redraw screen) to also turn off search highlighting until the next search
nnoremap <C-L> :nohl<CR><C-L> 

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
cnoremap w! w !sudo tee > /dev/null %

" Press F2 or ctrl+s to save from anymode
" Insert mode it will save and go back to inser mode"
nnoremap <F2> <Esc>:wq<CR>
inoremap <F2> <Esc>:wq<CR>
vnoremap <F2> <Esc><F2>gv
" inoremap <F2> <ESC>:w<CR>i    " in Insert mode it will save and go back to insert mode
nnoremap <F3> <ESC>:wa<CR>
" inoremap <F3> <c-o>:w<cr>     " save and go to normal mode
nnoremap    Q :qa!<CR>
" nnoremap    W :wa<CR>
cnoreabbrev Q q
" if accidentally pressed Q
cnoreabbrev Q! q! 

" Bash like keys for the command line
cnoremap <C-A>		<Home>
cnoremap <C-E>		<End>
cnoremap <C-K>		<C-U>
" Map Alt-v in command-line mode to replace the commandline with the Ex
" command-line beneath the cursor in the buffer
cnoremap <M-v> <C-\>esubstitute(getline('.'), '^\s*\(' . escape(substitute(&commentstring, '%s.*$', '', ''), '*') . '\)*\s*:*' , '', '')<CR>
" press Alt-e to execute the current line under curser in shell
nnoremap  <M-e> !!bash<CR>

" Press ,o and ,O to insert a blnnk line after and before
nnoremap <Leader>o o<Esc>k
nnoremap <Leader>O O<Esc>j
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
set wildignore+=*.orig,*.rej 		  " Merge resolution files"
set wildignore+=*.stats,*.bak     	  " Pylint stats and backup file

"===================================================="
" Netrw supports reading and writing files across networks
let g:netrw_winsize = 15
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
nnoremap <leader>ve :Vexplore<CR>

"===================================================="

" No More up down arrow Keys when you are in vim
nnoremap <down> :echom "-_- stop being lazy!!!"<Esc>
nnoremap <up> :echom "-_- stop being lazy!!!"<Esc>
nnoremap <left> :echom "-_- stop being lazy!!!"<Esc>
nnoremap <right> :echom "-_- stop being lazy!!!"<Esc>
vnoremap <down> :echom "-_- stop being lazy!!!"<Esc>
vnoremap <up> :echom "-_- stop being lazy!!!"<Esc>
vnoremap <left> :echom "-_- stop being lazy!!!"<Esc>
vnoremap <right> :echom "-_- stop being lazy!!!"<Esc>
" inoremap <up> <nop>
" inoremap <down> <nop>
" inoremap <left> <nop>
" inoremap <right> <nop>

"============================================================="
"                       Function Setup                        "
"============================================================="
nnoremap <F5> :call Compile_and_Run()<CR>
func! Compile_and_Run()
exec "w"
if &filetype == 'c'
exec "!rm -v %<.o"
exec "!time gcc -v % -Wall -Werror -std=c99 -o %<.o"
" exec "!time ./%<.o"
:vsplit term://./%<.o

elseif &filetype == 'cpp'
exec "!rm -v %<.o"
exec "!time g++ % -Wall -Werror -o %<.o"
" exec "!time ./%<.o"
:vsplit term://./%<.o

elseif &filetype == 'vhdl'
" :vsplit term://ghdl -a %:r* && ghdl --elab-run %:r && ghdl -r %:r --vcd=%:r.vcd && gtkwave %:r.vcd
:vsplit term:///home/xollad/dotfiles/others/ghdl_all.sh %:r

elseif &filetype == 'java'
echo "Compiling Java Code...."
exec "!time javac %"
" exec "!time java -cp %:p:h %:t:r"
:vsplit term://java -cp %:p:h %:t:r

elseif &filetype == 'scala'
echo "Compiling scala Code...."
exec "!time scalac %"
" exec "!time scala -cp %:p:h %:t:r"
:vsplit term://scala -cp %:p:h %:t:r

elseif &filetype == 'sh'
exec "!time bash %"
elseif &filetype == 'python'
exec "!time python3.6 %"
elseif &filetype == 'html'
exec "!firefox % &"
elseif &filetype == 'go'
exec "!go build %<"
exec "!time go run %"
elseif &filetype == 'markdown'
" exec "!~/.vim/markdown.pl % > %.html &"
" exec "!firefox %.html &"
exec "!pandoc --latex-engine=xelatex % -o %.pdf"
" exec "!pandoc --latex-engine=xelatex % -t beamer -o %.pdf" " --> for presentation
elseif &filetype=="awk"
exec "!chmod +x %"
:split term://./%<.awk -cp
endif
endfunc
"===================================================="
if !exists('*s:setupWrapping')
  function s:SetupWrapping()
    set wrap
    set wm=2
    set textwidth=80
  endfunction
endif
com! SW  call SetupWrapping()
"===================================================="
function! ShowDiagrapsh()
    :digraphs
    call getchar()
    return "\<C-K>"
endfunction
inoremap <expr> <C-K> ShowDiagrapsh()
"===================================================="
"Toggle color column
fun! ToggleColorColumn()
  if &cc == ''
    " highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
    " match OverLength /\%>80v.\+/
    " set cc=80
   let &colorcolumn="80,".join(range(81,999),",")
  else
    set cc=
  endif
endfun
nnoremap <leader>cc :call ToggleColorColumn()<CR>
"===================================================="
" for GVIM in windows
" nnoremap <leader>gs :call Google()<CR>
" fun! Google()
"     let keyword = expand("<cword>")
"     let url = "http://www.google.com/search?q=" . keyword
"     let path = "C:/Program Files/Mozilla Firefox/"
"     exec 'silent !"' . path . 'firefox.exe" ' . url
" endfun
"===================================================="
" toggle Relative or absolute number lines
function! NumberToggle()
    if(&rnu == 0)
       set relativenumber
    else
       set norelativenumber
    endif
endfunction
nnoremap <leader>rn :call NumberToggle()<CR>
"===================================================="
" get definition of the word under cursor
  nnoremap <leader>ss :call <SID>SynStack()<CR>
  function! <SID>SynStack()
    if !exists("*synstack")
      return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
  endfunc
"===================================================="
function! WordProcessorMode()
  setlocal formatoptions=1
  setlocal noexpandtab
  " set  spell spelllang=en_us 
  "set thesaurus+=/Users/xollad/.vim/thesaurus/mthesaur.txt
  " setlocal dictionary+=/usr/share/dict/american-english  " Define the dictionaries
  " setlocal complete+=s  "scan the files given with the 'thesaurus' option
  " setlocal formatprg=par
  " setlocal formatprg=par\ -w80rj          " sudo apt install par > now in main settings
  " setlocal complete-=k                  " Completion includes dictionaries
  " setlocal complete+=kspell             " use the currently active spell checking
  setlocal nolist
  setlocal wrap
  setlocal linebreak
  setlocal showbreak=..
  setlocal norelativenumber
  setlocal smartindent
  setlocal textwidth=80
  :normal gg0VGgqgg 
  2mat ErrorMsg '\%81v.'    " color only lines exceeding 80 coloumns
  colorscheme lucius
  LuciusLightLowContrast	" or LuciusDark, LuciusBlack, LuciusLight, LuciusWhite 
endfunction
com! WP  call WordProcessorMode()
nnoremap <Leader>wpm :call WordProcessorMode()<CR>
nnoremap <Leader>ft gg0VGgqgg
"===================================================="
function! WordProcessorEnglish()
  set  spell spelllang=en_us 
  "set thesaurus+=/Users/xollad/.vim/thesaurus/mthesaur.txt
  setlocal dictionary+=/usr/share/dict/american-english  " Define the dictionaries
  setlocal complete+=s  "scan the files given with the 'thesaurus' option
  setlocal complete-=k                  " Completion includes dictionaries
  setlocal complete+=kspell             " use the currently active spell checking
endfunction

com! WPE  call WordProcessorEnglish()
nnoremap <leader>wp :call WordProcessorEnglish()<CR>
nnoremap <leader>gc :GrammarousCheck<CR>

"===================================================="
function! WordProcessorGerman()
  set  spell spelllang=de_de 
  "set thesaurus+=/Users/xollad/.vim/thesaurus/mthesaur.txt
  setlocal complete+=s  "scan the files given with the 'thesaurus' option
  setlocal dictionary+=/usr/share/dict/ngerman  " Define the dictionaries
  setlocal complete-=k                  " Completion includes dictionaries
  setlocal complete+=kspell             " use the currently active spell checking
  call ToggleColorColumn()
  2mat ErrorMsg '\%81v.'    " color only lines exceeding 80 coloumns
endfunction

com! WPD  call WordProcessorGerman()
nnoremap <LocalLeader>wp :call WordProcessorGerman()<CR>
"===================================================="
" press ,dw to delete trailing white spaces
nnoremap <leader>dw :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
"===================================================="
" Toggle Wrap
nnoremap <leader>wt :set wrap!<CR>
" =================================================================
" File type and folding
" close all folds zM. fold level by level zm. open all folds zR and zr (level by level).""
set foldenable          	" enable folding
set foldmethod=syntax
" fold based on indent level or use >> set foldmethod=syntax "
" set foldmethod=marker   	"-> equivalent to enabling folding based on regions in Visual Studio Code
set foldmarker=##-,-##  	"-> configuration for the fold markers, their default values are {{{,}}}

" press ,fc to fold the entire code
nnoremap <leader>fc :set foldlevel=2<CR> zM<CR>
nnoremap <leader>fo zR<CR>
set foldlevelstart=5   	" open most folds by default
" set foldcolumn=4      " uncomment it when using folds
" set foldnestmax=1    	" 1 nested fold max


"*****************************************************************************
"                           Autocmd Rules
"*****************************************************************************
augroup languages
  autocmd!
    " omnifunctions
    autocmd FileType css        setlocal omnifunc=csscomplete#CompleteCSS 
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python     setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml        setlocal omnifunc=xmlcomplete#CompleteTags
    autocmd FileType sql        setlocal omnifunc=sqlcomplete#Complete
    autocmd FileType markdown   setlocal noexpandtab  ts=4 sw=4
    autocmd FileType java,python   setlocal softtabstop=4 shiftwidth=4 expandtab
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType json       setlocal foldmethod=syntax
    " autocmd FileType java setlocal completefunc=javacomplete#CompleteParamsInfo
    autocmd FileType java       setlocal omnifunc=javacomplete#Complete   "java deoplete- 'artur-shaik/vim-javacomplete2'     
    autocmd FileType c,cpp,java setlocal mps+==:;
    autocmd FileType c,cpp,java setlocal equalprg=clang-format foldmethod=syntax
    autocmd BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main
    autocmd FileType python     setlocal foldmethod=indent foldlevel=1000
    autocmd BufWritePost *.scala silent :EnTypeCheck
    " autocmd BufNewFile,BufRead *.sql setf pgsql
    " autocmd BufWrite *.py,*.scala, *.js, *.json :Autoformat         " Chiel92/vim-autoformat > showing error
    " autocmd FileType text call WordProcessorMode()
augroup END

" Improve autocomplete menu color
highlight   clear
highlight   Pmenu         ctermfg=0 ctermbg=2
highlight   PmenuSel      ctermfg=0 ctermbg=7
highlight   PmenuSbar     ctermfg=7 ctermbg=0
highlight   PmenuThumb    ctermfg=0 ctermbg=7

" Read PDF files in vim with ":Rpdf example.pdf" command
:command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> -
:command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> - |fmt -csw78

" END FILETYPES
"======================================================================"
" Diff mode settings
if &diff
    set diffopt=filler,vertical,iwhite " ignore case, add fillers  and open vsplit
	set diffexpr=DiffW()
endif

function DiffW()
  let opt = ""
   if &diffopt =~ "icase"
     let opt = opt . "-i "
   endif
   if &diffopt =~ "iwhite"
     let opt = opt . "-w " " swapped vim's -b with -w
   endif
   silent execute "!diff -a --binary " . opt .
     \ v:fname_in . " " . v:fname_new .  " > " . v:fname_out
endfunction

"======================================================================"
" use ,df to see the changes made in the file before saving
nnoremap <silent><leader>df :w !git diff % -<CR>
augroup vimdiff_au
autocmd!
autocmd VimEnter,BufEnter,BufWinEnter * silent! iunmap <buffer> <M-">
augroup END
" let g:quicktex_trigger = "\t"
"==================================================="
" Remember cursor position between vim sessions
augroup remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END
"==================================================="
"" The PC is fast enough, do syntax highlight syncing from start unless 200 lines
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END
"======================================================================"
"" text wrapping for txt
" augroup vimrc-wrapping
"   autocmd!
"   autocmd BufRead,BufNewFile *.txt call s:SetupWrapping()
" augroup END
"======================================================================"
" opening man page of the word under cursor with K

" mkview 
" augroup mk_view
"     autocmd!
"     autocmd BufWinLeave *.* mkview
"     autocmd BufWinEnter *.* silent loadview
" augroup end
" ====================================================================="
" GPG with vim
" Transparent editing of gpg encrypted files.
" By Wouter Hanegraaff (https://www.endpoint.com/blog/2012/05/16/vim-working-with-encryption)
augroup encrypttion
  autocmd!
  " First make sure nothing is written to ~/.viminfo while editing
  " an encrypted file.
  autocmd BufReadPre,FileReadPre *.gpg set viminfo=
  " We don't want a swap file, as it writes unencrypted data to disk
  autocmd BufReadPre,FileReadPre *.gpg set noswapfile
  " Switch to binary mode to read the encrypted file
  autocmd BufReadPre,FileReadPre *.gpg set bin
  autocmd BufReadPre,FileReadPre *.gpg let ch_save = &ch|set ch=2
  " (If you use tcsh, you may need to alter this line.)
  autocmd BufReadPost,FileReadPost *.gpg '[,']!gpg --decrypt 2> /dev/null
  " Switch to normal mode for editing
  autocmd BufReadPost,FileReadPost *.gpg set nobin
  autocmd BufReadPost,FileReadPost *.gpg let &ch = ch_save|unlet ch_save
  autocmd BufReadPost,FileReadPost *.gpg execute ":doautocmd BufReadPost " . expand("%:r")
  " Convert all text to encrypted text before writing
  " (If you use tcsh, you may need to alter this line.)
  autocmd BufWritePre,FileWritePre *.gpg '[,']!gpg --default-recipient-self -ae 2>/dev/null
  " Undo the encryption so we are back in the normal text, directly
  " after the file has been written.
  autocmd BufWritePost,FileWritePost *.gpg u
augroup END


" =========== =========  abbrebiations =======================================
iabbr myemail mr.robot.de@yandex.com

" =========== Delete Trailing Whitespaces ================================
" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

com! DTWS call DeleteTrailingWS()

augroup DeleteTrailingWhiteSpace
  autocmd!
  autocmd BufWrite *.html :call DeleteTrailingWS()
  autocmd BufWrite *.js :call DeleteTrailingWS()
  autocmd BufWrite *.py :call DeleteTrailingWS()
  autocmd BufWrite *.c :call DeleteTrailingWS()
  autocmd BufWrite *.java :call DeleteTrailingWS()
augroup END
