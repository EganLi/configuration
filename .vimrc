let mapleader=";"
nmap <Leader>W :w<CR>
nmap <Leader>WQ :wqa<CR>
nmap <Leader>Q :qa!<CR>
nnoremap <Leader>lw <C-W>l
nnoremap <Leader>hw <C-W>h
nnoremap <Leader>jw <C-W>j
nnoremap <Leader>kw <C-W>k

set nu
set nocompatible
filetype plugin on
filetype indent on
set tabstop=4
set shiftwidth=4
set softtabstop=4
set hlsearch
syntax enable
syntax on
set showmode
set showcmd
set encoding=utf-8
set autoindent
set cursorline
set cursorcolumn
" hi CursorLine cterm=bold guibg=NONE guifg=NONE
set linebreak
set laststatus=2
set ruler
set showmatch
set incsearch
set ignorecase
set noerrorbells
set backspace=2
set completeopt=longest,menu
" set background=gray
colorscheme molokai

" molokai
let g:molokai_original = 0
let g:rehash256 = 1

":inoremap ( ()<ESC>i
":inoremap ) <c-r>=ClosePair(')')<CR>
":inoremap { {}<ESC>i
":inoremap } <c-r>=ClosePair('}')<CR>
":inoremap [ []<ESC>i
":inoremap ] <c-r>=ClosePair(']')<CR>
":inoremap " ""<ESC>i
":inoremap ' ''<ESC>i
"function! ClosePair(char)
"	if getline('.')[col('.') - 1] == a:char
"		return "\<Right>"
"	else
"		return a:char
"	endif
"endfunction

" For Rust
autocmd BufNewFile,BufRead *rs set filetype=rust

" racer
" set hidden
" let g:racer_cmd = "/root/.cargo/bin/racer"
" let $RUST_SRC_PATH="/root/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src"
" let g:racer_experimental_completer = 1
" let g:racer_insert_paren = 1

" ALE
let g:ale_linters_explicit=1
let g:ale_completion_delay=500
let g:ale_echo_delay=20
let g:ale_lint_delay=500
let g:ale_echo_msg_format='[%linter%] %code: %%s'
let g:ale_lint_on_text_changed='normal'
let g:ale_lint_on_insert_leave=1
let g:airline#extensions#ale#enabled=1
let g:ale_c_gcc_options='-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options='-Wall -O2 -std=c++11'
let g:ale_c_cppcheck_options=''
let g:ale_cpp_cppcheck_options=''
"let g:ale_sign_error="\ue009\ue009"
let g:ale_linters={ 'c++': ['clang++'], 'c': ['clang'], }
hi! clear SpellBad
hi! clear SpellCap
hi! clear SpellRare
hi! SpellBad gui=undercurl guisp=red
hi! SpellCap gui=undercurl guisp=blue
hi! SpellRare gui=undercurl guisp=magenta

" YCM for Rust
" let g:ycm_rust_src_path='/root/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'
" let g:ycm_rust_src_path='/root/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>']
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0
let g:ycm_add_preview_to_completeopt=0
let g:ycm_show_diagnostics_ui=0
let g:ycm_max_identifier_candidates=20
let g:ycm_server_log_level='info'
let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_collect_identifiers_from_comments_and_strings=1
let g:ycm_complete_in_string=1
let g:ycm_key_invoke_completion='<c-z>'
let g:syntastic_cpp_compiler='clang++'
let g:syntastic_cpp_compiler_options='-std=c++11 -stdlib=libc++'
set completeopt=menu,menuone
nnoremap <c-z> <NOP>
let g:ycm_semantic_triggers={'c,cpp,rust,python': ['re!\w{2}'],}
" let g:ycm_filetype_whitelist={ "c":1, "cpp":1, "h":1, "hpp":1, "rs":1 }
let g:ycm_filetype_blacklist={ 'txt':1, 'markdown':1, 'infolog':1, 'text':1 }

" NERDTree
"autocmd VimEnter * NERDTree
"wincmd w
"autocmd VimEnter * wincmd w
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeAutoDeleteBuffer=1
nmap <Leader>fl :NERDTreeToggle<CR>
nmap <silent> <F2> :NERDTreeFind<CR>
let NERDTreeWinPos="left"
let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = '-'

" ClangFormat
nnoremap <F1> :ClangFormat<CR>
let g:clang_format#detect_style_file=1
" let g:clang_format#code_style="WebKit"
"let g:clang_format#style_options = {
"	\ "AccessModifierOffset" : -4,
"	\ "ConstructorInitializerIndentWidth" : 4,
"	\ "AlignEscapedNewlinesLeft" : "false",
"	\ "AlignTrailingComments" : "false",
"	\ "AllowAllParametersOfDeclarationOnNextLine" : "false",
"	\ "AllowShortIfStatementsOnASingleLine" : "false",
"	\ "AllowShortLoopsOnASingleLine" : "false",
"	\ "AlwaysBreakTemplateDeclarations" : "true",
"	\ "AlwaysBreakBeforeMultilineStrings" : "false",
"	\ "BreakBeforeBinaryOperators" : "true",
"	\ "BreakBeforeTernaryOperators" : "true",
"	\ "BreakConstructorInitializersBeforeComma" : "true",
"	\ "BinPackParameters" : "true",
"	\ "ColumnLimit" : 0,
"	\ "ConstructorInitializerAllOnOneLineOrOnePerLine" : "false",
"	\ "DerivePointerBinding" : "false",
"	\ "ExperimentalAutoDetectBinPacking" : "false",
"	\ "IndentCaseLabels" : "false",
"	\ "MaxEmptyLinesToKeep" : 1,
"	\ "NamespaceIndentation" : "Inner",
"	\ "ObjCSpaceBeforeProtocolList" : "true",
"	\ "PenaltyBreakBeforeFirstCallParameter" : 19,
"	\ "PenaltyBreakComment" : 60,
"	\ "PenaltyBreakString" : 1000,
"	\ "PenaltyBreakFirstLessLess" : 120,
"	\ "PenaltyExcessCharacter" : 1000000,
"	\ "PenaltyReturnTypeOnItsOwnLine" : 60,
"	\ "PointerBindsToType" : "true",
"	\ "SpacesBeforeTrailingComments" : 1,
"	\ "Cpp11BracedListStyle" : "false",
"	\ "Standard" : "Cpp11",
"	\ "IndentWidth" : 4,
"	\ "TabWidth" : 8,
"	\ "UseTab" : "Never",
"	\ "BreakBeforeBraces" : "GNU",
"	\ "IndentFunctionDeclarationAfterType" : "false",
"	\ "SpacesInParentheses" : "false",
"	\ "SpacesInAngles" : "false",
"	\ "SpaceInEmptyParentheses" : "false",
"	\ "SpacesInCStyleCastParentheses" : "false",
"	\ "SpaceAfterControlStatementKeyword" : "true",
"	\ "SpaceBeforeAssignmentOperators" : "true",
"	\ "ContinuationIndentWidth" : 4}

" Highlight
let g:cpp_concepts_highlight = 1
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

" LeaderF
let g:Lf_ShortcutF = '<c-p>'
let g:Lf_ShortcutB = '<m-n>'
noremap <c-n> :LeaderfMru<CR>
noremap <c-m> :LeaderfFunction!<CR>
noremap <m-n> :LeaderfBuffer<CR>
noremap <m-m> :LeaderfTag<CR>
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }

let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}

" AsyncRun
let g:asyncrun_open=6
let g:asyncrun_bell=1
let g:asyncrun_rootmarks=['.svn', '.git', '.root']
nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>
nnoremap <F6> :AsyncRun -cwd=<root> cargo build <cr>
nnoremap <F7> :AsyncRun -cwd=<root> make <cr>
nnoremap <F8> :AsyncRun -cwd=<root> -raw make run <cr>

" rust.vim
let g:rustfmt_autosave = 1

" rainbow parenthsis
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

call plug#begin('~/.vim/plugged')
Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'w0rp/ale'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'skywind3000/asyncrun.vim'
" Plug 'racer-rust/vim-racer'
" "Plug 'rust-lang/rust.vim'
" Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'rhysd/vim-clang-format'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'jiangmiao/auto-pairs'
Plug 'kien/rainbow_parentheses.vim'
Plug 'tomasr/molokai'
Plug 'rust-lang/rust.vim'
call plug#end()
