"快捷键前缀，即<Leader>
let mapleader=";"
"到行首和行尾
nmap LB 0
nmap LE $
"关闭当前分割窗口
"nmap <Leader>q :q<CR> 与listtoggle冲突
"保存当前窗口内容
nmap <Leader>W :w<CR>
"保存所有窗口内容并退出vim
"nmap <Leader>WQ :wa<CR>:qall<CR>   可能引起系统崩溃
"不做任何保存，直接退出vim
nmap <Leader>Q :NERDTreeClose<CR>:TlistClose<CR>:MBEClose<CR>:q<CR>
"依次遍历子窗口
nnoremap nw <C-W><C-W>
"跳转至右方的窗口
nnoremap <Leader>lw <C-W>l
"跳转至左方的窗口
nnoremap <Leader>hw <C-W>h
"让配置变更立即生效
"autocmd BufWritePost $MYVIMRC source $MYVIMRC

"开启实时搜索功能
set incsearch
"搜索时大小写不敏感
set ignorecase
"禁止光标闪烁
"set gcr=a:block-blinkon0
"开启行号显示
set number
"使用配色方案
set background=dark
colorscheme solarized
"高亮显示当前行
set cursorline
"hi CursorLine term=bold cterm=bold guibg=White40
hi CursorLine cterm=bold guibg=NONE guifg=NONE
"高亮显示搜索结果
set hlsearch
"禁止拆行
"set nowrap
"语法高亮
syntax enable
"允许用指定语法高亮配色方案替换默认方案
syntax on
"自适应不同语言的智能缩进
filetype indent on
"将制表符扩展为空格
set expandtab
"设置编辑时制表符占用空格数
set tabstop=4
"设置格式化时制表符占用空格数
set shiftwidth=4
"让vim把连续数量的空格视为一个制表符
set softtabstop=4
"基于缩进或语法进行代码折叠
"set foldmethod=indent
set foldmethod=syntax
"启动vim时关闭折叠代码
set nofoldenable
set showmatch
set matchtime=1

:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {<CR>}<ESC>O
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

"vim-indent-guides
"随vim自启动
"let g:indent_guides_enable_on_vim_startup=1
"从第二层开始可视化显示缩进
"let g:indent_guides_start_level=2
"色块宽度
"let g:indent_guides_guides_size=1
"快捷键i开/关缩进可视化
":nmap <silent> <Leader>i <Plug>IndentGuidesToggle

"*.cpp和*.hpp间切换
let b:fswitchchdst = 'hpp,h'
nmap <silent> <Leader>sw :FSHere<CR>

"YCM
"配置默认的ycm_extra_conf.py
"let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
nnoremap <Leader>jc :YcmCompleter GoToDeclaration<CR>
"只能是#include或已打开的文件
nnoremap <Leader>jd :YcmCompleter GoToDefinition<CR>
"补全功能在注释中同样有效
let g:ycm_complete_in_comments=1
"允许vim加载.ycm_extra_conf.py文件，不再提示
let g:ycm_confirm_extra_conf=0
"开启YCM标签补全引擎
let g:ycm_collect_identifiers_from_tags_files=1
"补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt-=preview
"从第一个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=1
"语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1
"补全菜单的高度
set pumheight=10
"触发语法补全
let g:ycm_semantic_triggers = {
    \   'c' : ['->', '.', 're![_a-zA-Z0-9]'],
    \   'cpp' : ['->', '.', '::', 're![_a-zA-Z0-9]'],
    \ }
"YCM-Generator
"生成.ycm_extra_conf文件
nmap <F12> :YcmGenerateConfig<CR>

"NERDTree
"查看工程文件
nmap <Leader>fl :NERDTreeToggle<CR>
"子窗口位置
let NERDTreeWinPos="right"
"显示隐藏文件
let NERDTreeShowHidden=1
"子窗口不显示冗余帮助信息
let NERDTreeMinimalUI=1
"删除文件时自动删除文件对应buffer
let NERDTreeAutoDeleteBuffer=1
"显示行号
let NERDTreeShowLineNumbers=1

"taglist
"仅显示当前文件的标签
let Tlist_Show_One_File=1
"当只有一个窗口时自动退出vim
let Tlist_Exit_OnlyWindow=1
"在左边显示标签列表
let Tlist_Use_Right_Window=0
"打开文件时自动打开
let Tlist_Auto_Open=0
"开关标签列表
nmap <Leader>tl :TlistToggle<CR>

"syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'

"MiniBufExplorer
"显示/隐藏MiniBufExplorer窗口
map <Leader>bl :MBEToggle<CR>
"buffer切换快捷键
map K :MBEbn<CR>
map J :MBEbp<CR>



set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Valloric/ListToggle'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'Chiel92/vim-autoformat'
Plugin 'tpope/vim-commentary'
Plugin 'octol/vim-cpp-enhanced-highlight'
"Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'vim-scripts/taglist.vim'
Plugin 'rdnetto/YCM-Generator'
call vundle#end()
filetype plugin indent on

