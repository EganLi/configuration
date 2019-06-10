let mapleader=";"
nmap <Leader>W :w<CR>
nmap <Leader>WQ :wqa<CR>
nmap <Leader>Q :qa!<CR>
nnoremap <Leader>lw <C-W>l
nnoremap <Leader>hw <C-W>h

set nu
set nocompatible
filetype off
set tabstop=4
set shiftwidth=4
set softtabstop=4
set hlsearch
syntax enable
syntax on
set showmode
set showcmd
set encoding=utf-8
filetype indent on
set autoindent
set cursorline
hi CursorLine cterm=bold guibg=NONE guifg=NONE
set linebreak
set laststatus=2
set ruler
set showmatch
set incsearch
set ignorecase
set noerrorbells
set backspace=2
set completeopt=longest,menu

:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {}<ESC>i
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
function! ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endfunction

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
let g:ycm_rust_src_path='/root/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'
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

" NERDTree
autocmd VimEnter * NERDTree
wincmd w
autocmd VimEnter * wincmd w
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeAutoDeleteBuffer=1
nmap <Leader>fl :NERDTreeToggle<CR>
nmap <silent> <F2> :NERDTreeFind<CR>
let NERDTreeWinPos="right"

" ClangFormat
nnoremap <F1> :ClangFormat<CR>

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
nnoremap <F7> :AsyncRun -cwd=<root> make <cr>
nnoremap <F8> :AsyncRun -cwd=<root> -raw make run <cr>

call plug#begin('~/.vim/plugged')
Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'w0rp/ale'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'skywind3000/asyncrun.vim'
" Plug 'racer-rust/vim-racer'
" "Plug 'rust-lang/rust.vim'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'rhysd/vim-clang-format'
Plug 'octol/vim-cpp-enhanced-highlight'
call plug#end()
