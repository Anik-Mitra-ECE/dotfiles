" Author: https://github.com/XaheenA

set nocompatible              " rest in peace great Vi
"================================================================================================"
"                                 Vim Plug
"================================================================================================"
call plug#begin()

" deoplete auto completion -------------------------
Plug 'Shougo/deoplete.nvim',       { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi',        { 'for': 'python'}        		" auto completion for Python
Plug 'zchee/deoplete-clang',       { 'for': ['c', 'cpp', 'objc']}    " auto completion for c/c++
" Plug 'Shougo/denite.nvim'

" java autocomplete
Plug 'artur-shaik/vim-javacomplete2',       { 'for': 'java' } 

" c-family code formatter  ----------------------------------
Plug 'rhysd/vim-clang-format',     { 'for': ['c', 'cpp', 'java']}

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
Plug 'jiangmiao/auto-pairs' "MANY features, but mostly closes ([{' etc
Plug 'tpope/vim-surround'              " enable change around ys..,cs..,ds..

" Themes and Aesthetics  -----------------------------------
Plug 'morhetz/gruvbox'                " super mega awesome colorscheme
Plug 'mhinz/vim-janah'                " super awesome colorscheme
Plug 'chriskempson/base16-vim'        " >> BEST
Plug 'altercation/vim-colors-solarized'  
" Plug 'rafi/awesome-vim-colorschemes'  " solarized8 is good
" Plug 'flazz/vim-colorschemes'         " Huge collection of colorschemes(gruvbox, Monokai, feral, railscasts,donbass)
Plug 'mhinz/vim-startify'             " awesome vim startup screen
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes' " on statusline

" Git stuff
Plug 'tpope/vim-fugitive' 		        " git wrapper and shows git status
Plug 'airblade/vim-gitgutter'

" File tree viewer ---------------------------------------
Plug 'scrooloose/nerdtree',           { 'on':  'NERDTreeToggle' }

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
Plug 'Yggdroot/indentLine'                      " show indent lines (mapped with ,il)

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

" https://www.webpagefx.com/tools/emoji-cheat-sheet/
Plug 'fszymanski/deoplete-emoji',         { 'for': 'markdown'} 
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
" :LLPStartPreview to launch previwer, 
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

"========================== Misc. Plugins and testing ================================="
Plug 'itchyny/calendar.vim'
Plug 'ryanoasis/vim-devicons' | Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Plug 'exu/pgsql.vim',                     { 'for': 'sql' }  " autocmd BufNewFile,BufRead *.sql setf pgsql
" Plug 'mhinz/vim-rfc'
" Plug 'vim-scripts/rfc-syntax',            { 'for': 'rfc' } " optional syntax highlighting for RFC files

" R in vim --> https://kadekillary.work/post/nvim-r/
" Plug 'jalvesaq/Nvim-R'
" Plug 'vim-pandoc/vim-rmarkdown'

" :HackerNews -> o or O to open, u to go back
Plug 'dansomething/vim-hackernews'          " Browse Hacker News inside Vim

call plug#end()
"================================================================================================"










"==========================================================================="
"                           PLUGINS Setup                                   "
"==========================================================================="
" powerline settings
set t_Co=256                      "  enable 256 colors in vim
" set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set t_8f=^[[38;2;%lu;%lu;%lum
set t_8b=^[[48;2;%lu;%lu;%lum
set  runtimepath+=/usr/local/lib/python3.6/site-packages/powerline/bindings/vim/
" ------------ Color scheme settings ------------
set background=dark                     " or light

" colorscheme lucius
" LuciusLightLowContrast	" or LuciusDark, LuciusBlack, LuciusLight, LuciusWhite 
let g:lucius_no_term_bg=0             " (default: 0)

let g:gruvbox_improved_warnings='1'
let g:gruvbox_italicize_strings='1'
let g:gruvbox_italic=1
let g:gruvbox_hls_cursor='blue'
let g:gruvbox_invert_tabline=1
let g:gruvbox_improved_warnings=1
" " let g:gruvbox_improved_strings=1
colorscheme gruvbox
highlight Comment cterm=italic

" autocmd ColorScheme janah highlight Normal ctermbg=256
" colorscheme janah

" altercation/vim-colors-solarized --> NOT WORKING!
" http://ethanschoonover.com/solarized/vim-colors-solarized#advanced-configuration
 if has("gui_running")
     set background=light
     colorscheme solarized 
 endif
  

" colorscheme solarized8,Monokai,railscasts,feral,molokai
" let base16colorspace=256  " Access colors present in 256 colorspace
" colorscheme base16-railscasts        "solarized-dark, bonedark, base16-spacemacs
" let g:airline_theme='base16_google' " with other colorschemes, use luna or murmur

"======================================================================"
" ----------------------- Deoplete Autocomplete -----------------------
"======================================================================"
set runtimepath+=~/.config/nvim/plugged/deoplete.nvim/plugin/deoplete.vim
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#auto_completion_start_length = 1
let g:deoplete#enable_auto_close_preview = 1
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif



let g:deoplete#sources#txt=['omni', 'buffer', 'member', 'tag', 'ultisnips', 'file']


" Disable the candidates in Comment/String syntaxes.
call deoplete#custom#source('_', 'disabled_syntaxes', ['Comment', 'String'])

" Force Jedi to use python version 3
let g:jedi#force_py_version = 3

" Format Python code according to the PEP8 standard
let g:formatter_yapf_style = 'pep8'

" Set the hosts programs for Python and Python3
" That this improves performance when loading deoplete
" let g:python_host_prog  = '/full/path/to/neovim2/bin/python'
" let g:python3_host_prog = '/full/path/to/neovim3/bin/python'


" setting path of the clang autocompleter for c and cpp ('zchee/deoplete-clang')
" the following two lines are mandatory
let g:deoplete#sources#clang#libclang_path = "/usr/lib/llvm-6.0/lib/libclang.so.1"
let g:deoplete#sources#clang#clang_header ="/usr/include/clang/"
" Enable buffer source in C/C++ files only.


" " Java deoplete
autocmd FileType java setlocal omnifunc=javacomplete#Complete   " 'artur-shaik/vim-javacomplete2'     
" let g:deoplete#omni#functions.java = ['javacomplete#Complete']

" " Scala deoplete
let g:deoplete#omni#input_patterns.scala='[^. *\t]\.\w*'

"======================================================================"
" ------------ ClangFormat settings ------------
" BEST : 'rhysd/vim-clang-format'
let g:clang_format#command = 'clang-format-6.0'
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "Auto"}


autocmd FileType c,cpp,java ClangFormatAutoEnable   " Auto-enabling auto-formatting
nnoremap <Leader>cl :ClangFormatAutoToggle<CR>      " Toggle clang auto formatting: ,cl

" press ,cf in C/C++/java code
autocmd FileType c,cpp,java,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,java,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>

" ------------Airline ------------
let g:airline#extensions#virtualenv#enabled = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:Powerline_symbols = "fancy"
let g:airline_theme= 'luna'
" let g:airline_symbols_branch =  "\uE0A0"   " '?'
" let g:airline_skip_empty_sections = 1
" let g:airline#extensions#linecolumn#prefix = '¶'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 2
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_symbols_paste     = 'Þ'
let g:airline_symbols_readonly = '?'
let g:airline#extensions#branch#prefix = '?' " ?, ?
let g:airline_symbols_crypt = '??'
let g:airline_symbols_linenr = '? '
let g:airline_symbols_maxlinenr = ''
let g:airline_symbols_spell = 'A-Z?'
let g:airline_symbols_notexists = ' ?'
let g:airline_symbols_whitespace = '?'

" Display the sign column for version control
" set signcolumn=yes


" =====================================================================
" ---------- vim-devicons settings ------------------------------------
" =====================================================================
" set guifont=Hermit_deicons:h11 " for gvim only
" set guifont=AnonymousPro_devicons:h11
" set GuiFont=FiraMono:h11
let g:webdevicons_enable=1
let g:webdevicons_enable_nerdtree=1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:webdevicons_gui_glyph_fix = 1
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
let g:WebDevIconsOS = 'Linux'

if exists("g:loaded_webdevicons")
  call webdevicons#refresh()
endif

autocmd FileType nerdtree setlocal nolist

" tiagofumo/vim-nerdtree-syntax-highlight ----------------------
" Highlight full name (not only icons). You need to add this if you don't have vim-devicons and want highlight.
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
" Highlight folders using exact match
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name

let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:dodgerblue = "1E90FF"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:limegreen = "32CD32"
let s:white = "FFFFFF"
let s:git_orange = 'F54D27'
let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['java'] = s:limegreen
let g:NERDTreeExtensionHighlightColor['txt'] = s:white 
let g:NERDTreeExtensionHighlightColor['c'] = s:dodgerblue
let g:NERDTreeExtensionHighlightColor['sh'] = s:git_orange 
let g:NERDTreeExtensionHighlightColor['html'] = s:beige 
let g:NERDTreeExtensionHighlightColor['gpg'] = s:brown 
let g:NERDTreeExtensionHighlightColor['tex'] = s:pink 
let g:NERDTreeExtensionHighlightColor['py'] = s:aqua 


" -------------------- NERDTree --------------------
" Toggle NERDtree with ,nt and F6
nnoremap <leader>ne :NERDTreeToggle<cr>
nnoremap <F6>       :NERDTreeToggle<CR>
let NERDTreeMapOpenInTab='<space>'
let NERDTreeShowHidden=1
let g:NERDTreeWinSize=45
let NERDTreeMinimalUI=0
let NERDTreeHijackNetrw=1
let NERDTreeCascadeSingleChildDir=0
let NERDTreeCascadeOpenSingleChildDir=0
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeShowIgnoredStatus = 0
" let g:NERDTreeDirArrowExpandable = '?'
" let g:NERDTreeDirArrowCollapsible = '¦'
let NERDTreeIgnore=['\.pyc$', '\~$','\.vim$','\.o$','\.swp$','\.git$','\.jar$','\.bak$','\.class$','\.jpg$','\.png$','\.out$',]

" -----------------------------------------------------------
" -------------------- syntastic ----------------------------
" -----------------------------------------------------------
" configure syntastic syntax checking to check on open as well as save
let g:syntastic_mode_map = { 'mode': 'active',
      \ 'active_filetypes': ['python'],
      \ 'passive_filetypes': [] }

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_aggregate_errors = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol='?'
let g:syntastic_warning_symbol='?'
let g:syntastic_style_error_symbol  = '?'
let g:syntastic_style_warning_symbol  = '?'

let g:syntastic_enable_balloons = 1
" let g:syntastic_enable_highlighting=1
" hi clear SpellCap
" hi clear SpellBad
" https://stackoverflow.com/questions/17677441/changing-error-highlight-color-used-by-syntastic
hi SyntasticWarning guisp=blue gui=undercurl guifg=NONE guibg=NONE ctermfg=white ctermbg=241 term=underline cterm=none
hi SyntasticError   guisp=red  gui=undercurl guifg=NONE guibg=NONE ctermfg=white ctermbg=red term=underline cterm=none
hi SpellBad guisp=red  gui=undercurl guifg=#ff0000 guibg=NONE ctermfg=white ctermbg=red  term=underline cterm=none
hi SpellCap guisp=red  gui=undercurl guifg=#ff0000 guibg=NONE ctermfg=white ctermbg=red  term=underline cterm=none


" ------ Error window size -------
function! SyntasticCheckHook(errors)
    if !empty(a:errors)
    " let g:syntastic_loc_list_height = min([len(a:errors), 10])
      let g:syntastic_loc_list_height = 5
	  set norelativenumber
    endif
endfunction
" --------Sytastic on status line -----------
set statusline+=%#warning#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=\ (%P)\        " Percent through file

" -----------------------------------------------------------
let g:SuperTabDefaultCompletionType = '<C-n>'
" -----------------------------------------------------------
" Set Vim Wiki to my notes directory
" let g:vimwiki_list = [{'path':'$HOME/Dropbox/Documents/vimwiki'}]

" ---------------- UltiSnippet ------------------------------
" Trigger configuration.
" press tab to go to the next keyword and shift-tab to edit previous
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"


" --------- IndenLine Indicator ------------
let g:indentLine_enabled = 1
let g:indentLine_color_term = 239
let g:indentLine_char = '¦'   " ¦, ?, ¦, ?, or ?
nmap <silent><Leader>il :IndentLinesToggle<CR>

" -----------------------------------------------------------
" ------------- Plugins for Writting  -----------------------
" -----------------------------------------------------------
" Goyo
nmap <silent><Leader>gy :Goyo<CR>
map <F12> :Goyo<CR>
let g:goyo_width=100        " or 80

" --------------------------------------------------
"  LimeLight -  https://github.com/junegunn/limelight.vim
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" For some color schemes, Limelight may not be able to calculate the color 
" for dimming down the surrounding paragraphs
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_default_coefficient = 0.5   " Default: 0.5
let g:limelight_paragraph_span = 1          " Default: 0

"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'

" Highlighting priority (default: 10) !Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1

"nmap <Leader>lm <Plug>(Limelight)
"xmap <Leader>lm <Plug>(Limelight)
nnoremap <Leader>lmo :Limelight<CR>
nnoremap <Leader>lms :Limelight!<CR>
" --------------------------------------------------
augroup markdown
    autocmd!
    autocmd BufRead, BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=markdown
augroup END

let g:markdown_minlines = 80
let g:vim_markdown_frontmatter=1

" --------- Pasticboy/Vim-markdown Configuration ------------
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_fenced_languages = ['html', 'python', 'bash=sh', 'c', 'c++=cpp', 'java', 'scala','r']
let g:vim_markdown_no_extensions_in_markdown = 1
let g:vim_markdown_autowrite = 1
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_math = 1
let g:vim_markdown_auto_extension_ext = 'txt'
let g:vim_markdown_folding_level = 6
let g:vim_markdown_frontmatter = 1

" au BufRead,BufNewFile *.md setlocal textwidth=100

" --------- davinche/godown-vim Configuration ------------
let g:godown_autorun = 0
let g:godown_port = 1337
map <leader>mdp :GodownPreview<CR>
map <leader>mdl :GodownLiveToggle<CR>
map <leader>mdk :GodownKill<CR>

" --------- Vim-pencil Configuration ------------
let g:pencil#wrapModeDefault = 'soft'   " default is 'hard'
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text         call pencil#init()
augroup END

" --------- vim-online-thesaurus Configuration ------------
" let g:online_thesaurus_map_keys = 0
" nnoremap <Leader>si :OnlineThesaurusCurrentWord<CR>
" nnoremap <Leader>si :PyThesaurusCurrentWord<CR>
nnoremap <Leader>st :ThesaurusQueryLookupCurrentWord<CR>
nnoremap <Leader>rt :ThesaurusQueryReplaceCurrentWord<CR>
vnoremap <Leader>st y:ThesaurusQueryReplace <C-r>"<CR>

noremap <silent> <Leader>nw :<C-u>NextWordy<cr>
" -----------------------------------------------------------
" ------------ tpope/vim-fugitive  --------------------------
" -----------------------------------------------------------
" To ensure that this plugin works well with tpope/vim-fugitive, use the following patterns array:
let g:EditorConfig_exclude_patterns = ['fugitive://.*']
noremap <Leader>Ga :Gwrite<CR>
noremap <Leader>Gc :Gcommit<CR>
noremap <Leader>Gps :Gpush origin master<CR>
noremap <Leader>Gpl :Gpull origin master<CR>
noremap <Leader>Gs :Gstatus<CR>
noremap <Leader>Gb :Gblame<CR>
noremap <Leader>Gd :Gvdiff<CR>
noremap <Leader>Gr :Gremove<CR>

" -----------------------------------------------------------
" ------------ Settings for LaTex ------------- -------------
" -----------------------------------------------------------
let g:tex_flavor = "latex"          " to let vim know .tex is LaTex FileType
autocmd Filetype tex setl updatetime=2
" let g:livepreview_previewer = 'evince'
" let g:syntastic_tex_checkers = ['lacheck', 'text/language_check']
" let g:syntastic_tex_checkers = ['lacheck']
let g:syntastic_tex_checkers=['chktex']
let g:syntastic_quiet_messages = { "level": "warnings" }
let g:syntastic_latex_chktex_quiet_messages = { "level" : [] } " supress stupid warnings for latex
nnoremap <Leader>lp :NeoTex<CR>
let g:neotex_delay=2000
let g:neotex_enabled=2

" -------- ---------- -------------- 
" ---- lervag/vimtex plugin -------
" <space>ll to compile and <space>lv to live view
" let g:vimtex_quickfix_ignore_all_warnings=1
" Neovim doesn't support the --servername option yet, you have to install neovim-remote
" on terminal -> pip3 install neovim-remote
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_view_method='zathura'
let g:vimtex_view_use_temp_files = 1
  augroup my_cm_setup
    autocmd!
    autocmd User CmSetup call cm#register_source({
          \ 'name' : 'vimtex',
          \ 'priority': 8,
          \ 'scoping': 1,
          \ 'scopes': ['tex'],
          \ 'abbreviation': 'tex',
          \ 'cm_refresh_patterns': g:vimtex#re#ncm,
          \ 'cm_refresh': {'omnifunc': 'vimtex#complete#omnifunc'},
          \ })
    autocmd BufReadPre   *.tex let b:vimtex_main = 'main.tex'
    autocmd BufRead      *.tex silent :VimtexErrors
  augroup END

"------ deoplete-latex-------
" Include macros like `\jhat` from MathJax and KaTeX.
let g:deoplete#sources#latex#include_web_math = 1  " default 0
" Include a hodgepodge of miscellaneous commands and environments.
let g:deoplete#sources#latex#include_misc = 1      " default 0


" -----------------------------------------------------------
" ----------------- Misc. Plugins  --------------------------
" -----------------------------------------------------------
" dpelle/vim-LanguageTool ---------------------------------
let g:languagetool_jar  = '/home/xollad/Downloads/languagetool/LanguageTool-4.2-SNAPSHOT/languagetool-commandline.jar'
" let g:languagetool_lang='de-DE'    "  'en-US'  >> now in init.vim
hi LanguageToolGrammarError  guisp=blue gui=undercurl guifg=NONE guibg=NONE ctermfg=white ctermbg=blue term=underline cterm=none
hi LanguageToolSpellingError guisp=red  gui=undercurl guifg=NONE guibg=NONE ctermfg=white ctermbg=red  term=underline cterm=none
nnoremap <Leader>lt :LanguageToolCheck<CR>
nnoremap <Leader>lc :LanguageToolClear<CR>

" dansomething/vim-hackernews -----
nnoremap <Leader>hn :HackerNews best<CR>
" ctrlP settings -------------
let g:ctrlp_show_hidden=1               " show hidden files in CTRLP search"
let g:ctrlp_working_path_mode = 'ra'       " other options are a,r,c
" let g:ctrlp_custom_ignore = {
"   \ 'dir':  '\v[\/]\.(git|hg|svn)$',
"   \ 'file': '\v\.(exe|so|dll|so|pyc|o|class|bak|swp|git|jar)$',
"   \ }

" vim calender - itchyny/calendar.vim -------------
let g:calendar_frame = 'default'
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1
" run this command --> rm -rf ~/.cache/calendar.vim/google/

" multi cursor settings -  terryma/vim-multiple-cursors -------------
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_select_all_word_key = '<S-M>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

" java auto complete ===================================================
  nmap <leader>jI <Plug>(JavaComplete-Imports-AddMissing)
  nmap <leader>jR <Plug>(JavaComplete-Imports-RemoveUnused)
  nmap <leader>ji <Plug>(JavaComplete-Imports-AddSmart)
  nmap <leader>jii <Plug>(JavaComplete-Imports-Add)

" neomake support for java -------------
" let g:neomake_java_javac_maker = {
"         \ 'errorformat': 
"             \ '%E%f:%l: %trror: %m,' .
"             \ '%W%f:%l: %tarning: %m,' .
"             \ '%E%f:%l: %m,'. 
"             \ '%Z%p^,'.
"             \ '%-G%.%#',
"         \ }
" let g:neomake_java_enabled_makers = ['javac']

" ========================== Scala Settings ===================================="
" ensime settings for scala
autocmd BufWritePost *.scala silent :EnTypeCheck
autocmd FileType scala nnoremap <Leader>ed :EnDeclarationSplit<CR>
nnoremap <Leader>sc :EnType<CR>


"Linting with neomake
let g:neomake_sbt_maker = {
      \ 'exe': 'sbt',
      \ 'args': ['-Dsbt.log.noformat=true', 'compile'],
      \ 'append_file': 0,
      \ 'auto_enabled': 1,
      \ 'output_stream': 'stdout',
      \ 'errorformat':
          \ '%E[%trror]\ %f:%l:\ %m,' .
            \ '%-Z[error]\ %p^,' .
            \ '%-C%.%#,' .
            \ '%-G%.%#'
     \ }
let g:neomake_enabled_makers = ['sbt']
let g:neomake_verbose=3

" Neomake on text change --not working
" autocmd InsertLeave,TextChanged * update | Neomake! sbt
" autocmd BufWritePost *.scala Neomake! sbt            " not working --------------<

" =====================================================================
" =====================================================================
" ------------- ----------- testing ------------- --------------------
" =====================================================================
" autocmd VimEnter,BufEnter,BufWinEnter * silent! iunmap <buffer> <M-">   " jiangmiao/auto-pairs
inoremap < <><ESC>hli

"==========================================================================="
"==========================================================================="











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

au VimResized * :wincmd =   " Working with split screen nicely
" Resize splits when the window is resized
" au VimResized * exe "normal! \<c-w>=    

" Faster split resizing with (+,-)
if bufwinnr(1)
    map + <C-W>+
    map - <C-W>-
    map = <C-W>=
endif
 
" vertical and Horizontal split
nnoremap <leader>vs :vsplit 
nnoremap <leader>hs :split 

" Terminal emulator  =======================
" open terminal with ,tr or ,tv
" vertical and Horizontal split bash terminal
autocmd BufWinEnter,WinEnter term://* exec 'normal! i'
autocmd BufLeave term://* stopinsert
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
" nmap <leader>sr :%s//<Left><Left>	   "Change all matching of 'search' to 'replace'
"Change only whole words exactly matching 'search' to 'replace' with -confirmation.
nnoremap <leader>sr :%s/\<S\>/R/gc

" replace visually selected section
" TODO

" going to the next one in a search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" search the number of occurences of search with ,sc
nnoremap <leader>sc :%s/s//gn
inoremap <leader>sc <Esc>:%s/s//gn

" search exact word
nnoremap <leader>se :/\<here\>

" press ,sh to toggle hlsearch
nnoremap <silent><expr> <leader>sh (&hls && v:hlsearch ? ':nohls' : ':set hls')."\n"

" sort visually selected texts
vnoremap <leader>so :sort<CR>
"============================ spell check=========================================="
set nospell             " no spell checking
nnoremap le :setlocal spell! spelllang=en_us<CR>
nnoremap ld :setlocal spell! spelllang=de_de<CR>
nnoremap ln :setlocal spell! nospell<CR>
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
noremap  J 7j
"  0 beginning of the line, $ end of the line, ^ first nonblack charecter
nnoremap B ^
nnoremap E $
" noremap  K 5k -> instead open man page with it
" nnoremap <leader>d ddO<Esc> 		" delete the current line and insert a new line there -> S or cc
" inoremap <leader>d <Esc>dd$ 
" delete line in insert mode 		
inoremap <C-d> <Esc>ddO

" tab navigation mappings
nnoremap tn :tabnext<CR>
nnoremap tp :tabprev<CR>
nnoremap tm :tabm<Space>
nnoremap tt :tabnew<Space>
nnoremap ts :tab split<CR>  		" copy current windown and create new tab of its own
nnoremap tc :tabclose<CR>   		" close current tab

" open all buffers in it's own tab
map ,bt :bufdo tab split<CR>:tablast<CR>:tabclose<CR>:syntax on<CR>

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

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
map  <c-s> <nop>
nmap <c-s> :wa<CR>
vmap <c-s> <Esc><c-s>gv
imap <c-s> <Esc>:wa<CR>  " instead of Esc, use <c-o> to stay in insert mode after saving

map <c-a> <nop>
nnoremap <c-a>      gg0vG$             "select all with CTRL+a
inoremap <c-a> <Esc>gg0vG$
" ============ Adding copy paste functionality like windows ============
set clipboard=unnamedplus
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa
" ------------------------------------------------
" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy
nnoremap  <leader>Y  "+yg_

" Paste from clipboard
nnoremap <leader>P "+P
vnoremap <leader>P "+P

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy, which is the default
map Y y$

" Align blocks of text and keep them selected
vmap < <gv
vmap > >gv

"==========================================================================="
set mouse=a             " enable mouse scrolling with scroll wheel also select all mood
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
set ruler             " Display the cursor position on the last line of the screen
" set nobackup
set noswapfile          " no swap files

" Local directories {{{
set undofile
set backupdir =~/.config/nvim/backups
set directory =~/.config/nvim/swaps
set undodir   =~/.config/nvim/undo
"===================================================="
" set modelines=1
set hidden		          " Allow hidden buffers
set laststatus=2	      " Status bar
set showmode              " Shows Insert or command mode

set fileformats=unix,dos,mac

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
set visualbell          " don't beep
set noerrorbells        " don't beep
set nolist                " Show problematic characters.

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
vmap     <F2> <Esc><F2>gv
" inoremap <F2> <ESC>:w<CR>i    " in Insert mode it will save and go back to insert mode
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

"===================================================="
" Wildmenu completion "
set wildmenu            		      " visual autocomplete for command menu
set wildmode=list:longest
set wildignore+=.hg,.git,.svn 		" Version Controls"
set wildignore+=*.aux,*.out,*.toc "Latex Indermediate files"
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg,*.zip,*.rar         "Binary Imgs"
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest,*.exe,*.so,*.jar  "Compiled Object files"
set wildignore+=*.spl 			      " Compiled speolling world list"
set wildignore+=*.sw? 			      " Vim swap files"
set wildignore+=*.DS_Store 		    " OSX SHIT"
set wildignore+=*.luac			      " Lua byte code"
set wildignore+=migrations 		    " Django migrations"
set wildignore+=*.pyc 			      " Python Object codes"
set wildignore+=*.orig,*.rej 		  " Merge resolution files"
set wildignore+=*.stats,*.bak     " Pylint stats and backup file

"===================================================="
" Netrw supports reading and writing files across networks
let g:netrw_winsize = 15
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
nmap <leader>ve :Vexplore<CR>

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

"============================================================="
"                       Function Setup                        "
"============================================================="
nmap <F5> :call Compile_and_Run()<CR>
func! Compile_and_Run()
exec "w"
if &filetype == 'c'
exec "!rm -v %<.o"
exec "!time gcc -v % -Wall -Werror -std=c99 -o %<.o"
" exec "!time ./%<.o"
:split term://./%<.o

elseif &filetype == 'cpp'
exec "!rm -v %<.o"
exec "!time g++ % -Wall -Werror -o %<.o"
" exec "!time ./%<.o"
:split term://./%<.o

elseif &filetype == 'java'
echo "Compiling Java Code...."
exec "!time javac %"
" exec "!time java -cp %:p:h %:t:r"
:split term://java -cp %:p:h %:t:r

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
" nmap <leader>gs :call Google()<CR>
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
  set  spell spelllang=en_us 
  "set thesaurus+=/Users/xollad/.vim/thesaurus/mthesaur.txt
  setlocal complete+=s  "scan the files given with the 'thesaurus' option
  setlocal formatprg=par
  setlocal dictionary+=/usr/share/dict/american-english  " Define the dictionaries
  setlocal complete-=k                  " Completion includes dictionaries
  setlocal complete+=kspell             " use the currently active spell checking
  setlocal nolist
  setlocal wrap
  setlocal linebreak
  setlocal showbreak=..
  setlocal norelativenumber
  setlocal smartindent
  setlocal textwidth=80
  call ToggleColorColumn()
  2mat ErrorMsg '\%81v.'    " color only lines exceeding 80 coloumns
  " colorscheme solarized
endfunction

com! WP  call WordProcessorMode()
nnoremap <leader>wp :call WordProcessorMode()<CR>
nnoremap <leader>gc :GrammarousCheck<CR>
"===================================================="
function! WordProcessorGermanMode()
  setlocal formatoptions=1
  setlocal noexpandtab
  set  spell spelllang=de_de 
  "set thesaurus+=/Users/xollad/.vim/thesaurus/mthesaur.txt
  setlocal complete+=s  "scan the files given with the 'thesaurus' option
  setlocal formatprg=par
  setlocal dictionary+=/usr/share/dict/ngerman  " Define the dictionaries
  setlocal complete-=k                  " Completion includes dictionaries
  setlocal complete+=kspell             " use the currently active spell checking
  setlocal nolist
  setlocal wrap
  setlocal linebreak
  setlocal showbreak=..
  setlocal norelativenumber
  setlocal smartindent
  setlocal textwidth=80
  call ToggleColorColumn()
  2mat ErrorMsg '\%81v.'    " color only lines exceeding 80 coloumns
  " colorscheme solarized
endfunction

com! WPG  call WordProcessorGermanMode()
nnoremap <LocalLeader>wp :call WordProcessorGermanMode()<CR>
"===================================================="
" press ,dw to delete trailing white spaces
nnoremap <silent><leader>dw :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
"===================================================="
" Toggle Wrap
nmap <silent><leader>wt :set wrap!<CR>
" =================================================================
" File type and folding
" close all folds zM. fold level by level zm. open all folds zR and zr (level by level).""
set foldenable          	" enable folding
set foldmethod=syntax
" press ,fc to fold the entire code
nnoremap <leader>fc zM<CR>
nnoremap <leader>fo zR<CR>
set foldlevelstart=10   	" open most folds by default
" set foldnestmax=1    		" 2 nested fold max
" fold based on indent level or use >> set foldmethod=syntax "
" set foldmethod=marker   	"-> equivalent to enabling folding based on regions in Visual Studio Code
" set foldmarker=##-,-##  	"-> configuration for the fold markers, their default values are {{{,}}}


"*****************************************************************************
"       Autocmd Rules
"*****************************************************************************
augroup json_autocmd
  autocmd!
  autocmd FileType json setlocal foldmethod=syntax
augroup END

augroup languages
  autocmd!
    " omnifunctions
    autocmd FileType css        setlocal omnifunc=csscomplete#CompleteCSS 
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python     setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml        setlocal omnifunc=xmlcomplete#CompleteTags
    autocmd FileType sql        setlocal omnifunc=sqlcomplete#Complete
    autocmd FileType xml        setlocal omnifunc=xmlcomlete#CompleteTags

    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    
    " autocmd FileType java setlocal completefunc=javacomplete#CompleteParamsInfo
    " autocmd FileType java setlocal omnifunc=javascomplete#Complete
    " autocmd FileType java setlocal completefunc=javacomplete#CompleteParamsInfo
    autocmd FileType c,cpp,java set mps+==:;
    autocmd FileType sql DBCheckModeline
    autocmd FileType c,cpp,java setlocal equalprg=clang-format   " >> sudo apt install clang-format
    autocmd FileType c,cpp,java setlocal foldmethod=syntax
    autocmd FileType python     setlocal foldmethod=indent
    autocmd FileType python     setlocal foldlevel=1000
    autocmd BufWritePost *.scala silent :EnTypeCheck
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
" use ,df to see the changes made in the file before saving
nnoremap <silent><leader>df :w !git diff % -<CR>
autocmd VimEnter,BufEnter,BufWinEnter * silent! iunmap <buffer> <M-">
" let g:quicktex_trigger = "\t"
"==================================================="
" Remember cursor position between vim sessions
augroup vimrc-remember-cursor-position
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
augroup vimrc-wrapping
  autocmd!
  autocmd BufRead,BufNewFile *.txt call s:SetupWrapping()
augroup END
"======================================================================"
" opening man page of the word under cursor with K

" ====================================================================="
" GPG with vim
" Transparent editing of gpg encrypted files.
" By Wouter Hanegraaff (https://www.endpoint.com/blog/2012/05/16/vim-working-with-encryption)
augroup encrypted
  au!
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



