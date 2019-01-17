" Author: https://github.com/XaheenA

set nocompatible              " rest in peace great Vi
"================================================================================================"
"                                 Vim Plug
"================================================================================================"
call plug#begin()

" deoplete auto completion -------------------------
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

Plug 'zchee/deoplete-jedi',          { 'for': 'python'}        		" auto completion for Python
Plug 'tweekmonster/deoplete-clang2', { 'for': ['c', 'cpp', 'objc','cxx', 'cmake', 'clang']}    " auto completion for c/c++
" Plug 'zchee/deoplete-clang',       { 'for': ['c', 'cpp', 'objc','cxx', 'cmake', 'clang']}    " auto completion for c/c++
" Plug 'Shougo/denite.nvim'

" java autocomplete
Plug 'artur-shaik/vim-javacomplete2',       { 'for': 'java' } 
Plug 'vim-scripts/java_getset.vim',         {'for': 'java'}
Plug 'tfnico/vim-gradle',                   

" c-family code formatter  ----------------------------------
Plug 'rhysd/vim-clang-format',     { 'for': ['c', 'cpp', 'java']}

" python formatter
Plug 'Chiel92/vim-autoformat',       { 'for': ['python', 'scala']} 


" Code snippets --------------------------------------
Plug 'SirVer/ultisnips'               " tracking the snippet engine
Plug 'https://github.com/XaheenA/vim-snippets'           " custom snippets
Plug 'ervandew/supertab'              " supertab makes tab work with auto complete and ultisnips

" Code highlighting and linting ----------------------------
Plug 'scrooloose/syntastic' "Run linters and display errors etc
" Plug 'neomake/neomake',               { 'for': ['scala', 'java']}
Plug 'vim-scripts/HTML-AutoCloseTag', { 'for': 'html' }
Plug 'gko/vim-coloresque'             " show colors when put color values
Plug 'machakann/vim-highlightedyank'  " highlights yanked region
Plug 'jiangmiao/auto-pairs'           " MANY features, but mostly closes ([{' etc
Plug 'tpope/vim-surround'             " enable change around ys..,cs..,ds..

" Themes and Aesthetics  -----------------------------------
Plug 'morhetz/gruvbox'                " super mega awesome colorscheme
Plug 'flazz/vim-colorschemes'         " Huge collection of colorschemes(gruvbox, Monokai, feral, railscasts,donbass)
" Plug 'mhinz/vim-janah'                " super awesome colorscheme
" Plug 'ayu-theme/ayu-vim'  
" Plug 'cocopon/iceberg.vim'
" Plug 'kadekillary/subtle_solo'
" Plug 'jacoborus/tender.vim'
" Plug 'chriskempson/base16-vim'        " >> BEST
" Plug 'rafi/awesome-vim-colorschemes'  " solarized8 is good
" Plug 'altercation/vim-colors-solarized'  
" Plug 'trevordmiller/nova-vim'  

Plug 'mhinz/vim-startify'             " awesome vim startup screen
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes' " on statusline

" Git stuff
Plug 'tpope/vim-fugitive' 		        " git wrapper and shows git status
Plug 'airblade/vim-gitgutter'

" File tree viewer ---------------------------------------
Plug 'scrooloose/nerdtree',           { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin',   { 'on':  'NERDTreeToggle' }
Plug 'ryanoasis/vim-devicons' | Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'francoiscabrol/ranger.vim'

" ctrl+p and  extention of CtrlP -------------
Plug 'ctrlpvim/ctrlp.vim'| Plug 'DavidEGx/ctrlp-smarttabs'
" Plug 'wincent/command-t'

" toggle comment with "gcc" and in visual mode, "gc"
Plug 'vim-scripts/tComment'

" Reads any .editorconfig files and sets spacing etc automatically
Plug 'editorconfig/editorconfig-vim'

" vim wiki -  Diary, notes, whatever. Use <Leader>w
" Plug 'vimwiki/vimwiki'

" Open file in a specific line >> nvim test.c:119
Plug 'bogado/file-line'

" Line indent viewer
Plug 'Yggdroot/indentLine'          " show indent lines (mapped with ,il)

" Vim multiple cursors
Plug 'terryma/vim-multiple-cursors'

" interactive scratchpad for python,R,cpp...
Plug 'metakirby5/codi.vim',               { 'for': ['r', 'cpp', 'python']}  

" ------------- ------------- writing plugins ------------- -------------
" Goyo is the plugin for full-screen writing
Plug 'junegunn/goyo.vim' | Plug 'junegunn/limelight.vim'
Plug 'plasticboy/vim-markdown',           { 'for': ['markdown', 'text'] }
Plug 'davinche/godown-vim',               { 'for': 'markdown' }
Plug 'godlygeek/tabular',                 { 'for': ['markdown', 'text'] }
" Plug 'shime/vim-livedown',              { 'for': 'markdown'}

" https://www.webpagefx.com/tools/emoji-cheat-sheet/
Plug 'fszymanski/deoplete-emoji',         { 'for': 'markdown'} 
" Plug 'junegunn/vim-emoji'
" Plug 'tpope/vim-markdown',              { 'for': ['markdown', 'text'] }
" Plug 'jtratner/vim-flavored-markdown',  { 'for': ['markdown', 'text'] }

Plug 'vim-pandoc/vim-pandoc',             { 'for': ['markdown', 'text'] }
Plug 'vim-pandoc/vim-pandoc-syntax',      { 'for': ['markdown', 'pandoc'] }
Plug 'reedes/vim-pencil',                 { 'for': ['markdown', 'text'] }

Plug 'ron89/thesaurus_query.vim'
" Plug 'reedes/vim-wordy',                  { 'for': ['markdown', 'text'] }
" Plug 'drougas/vim-pythesaurus'            { 'for': ['markdown', 'text'] }
" Plug 'beloglazov/vim-online-thesaurus',   { 'for': ['markdown', 'text'] }

" need to TEST these ..............
Plug 'rhysd/vim-grammarous',              { 'for': ['markdown', 'text','tex'] }

" https://github.com/dpelle/vim-LanguageTool
Plug 'dpelle/vim-LanguageTool',           { 'for': ['markdown', 'text','tex'] }

" ------------- ------------- LaTex plugins ------------- -------------
Plug 'lervag/vimtex',                   { 'for': 'tex' }    " this one is enough-use local leader
Plug 'poppyschmo/deoplete-latex',       { 'for': 'tex' }    " autocompletion for latex

" Plug 'donRaphaco/neotex',               { 'for': 'tex' }
" Plug 'xuhdev/vim-latex-live-preview',   { 'for': 'tex' }
" Plug 'LaTeX-Box-Team/LaTeX-Box',        { 'for': 'tex' }
" Plug 'lionawurscht/deoplete-biblatex',  { 'for': 'tex' } "Deoplete-biblatex offers completion of biblatex ids
" Plug 'sciunto-org/python-bibtexparser', { 'for': 'tex' } "needed for biblatex
" Plug 'brennier/quicktex',               { 'for': 'tex' }

" ------------- ------------- Scala plugins ------------- -------------
" follow -> https://medium.com/@alandevlin7/neovim-scala-f392bcd8b7de
" scala autocomplete with ensime server
" http://ensime.github.io/editors/vim/install/    --> ***follow the instructions
" Plug 'ensime/ensime-vim',                 { 'do': ':UpdateRemotePlugins' }
" Plug 'ktvoelker/sbt-vim',                 { 'for': 'scala' } 
" Plug 'derekwyatt/vim-scala',              { 'for': 'scala' } 
" Plug 'sheerun/vim-polyglot',              { 'for': 'scala' } 

" ------------- ---------- SQL Plugins ----------------- -----------------
Plug 'joereynolds/SQHell.vim',              { 'for': 'sql' }
Plug 'exu/pgsql.vim',                       
Plug 'magicalbanana/sql-syntax-vim',        { 'for': 'sql' }
Plug 'alcesleo/vim-uppercase-sql',          { 'for': ['sql', 'pgsql'] }

"========================== Misc. Plugins and testing ================================="
Plug 'itchyny/calendar.vim'
Plug 'triglav/vim-visual-increment'         " incremant numbers in visual selection with ctrl-a
" Plug 'mhinz/vim-rfc'
" Plug 'vim-scripts/rfc-syntax',            { 'for': 'rfc' } " optional syntax highlighting for RFC files

" R in vim --> https://kadekillary.work/post/nvim-r/
" Plug 'jalvesaq/Nvim-R'
" Plug 'vim-pandoc/vim-rmarkdown'

" :HackerNews -> o or O to open, u to go back
Plug 'dansomething/vim-hackernews'          " Browse Hacker News inside Vim

call plug#end()
"================================================================================================"
