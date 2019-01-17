" Author: https://github.com/XaheenA
"==========================================================================="
"                           PLUGINS Setup                                   "
"==========================================================================="
" powerline settings
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"      " needed for tmux
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set t_Co=256                      "  enable 256 colors in vim
set background=dark               " or light
if (has("termguicolors"))
  " set termguicolors
endif
" set t_8f=^[[38;2;%lu;%lu;%lum
" set t_8b=^[[48;2;%lu;%lu;%lum
set  runtimepath+=/usr/local/lib/python3.6/site-packages/powerline/bindings/vim/
" ------------ Color scheme settings ------------
" let g:lucius_no_term_bg=0             " (default: 0)
" colorscheme lucius
" LuciusLightLowContrast	" or LuciusDark, LuciusBlack, LuciusLight, LuciusWhite 

" let g:gruvbox_italic='1'
" let g:gruvbox_italicize_strings='1'
" let g:gruvbox_hls_cursor='blue'
" let g:gruvbox_invert_tabline='1'
" let g:gruvbox_improved_warnings='1'
" let g:gruvbox_invert_signs='1'        " Inverts GitGutter and Syntastic signs.
" let g:gruvbox_contrast_light='light'
" " " let g:gruvbox_improved_strings=1
" highlight Comment cterm=italic
" colorscheme gruvbox
" colorscheme railscasts
" colorscheme subtle_dark       " ----> mega nice subtle lightblue colorscheme
 colorscheme Monokai

" let ayucolor="dark"   " for dark version of theme ---> BEST
" colorscheme ayu

" autocmd ColorScheme janah highlight Normal ctermbg=265  "or 235
" colorscheme janah

" altercation/vim-colors-solarized --> NOT WORKING!
" http://ethanschoonover.com/solarized/vim-colors-solarized#advanced-configuration
 if has("gui_running")
     set background=light
     colorscheme solarized 
 endif
  
" colorscheme solarized8,Monokai,railscasts,feral,molokai, afterglow
let base16colorspace=256  " Access colors present in 256 colorspace
" colorscheme base16-railscasts        "solarized-dark, bonedark, base16-spacemacs
" colorscheme base16-default-dark      " base16-seti
" let g:airline_theme='base16_google' " with other colorschemes, use luna or murmur

" change the highlight groups
highlight SpellBad guisp=red  gui=undercurl guifg=#ff0000 guibg=NONE ctermfg=white ctermbg=red  term=underline cterm=none
highlight SpellCap guisp=red  gui=undercurl guifg=#ff0000 guibg=NONE ctermfg=white ctermbg=red  term=underline cterm=none
highlight search guibg=darkgrey guifg=lightyellow cterm=bold ctermfg=black ctermbg=grey
"======================================================================"
" ----------------------- Deoplete Autocomplete -----------------------
"======================================================================"
set runtimepath+=~/.config/nvim/plugged/deoplete.nvim/plugin/deoplete.vim
" let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_at_startup = 0
augroup deoplete_setup
autocmd!
    autocmd InsertEnter * call deoplete#enable()
    autocmd FileType BAC call deoplete#custom#buffer_option('auto_complete', v:false)
augroup END
let g:deoplete#enable_smart_case = 1
let g:deoplete#auto_completion_start_length = 1
let g:deoplete#enable_auto_close_preview = 1
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif

" -> deoplete#sources is removed
" let g:deoplete#sources#txt=['omni', 'buffer', 'member', 'tag', 'ultisnips', 'file', 'around', 'vim']
" let g:deoplete#sources#sh=['omni', 'buffer', 'member', 'tag', 'ultisnips', 'file', 'around', 'vim']

call deoplete#custom#var('omni', 'input_patterns', {
        \ 'r': '[^. *\t]\.\w*',
    \ }
\)

" Disable the candidates in Comment/String syntaxes.
call deoplete#custom#source('_', 'disabled_syntaxes', ['Comment', 'String'])
call deoplete#custom#source('omni',          'mark', '⌾')
call deoplete#custom#source('around',        'mark', '↻')
call deoplete#custom#source('buffer',        'mark', 'ℬ')
call deoplete#custom#source('syntax',        'mark', '♯')
call deoplete#custom#source('member',        'mark', '.')
call deoplete#custom#source('jedi',          'mark', '⌁')
call deoplete#custom#source('vim',           'mark', '⌁')
call deoplete#custom#source('ultisnips',     'mark', '〄')
" call deoplete#custom#source('tmux-complete', 'mark', '⊶')

call deoplete#custom#source('ultisnips',     'rank', 800)
call deoplete#custom#source('omni',          'rank', 750)
call deoplete#custom#source('around',        'rank', 720)
call deoplete#custom#source('buffer',        'rank', 700)
call deoplete#custom#source('syntax',        'rank', 680)
call deoplete#custom#source('member',        'rank', 670)
call deoplete#custom#source('jedi',          'rank', 650)
call deoplete#custom#source('vim',           'rank', 630)
" call deoplete#custom#source('tmux-complete', 'rank', 110)


" Force Jedi to use python version 3
let g:jedi#force_py_version = 3

" Format Python code according to the PEP8 standard - 'Chiel92/vim-autoformat'
let g:formatter_yapf_style = 'pep8'
let g:syntastic_python_checkers=['python', 'flake8']
noremap <F4> :Autoformat<CR>

" Set the hosts programs for Python and Python3
" That this improves performance when loading deoplete
" let g:python_host_prog  = '/full/path/to/neovim2/bin/python'
" let g:python3_host_prog = '/full/path/to/neovim3/bin/python'


" setting path of the clang autocompleter for c and cpp ('zchee/deoplete-clang')
" the following two lines are mandatory
let g:deoplete#sources#clang#libclang_path = "/usr/lib/llvm-6.0/lib/libclang.so.1"
let g:deoplete#sources#clang#clang_header ="/usr/include/clang/"
" Enable buffer source in C/C++ files only.

" tweekmonster/deoplete-clang2 settings

" " Scala deoplete
let g:deoplete#omni#input_patterns.scala='[^. *\t]\.\w*'
" force deoplete to use ensime only for scala
" call deoplete#custom#option('ignore_sources', {'scala': ['LanguageClient']})

"======================================================================"
" ------------ ClangFormat settings ------------
" BEST : 'rhysd/vim-clang-format'
let g:clang_format#command = 'clang-format-6.0'
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "Auto"}


nnoremap <Leader>cl :ClangFormatAutoToggle<CR>      " Toggle clang auto formatting: ,cl
augroup clang_setup
    autocmd!
    autocmd FileType c,cpp,java ClangFormatAutoEnable   " Auto-enabling auto-formatting
    " press ,cf in C/C++/java code
    autocmd FileType c,cpp,java,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
    autocmd FileType c,cpp,java,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
augroup END

" ------------Airline ------------
let g:airline#extensions#virtualenv#enabled = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:Powerline_symbols = "fancy"
let g:airline_theme= 'luna' " others -> dark
" let g:airline_symbols_branch =  "\uE0A0"   " 'ψ'
" let g:airline_skip_empty_sections = 1
" let g:airline#extensions#linecolumn#prefix = '¶'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 2
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_symbols_paste     = 'Þ'
let g:airline_symbols_readonly = '♫'
let g:airline#extensions#branch#prefix = '➔' " ➥, ⎇
let g:airline_symbols_crypt = '🔒'
let g:airline_symbols_linenr = '☰ '
let g:airline_symbols_maxlinenr = ''
let g:airline_symbols_spell = 'A-Z✔'
let g:airline_symbols_notexists = ' ∉'
let g:airline_symbols_whitespace = 'Ξ'

" Display the sign column for version control
" set signcolumn=yes

" ------------------------------------------
" francoiscabrol/ranger.vim
let g:ranger_map_keys = 0
nnoremap <localleader>rn :Ranger<CR>
nnoremap <localleader>rt :RangerNewTab<CR>

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

" autocmd FileType nerdtree setlocal nolist

" tiagofumo/vim-nerdtree-syntax-highlight ----------------------
" Highlight full name (not only icons). You need to add this if you don't have vim-devicons and want highlight.
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeQuitOnOpen = 1                " Automatically close NerdTree when you open a file: 
let g:NERDTreeHighlightFolders = 1          " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1  " highlights the folder name
let NERDTreeMapOpenVSplit='v'
let NERDTreeMapPreviewVSplit='V'
let NERDTreeMapOpenSplit='s'
let NERDTreeMapPreviewSplit='S'

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
" Toggle NERDtree with ,ne and F6
nnoremap <leader>ne :NERDTreeToggle<cr>
nnoremap <F6>       :NERDTreeToggle<CR>
" find the current file in nerdtree without needing to reload the drawer
nnoremap <leader>nf :NERDTreeFind<cr>
let NERDTreeMapOpenInTab='<space>'
let NERDTreeShowHidden=1
let g:NERDTreeWinSize=45
let NERDTreeMinimalUI=0
let NERDTreeHijackNetrw=1
let NERDTreeCascadeSingleChildDir=0
let NERDTreeCascadeOpenSingleChildDir=0
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeShowIgnoredStatus = 0
" let g:NERDTreeDirArrowExpandable = 'ж'
" let g:NERDTreeDirArrowCollapsible = '■'
let NERDTreeIgnore=['\.pyc$', '\~$','\.vim$','\.o$','\.swp$','\.git$','\.jar$','\.bak$','\.class$','\.jpg$','\.png$','\.out$',]


" ------------ Xuyuanp/nerdtree-git-plugin -------------
" show ignored paths in nerdtree (-> should actually be greyed out) - but resource intensive
" let g:NERDTreeShowIgnoredStatus = 1
" those symbols need a nerdfont to display (http://nerdfonts.com/?set=nf-oct-#cheat-sheet)
let g:NERDTreeIndicatorMapCustom = {
   \ "Modified"  : "✹",
   \ "Staged"    : "",
   \ "Untracked" : "六",
   \ "Renamed"   : "",
   \ "Unmerged"  : "",
   \ "Deleted"   : "✖",
   \ "Dirty"     : "✗",
   \ "Clean"     : "✔︎",
   \ 'Ignored'   : '',
   \ "Unknown"   : "?"
   \ }

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
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠️'
let g:syntastic_style_error_symbol  = '💩'
let g:syntastic_style_warning_symbol  = '!'

let g:syntastic_enable_balloons = 1
" let g:syntastic_enable_highlighting=1
" https://stackoverflow.com/questions/17677441/changing-error-highlight-color-used-by-syntastic
hi SyntasticWarning guisp=blue gui=undercurl guifg=NONE guibg=NONE ctermfg=white ctermbg=241 term=underline cterm=none
hi SyntasticError   guisp=red  gui=undercurl guifg=NONE guibg=NONE ctermfg=white ctermbg=red term=underline cterm=none

" ------ Error window size -------
function! SyntasticCheckHook(errors)
    if !empty(a:errors)
    " let g:syntastic_loc_list_height = min([len(a:errors), 10])
      let g:syntastic_loc_list_height = 5
	  setlocal norelativenumber
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
" Trigger configuration.  use Ctrl+j to expand the ultisnippets
" press tab to go to the next keyword and shift-tab to edit previous
let g:UltiSnipsExpandTrigger="<c-j>"        "or <tab>
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"


" --------- IndenLine Indicator ------------
let g:indentLine_enabled = 1
let g:indentLine_color_term = 239
let g:indentLine_char = '¦'   " ¦, ┆, │, ⎸, or ▏
nnoremap <silent><Leader>il :IndentLinesToggle<CR>

" -----------------------------------------------------------
" ------------- Plugins for Writting  -----------------------
" -----------------------------------------------------------
" Goyo
nnoremap <silent><Leader>gy :Goyo<CR>
map <F12> :Goyo<CR>
let g:goyo_width=100        " or 80

" --------------------------------------------------
"  LimeLight -  https://github.com/junegunn/limelight.vim
augroup GoyoEnter_limelight
    autocmd!
    autocmd! User GoyoEnter Limelight
    autocmd! User GoyoLeave Limelight!
augroup END
" For some color schemes, Limelight may not be able to calculate the color 
" for dimming down the surrounding paragraphs
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_default_coefficient = 0.5   " Default: 0.5
let g:limelight_paragraph_span = 0          " Default: 0

"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'

" Highlighting priority (default: 10) !Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1

"nnoremap <Leader>lm <Plug>(Limelight)
"xmap <Leader>lm <Plug>(Limelight)
nnoremap <Leader>lmo :Limelight<CR>
nnoremap <Leader>lmc :Limelight!<CR>

" --------------------------------------------------
" mhinz/vim-startify
" When opening a file or bookmark, change to its directory.
let g:startify_change_to_dir = 1
let g:startify_custom_header = startify#fortune#cowsay('', '═','║','╔','╗','╝','╚')
let g:startify_files_number        = 15
" --------------------------------------------------
augroup markdown
    autocmd!
    autocmd BufRead, BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=markdown
  " autocmd filetype markdown setlocal textwidth=100
augroup END

" Markdown headings -----------------------
nnoremap <localleader>1 m`yypVr=``
nnoremap <localleader>2 m`yypVr-``
nnoremap <localleader>3 m`^i### <esc>``4l
nnoremap <localleader>4 m`^i#### <esc>``5l
nnoremap <localleader>5 m`^i##### <esc>``6l

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

" --------- davinche/godown-vim Configuration ------------
let g:godown_autorun = 0
let g:godown_port = 1337
map <leader>mdp :GodownPreview<CR>
map <leader>mdl :GodownLiveToggle<CR>
map <leader>mdk :GodownKill<CR>

" --------- Vim-pencil Configuration ------------
let g:pencil#autoformat = 1
let g:pencil#wrapModeDefault = 'soft'   " default is 'hard'
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd,text call pencil#init()
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
augroup latex_setup
    autocmd!
    autocmd Filetype tex setl updatetime=2
augroup END
" let g:livepreview_previewer = 'evince'
" let g:syntastic_tex_checkers = ['lacheck', 'text/language_check']
" let g:syntastic_tex_checkers = ['lacheck']
let g:syntastic_tex_checkers=['chktex']
" let g:syntastic_quiet_messages = { "level": "warnings" }
" let g:syntastic_latex_chktex_quiet_messages = { "warnings" : [] } " supress stupid warnings for latex
" let g:neotex_delay=2000
" let g:neotex_enabled=2

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
let g:multi_cursor_select_all_word_key = '<M-m>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

" machakann/vim-highlightedyank
let g:highlightedyank_highlight_duration = 150

" TComment
"Toggle comments
nnoremap <leader>cc :TComment<CR>
"Toggle comments as a block
nnoremap <leader>cb :TCommentBlock<CR>

" visual-increment
set nrformats=alpha,octal,hex,bin

" java auto complete ===================================================
  nnoremap <leader>ji <Plug>(JavaComplete-Imports-AddMissing)
  nnoremap <leader>jI <Plug>(JavaComplete-Imports-AddSmart)
  nnoremap <leader>ja <Plug>(JavaComplete-Imports-Add)
  nnoremap <leader>jR <Plug>(JavaComplete-Imports-RemoveUnused)

" java vim-scripts/java_getset.vim ====================================
map <buffer> <Localleader>gs <Plug>JavagetsetInsertBothGetterSetter

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
" autocmd BufWritePost *.java Neomake      " not working --------------<

" ========================== Scala Settings ===================================="
" ensime settings for scala
augroup scala_setup
    autocmd!
    autocmd BufWritePost *.scala silent :EnTypeCheck
    autocmd FileType scala nnoremap <Leader>ed :EnDeclarationSplit<CR>
augroup END
nnoremap <LocalLeader>sc :EnType<CR>


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
" Neomake on text change --not working !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
" autocmd InsertLeave,TextChanged * update | Neomake! sbt
" autocmd BufWritePost *.scala Neomake! sbt            " not working --------------<

" =====================================================================
" =====================================================================
" ------------- ----------- testing ------------- --------------------
" =====================================================================
" autocmd VimEnter,BufEnter,BufWinEnter * silent! iunmap <buffer> <M-">   " jiangmiao/auto-pairs
inoremap < <><ESC>hli
