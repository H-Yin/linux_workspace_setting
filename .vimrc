set enc=utf-8               " 设置编码格式
set syntax=on               " 开启语法
set number                  " 设置行号
set autoindent              " 自动缩进
set cindent                 " C语言格式的自动缩进
set tabstop=4               " 设置 tab宽度
set softtabstop=4
set shiftwidth=4
set expandtab               " 自动扩展 TAB
set autowrite               " 自动保存
set autoread                " 文件修改时自动加载
" set ruler                   " 打开状态栏标尺
set cursorline              " 突出显示当前行
" 高亮显示匹配的括号
set showmatch               " 高亮括号
set noeb                    " 去掉输入错误的提示声音
set confirm                 " 在处理未保存或只读文件的时候，弹出确认
" set cmdheight=2             " 设置命令行高度
set clipboard+=unnamed      " 共享剪贴板
set modifiable

set nocompatible            " 设置不使用 vi 键盘模式

" 设置分屏间隔符
set fillchars=vert:\ ,stlnc:\ 

" 切换窗口
map <Tab> <C-w>w
" 保存文件
" nmap <C-s> :update<CR>
" vmap <C-s> <C-C>:update<CR>
" imap <C-s> <Esc>:update<CR>i

filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/taglist.vim'
Plugin 'vim-scripts/DoxygenToolkit.vim'
" Plugin 'fholgado/minibufexpl.vim'

Bundle 'scrooloose/nerdcommenter'

" scala highlight
Bundle 'derekwyatt/vim-scala'


call vundle#end()
filetype plugin indent on

" NERDTree
map <F1> :NERDTreeToggle<CR>
let g:NERDTreeSize = 50                  " 窗口大小
let g:NERDTreeHidden = 0                 " 不显示隐藏文件
" let g:NERDTreeMinimalUI = 1              " 不现实提示
let g:NERDTreeWinPos = 'left'            " 窗口位置
let g:NERDTreeShowLineNumbers = 1        " 窗口显示行号
let g:NERDTreeAutoCenter = 1             " 窗口内容随鼠标居中
let g:NERDTreeAutoCenterThreshold = 30   " 窗口内容居中的阈值
let g:NERDTreeDirArrowExpandable = '+'   " 收起图标
let g:NERDTreeDirArrowCollapsible = '-'  " 展开图标
let g:NERDTreeHighlightCursorline  = 1   " 高亮当前行
let g:NERDTreeIgnore = ['\.pyc', '\.swp'] " 忽略指定格式的文件
" 自动启动 NERDTree
autocmd vimenter * NERDTree
" 只剩 NERDTree 窗口时直接退出
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" taglist
map <F2> :Tlist<CR>
let Tlist_Show_Menu = 0         " 不显示菜单
let Tlist_Show_One_File = 1     " 仅显示当前文件中的tags
let Tlist_Exit_OnlyWindow = 1   " 如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1  " 使用右侧窗口
let Tlist_GainFocus_On_ToggleOpen = 1


" DoxygenToolkit
let g:DoxygenToolkit_blockHeader  = "--------------------------------------------------------------------------"
let g:DoxygenToolkit_blockFooter  = "----------------------------------------------------------------------------"
let g:DoxygenToolkit_dateTag      = "@Update  "
let g:DoxygenToolkit_authorTag    = "@Author  "
let g:DoxygenToolkit_briefTag_pre = "@Email   "
let g:DoxygenToolkit_paramTag_pre = "@Param   "
let g:DoxygenToolkit_returnTag    = "@Return  "
let g:DoxygenToolkit_versionTag   = "@Version "
let g:DoxygenToolkit_authorName   = "H.Yin"
let g:DoxygenToolkit_briefTag_post = "csustyinhao@gmail.com"

" 快速单行/多行注释: NERDCommenter
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDCommentEmptyLines = 1
let g:NERDDefaultAlign = 'left'
let g:NERDTrimTrailingWhitespace = 1
" 快速注释
nmap // <leader>c<Space>
imap // <Esc><leader>c<Space>i

" miniBufexplorer
" let g:miniBufExplShowBufNumbers = 1
" let g:miniBufExplSplitToEdge = 1
" let g:miniBufExplBuffersNeeded = 1
