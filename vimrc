" 1. Install bundle                                                                                    
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
"source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin
set nu

" Configuration file for vim  
set modelines=0 " CVE-2007-2438  

" Normally we use vim-extensions. If you want true vi-compatibility  
" remove change the following statements  
set nocompatible " Use Vim defaults instead of 100% vi compatibility  
set backspace=2 " more powerful backspacing  
    
"=========================================================================  
" DesCRiption: 适合自己使用的vimrc文件，for Linux/Windows, GUI/Console  
"  
" Last Change: 2014.7.10  
"  
" Version: 1.80  
"  
"=========================================================================  
set nocompatible " 关闭 vi 兼容模式  
syntax on " 自动语法高亮  

"colorscheme darkblue "desert molokai  设定配色方案  
set number " 显示行号  
set cursorline " 突出显示当前行  
set ruler " 打开状态栏标尺  
set shiftwidth=4 " 设定 << 和 >> 命令移动时的宽度为 4  
set softtabstop=4 " 使得按退格键时可以一次删掉 4 个空格  
set tabstop=4 " 设定 tab 长度为 4  
set nobackup " 覆盖文件时不备份  
set autochdir " 自动切换当前目录为当前文件所在的目录  
filetype plugin indent on " 开启插件  
set backupcopy=yes " 设置备份时的行为为覆盖  
set ignorecase smartcase " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感  
"set nowrapscan " 禁止在搜索到文件两端时重新搜索  
set incsearch " 输入搜索内容时就显示搜索结果  
set hlsearch " 搜索时高亮显示被找到的文本  
set noerrorbells " 关闭错误信息响铃  
set novisualbell " 关闭使用可视响铃代替呼叫  
set t_vb= " 置空错误铃声的终端代码  
" set showmatch " 插入括号时，短暂地跳转到匹配的对应括号  
" set matchtime=2 " 短暂跳转到匹配括号的时间  
set magic " 设置魔术  
set hidden " 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存  
set guioptions-=T " 隐藏工具栏  
"set guioptions-=m " 隐藏菜单栏  
set smartindent " 开启新行时使用智能自动缩进  
set backspace=indent,eol,start  
" 不设定在插入状态无法用退格键和 Delete 键删除回车符  
set cmdheight=1 " 设定命令行的行数为 1  
set laststatus=2 " 显示状态栏 (默认值为 1, 无法显示状态栏)  
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\   
" 设置在状态行显示的信息  
"set foldenable " 开始折叠  
"set foldmethod=syntax " 设置语法折叠  
"set foldcolumn=0 " 设置折叠区域的宽度  
"setlocal foldlevel=1 " 设置折叠层数为  
" set foldclose=all " 设置为自动关闭折叠   
" nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>  
" 用空格键来开关折叠  
  
" return OS type, eg: windows, or linux, mac, et.st..  
function! MySys()  
if has("win16") || has("win32") || has("win64") || has("win95")  
return "windows"  
elseif has("unix")  
return "linux"  
endif  
endfunction  
  
  
" 用户目录变量$VIMFILES  
if MySys() == "windows"  
let $VIMFILES = $VIM.'/vimfiles'  
elseif MySys() == "linux"  
let $VIMFILES = $HOME.'/.vim'  
endif  
  
  
" 设定doc文档目录  
let helptags=$VIMFILES.'/doc'  
  
  
" 设置字体 以及中文支持  
if has("win32")  
"set guifont=Inconsolata:h12:cANSI  
endif  
  
  
" 配置多语言环境  
if has("multi_byte")  
" UTF-8 编码  
set encoding=utf-8  
set termencoding=utf-8  
set formatoptions+=mM  
set fencs=utf-8,gbk  
  
  
if v:lang =~? '^zh\|ja\|ko'  
set ambiwidth=double  
endif  
  
  
if has("win32")  
source $VIMRUNTIME/delmenu.vim  
source $VIMRUNTIME/menu.vim  
language messages zh_CN.utf-8  
endif  
else  
echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"  
endif  
  
  
" Buffers操作快捷方式!  
nnoremap <C-RETURN> :bnext<CR>  
nnoremap <C-S-RETURN> :bprevious<CR>  
  
  
" Tab操作快捷方式!  
nnoremap <C-TAB> :tabnext<CR>  
nnoremap <C-S-TAB> :tabprev<CR>  
  
  
"关于tab的快捷键  
" map tn :tabnext<cr>  
" map tp :tabprevious<cr>  
" map td :tabnew .<cr>  
" map te :tabedit  
" map tc :tabclose<cr>  
  
  
"窗口分割时,进行切换的按键热键需要连接两次,比如从下方窗口移动  
"光标到上方窗口,需要<c-w><c-w>k,非常麻烦,现在重映射为<c-k>,切换的  
"时候会变得非常方便.  
nnoremap <C-h> <C-w>h  
nnoremap <C-j> <C-w>j  
nnoremap <C-k> <C-w>k  
nnoremap <C-l> <C-w>l  
  
  
"一些不错的映射转换语法（如果在一个文件中混合了不同语言时有用）  
nnoremap <leader>1 :set filetype=xhtml<CR>  
nnoremap <leader>2 :set filetype=css<CR>  
nnoremap <leader>3 :set filetype=javascript<CR>  
nnoremap <leader>4 :set filetype=php<CR>  
  
  
" set fileformats=unix,dos,mac  
" nmap <leader>fd :se fileformat=dos<CR>  
" nmap <leader>fu :se fileformat=unix<CR>  
  
  
" use Ctrl+[l|n|p|cc] to list|next|previous|jump to count the result  
" map <C-x>l <ESC>:cl<CR>  
" map <C-x>n <ESC>:cn<CR>  
" map <C-x>p <ESC>:cp<CR>  
" map <C-x>c <ESC>:cc<CR>  
    
" 让 Tohtml 产生有 CSS 语法的 html  
" syntax/2html.vim，可以用:runtime! syntax/2html.vim  
let html_use_css=1  
  
  
" Python 文件的一般设置，比如不要 tab 等  
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab  
autocmd FileType python map <F12> :!python %<CR>  
  
  
" 选中状态下 Ctrl+c 复制  
vmap <C-c> "+y  
  
  
" 打开javascript折叠  
let b:javascript_fold=1  
" 打开javascript对dom、html和css的支持  
let javascript_enable_domhtmlcss=1  
" 设置字典 ~/.vim/dict/文件的路径  
autocmd filetype javascript set dictionary=$VIMFILES/dict/javascript.dict  
autocmd filetype css set dictionary=$VIMFILES/dict/css.dict  
autocmd filetype php set dictionary=$VIMFILES/dict/php.dict  
  
  
"-----------------------------------------------------------------  
" plugin - bufexplorer.vim Buffers切换  
" \be 全屏方式查看全部打开的文件列表  
" \bv 左右方式查看 \bs 上下方式查看  
"-----------------------------------------------------------------  
  
  
  
  
"-----------------------------------------------------------------  
" plugin - taglist.vim 查看函数列表，需要ctags程序  
" F4 打开隐藏taglist窗口  
"-----------------------------------------------------------------  
if MySys() == "windows" " 设定windows系统中ctags程序的位置  
let Tlist_Ctags_Cmd = '"'.$VIMRUNTIME.'/ctags.exe"'  
elseif MySys() == "linux" " 设定windows系统中ctags程序的位置  
let Tlist_Ctags_Cmd = '/usr/bin/ctags'  
endif  
"nnoremap <silent><F4> :TlistToggle<CR>  
let Tlist_Show_One_File = 1 " 不同时显示多个文件的tag，只显示当前文件的  
let Tlist_Exit_OnlyWindow = 1 " 如果taglist窗口是最后一个窗口，则退出vim  
let Tlist_Use_Right_Window = 1 " 在右侧窗口中显示taglist窗口  
let Tlist_File_Fold_Auto_Close=1 " 自动折叠当前非编辑文件的方法列表  
let Tlist_Auto_Open = 0  
let Tlist_Auto_Update = 1  
let Tlist_Hightlight_Tag_On_BufEnter = 1  
let Tlist_Enable_Fold_Column = 0  
let Tlist_Process_File_Always = 1  
let Tlist_Display_Prototype = 0  
let Tlist_Compact_Format = 1  
  
  
  
  
"-----------------------------------------------------------------  
" plugin - mark.vim 给各种tags标记不同的颜色，便于观看调式的插件。  
" \m mark or unmark the word under (or before) the cursor  
" \r manually input a regular expression. 用于搜索.  
" \n clear this mark (i.e. the mark under the cursor), or clear all highlighted marks .  
" \* 当前MarkWord的下一个 \# 当前MarkWord的上一个  
" \/ 所有MarkWords的下一个 \? 所有MarkWords的上一个  
"-----------------------------------------------------------------  
  
  
  
  
"-----------------------------------------------------------------  
" plugin - NERD_tree.vim 以树状方式浏览系统中的文件和目录  
" :ERDtree 打开NERD_tree :NERDtreeClose 关闭NERD_tree  
" o 打开关闭文件或者目录 t 在标签页中打开  
" T 在后台标签页中打开 ! 执行此文件  
" p 到上层目录 P 到根目录  
" K 到第一个节点 J 到最后一个节点  
" u 打开上层目录 m 显示文件系统菜单（添加、删除、移动操作）  
" r 递归刷新当前目录 R 递归刷新当前根目录  
"-----------------------------------------------------------------  
" F3 NERDTree 切换  
" set MiniBufExplorer
let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1
let g:miniBufExplMoreThanOne=0
" set winmanager
" Caution: current version of winmanager has a problem
" need to modify ~/.vim/plugin/winmanager.vim
" function ToggleWindowsManager()下的call
" s:StartWindowsManager()的下一行加一句exe 'q'
let g:NERDTree_title="[NERDTree]"
"let g:winManagerWindowLayout="MiniBufExplorer,NERDTree|TagList"
"let g:winManagerWindowLayout="MiniBufExplorer,TagList"
function! NERDTree_Start()
   exec 'NERDTree'
endfunction
function! NERDTree_IsValid()
    return 1
endfunction

nmap tt :TagbarToggle<CR>
nmap nt :NERDTreeToggle<CR>

" F2 VundleInstall 切换  
map <F2> :VundleInstall<CR>  
imap <F2> <ESC>:VundleInstall<CR>    
  
"-----------------------------------------------------------------  
" plugin - NERD_commenter.vim 注释代码用的，  
" [count],cc 光标以下count行逐行添加注释(7,cc)  
" [count],cu 光标以下count行逐行取消注释(7,cu)  
" [count],cm 光标以下count行尝试添加块注释(7,cm)  
" ,cA 在行尾插入 ,并且进入插入模式。 这个命令方便写注释。  
" 注：count参数可选，无则默认为选中行或当前行  
"-----------------------------------------------------------------  
let NERDSpaceDelims=1 " 让注释符与语句之间留一个空格  
let NERDCompactSexyComs=1 " 多行注释时样子更好看  
  
  
  
  
"-----------------------------------------------------------------  
" plugin - DoxygenToolkit.vim 由注释生成文档，并且能够快速生成函数标准注释  
"-----------------------------------------------------------------  
let g:DoxygenToolkit_authorName="Asins - asinsimple AT gmail DOT com"  
let g:DoxygenToolkit_briefTag_funcName="yes"  
map <leader>da :DoxAuthor<CR>  
map <leader>df :Dox<CR>  
map <leader>db :DoxBlock<CR>  
map <leader>dc a <LEFT><LEFT><LEFT>  
  
  
  
  
"-----------------------------------------------------------------  
" plugin – ZenCoding.vim 很酷的插件，HTML代码生成  
" 插件最新版：http://github.com/mattn/zencoding-vim  
" 常用命令可看：http://nootn.com/blog/Tool/23/  
"-----------------------------------------------------------------  
  
  
  
  
"-----------------------------------------------------------------  
" plugin – checksyntax.vim JavaScript常见语法错误检查  
" 默认快捷方式为 F5  
"-----------------------------------------------------------------  
let g:checksyntax_auto = 0 " 不自动检查  
  
  
  
  
"-----------------------------------------------------------------  
" plugin - NeoComplCache.vim 自动补全插件  
"-----------------------------------------------------------------  
let g:AutoComplPop_NotEnableAtStartup = 1  
let g:NeoComplCache_EnableAtStartup = 1  
let g:NeoComplCache_SmartCase = 1  
let g:NeoComplCache_TagsAutoUpdate = 1  
let g:NeoComplCache_EnableInfo = 1  
let g:NeoComplCache_EnableCamelCaseCompletion = 1  
let g:NeoComplCache_MinSyntaxLength = 3  
let g:NeoComplCache_EnableSkipCompletion = 1  
let g:NeoComplCache_SkipInputTime = '0.5'  
let g:NeoComplCache_SnippetsDir = $VIMFILES.'/snippets'  
" <TAB> completion.  
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"  
" snippets expand key  
imap <silent> <C-e> <Plug>(neocomplcache_snippets_expand)  
smap <silent> <C-e> <Plug>(neocomplcache_snippets_expand)  
  
  
" Don't write backup file if vim is being called by "crontab -e"  
au BufWrite /private/tmp/crontab.* set nowritebackup  
" Don't write backup file if vim is being called by "chpass"  
au BufWrite /private/etc/pw.* set nowritebackup  

" Tagbar
let g:tagbar_width=35
let g:tagbar_autofocus=1
nmap <F4> :TagbarToggle<CR>

"set guifont=courier_new:h10

"vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim/
set rtp+=~/.vim/bundle/vundle/
"set rtp+=$vim\vimfiles\bundle\Vundle.vim
"set rtp+=$vim\vimfiles\bundle\
call vundle#rc()
" alternatively, pass a path where Vundle should install plugins
"let path = '~/some/path/here'
"call vundle#rc(path)

    Plugin 'gmarik/vundle'

    " The following are examples of different formats supported.
    " Keep Plugin commands between here and filetype plugin indent on.
    " scripts on GitHub repos
    Plugin 'tpope/vim-fugitive'
    Plugin 'Lokaltog/vim-easymotion'
    Plugin 'tpope/vim-rails.git'
    Plugin 'scrooloose/nerdtree'
    "Plugin 'The-NERD-tree'
	Plugin 'majutsushi/tagbar'
	"CODE REFERENCE FIND
	Plugin 'lboulard/cscope'
    " The sparkup vim script is in a subdirectory of this repo called vim.
    " Pass the path to set the runtimepath properly.
    Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
    " scripts from http://vim-scripts.org/vim/scripts.html
    Plugin 'L9'
    Plugin 'FuzzyFinder'
	Plugin 'kien/ctrlp.vim'
	Plugin 'vim-airline/vim-airline'
	Plugin 'vim-airline/vim-airline-themes'
	"Plugin 'jlanzarotta/bufexplorer'
	
	Plugin 'altercation/vim-colors-solarized'
	
	" 新插件
	Plugin 'mbbill/code_complete'
	Plugin 'tpope/vim-surround'
	Plugin 'tpope/vim-repeat'
	"Plugin 'Lokaltog/vim-easymotion'
	Plugin 'airblade/vim-gitgutter'
	
	" scripts not on GitHub
    "Plugin 'git://git.wincent.com/command-t.git'
	Plugin 'molokai'
	Plugin 'altercation/solarized'	
	Plugin 'gosukiwi/vim-atom-dark'	
    Plugin 'vim-scripts/taglist.vim'
    Plugin 'fholgado/minibufexpl.vim'
    Plugin 'flazz/vim-colorschemes'
    Plugin 'vim-scripts/a.vim'
    Plugin 'vim-scripts/CRefVim'
	"自动补齐
	"Plugin 'vim-scripts/AutoComplPop'
	"Plugin 'vim-scripts/snipMate'
	"Plugin 'vim-scripts/OmniCppComplete'

    " git repos on your local machine (i.e. when working on your own plugin)
    "Plugin 'file:///home/gmarik/path/to/plugin'
    " ...
filetype plugin indent on     " required

"powerline字体
"set guifont=Source\ Code\ Pro\ Medium:13

" Set extra options when running in GUI mode”let g:airline_powerline_fonts=1
" enable/disable enhanced tabline. (c)
let g:airline#extensions#tabline#enabled = 1
" 标签上不显示路径；
let g:airline#extensions#tabline#formatter = 'unique_tail'
" enable/disable displaying open splits per tab (only when tabs are opened). >
let g:airline#extensions#tabline#show_splits = 1
" switch position of buffers and tabs on splited tabline (c)
let g:airline#extensions#tabline#switch_buffers_and_tabs = 1
" enable/disable displaying buffers with a single tab. (c)
let g:airline#extensions#tabline#show_buffers = 0 
" enable/disable displaying tabs, regardless of number. (c)
let g:airline#extensions#tabline#show_tabs = 1
" enable/disable display preview window buffer in the tabline. >
let g:airline#extensions#tabline#exclude_preview = 0
" configure how numbers are displayed in tab mode. >
let g:airline#extensions#tabline#tab_nr_type = 2 " # of splits (default)
" enable/disable displaying tab number in tabs mode. >
let g:airline#extensions#tabline#show_tab_nr = 1
" enable/disable displaying tab type (far right) >
let g:airline#extensions#tabline#show_tab_type = 0  
let g:airline_powerline_fonts = 1

colorscheme molokai
"colorscheme desert
"设置右边界显示。
set cc=100
set t_Co=256

"CtrlP配置
let g:ctrlp_switch_buffer = 'Et'
let g:ctrlp_by_filename = 1
	
"cscope
	if has("cscope")
		set csprg=/usr/local/bin/cscope
		set csto=0
		set cst
		set nocsverb
		" add any database in current directory
		if filereadable("cscope.out")
		    cs add cscope.out
		" else add database pointed to by environment
		elseif $CSCOPE_DB != ""
		    cs add $CSCOPE_DB
		endif
		set csverb
		nmap <C-/>s :cs find s <C-R>=expand("<cword>")<CR><CR>
		nmap <C-/>g :cs find g <C-R>=expand("<cword>")<CR><CR>
        nmap <C-/>c :cs find c <C-R>=expand("<cword>")<CR><CR>
        nmap <C-/>t :cs find t <C-R>=expand("<cword>")<CR><CR>
        nmap <C-/>e :cs find e <C-R>=expand("<cword>")<CR><CR>
        nmap <C-/>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
        nmap <C-/>i :cs find i <C-R>=expand("<cfile>")<CR>$<CR>
        nmap <C-/>d :cs find d <C-R>=expand("<cword>")<CR><CR>
	endif

"cscope add 快捷键
"nnoremap <silent><F5> :cs add cscope.out `pwd`<CR>
"cs add ~/.cscope/*.out
"g光标停止闪烁
set gcr=a:block-blinkon0
"defaults write org.vim.MacVim MMNativeFullScreen 0
"set guifont=monaco:h13
"关键字高亮  
syn match cFunction "/<[a-zA-Z_][a-zA-Z_0-9]*/>[^()]*)("me=e-2  
syn match cFunction "/<[a-zA-Z_][a-zA-Z_0-9]*/>/s*("me=e-1  
hi cFunction gui=none guifg=#1875CD  
"自定义高亮关键字  
syn keyword cType uint uchar uint32 ip_addr_t uint16 bcm_vlan_t soc_mem_t bcm_mac_t bcm_ip_t bcm_ip6_t bcm_if_t bcm_port_t uint8
set completeopt=longest,menu
"cd ~/code
