" Author : H.Yin
" Email  : csustyinhao@gmail.com
" GitHub : https://github.com/H-Yin/linux_workspace_setting

" ======================================================================================================= settings
set shell=sh
set enc=utf-8                                                   " 设置编码格式
set fileformat=unix                                             " 设置文件格式
set syntax=on                                                   " 开启语法
set signcolumn=yes                                              " 开启符号列
set cmdheight=1                                                 " 设置命令行高度
set updatetime=500                                              " 设置更新时间
set number                                                      " 设置行号
set cursorline                                                  " 突出显示当前行
set showmatch                                                   " 高亮显示匹配的括号
set hidden                                                      " 
set nocompatible                                                " 设置不使用 vi 键盘模式
set backspace=indent,eol,start
set mouse-=a                                                    " 设置非鼠标模式
set shortmess+=cAI                                              " 不展示 ins-completion-menu 信息
set autoindent                                                  " 自动缩进
set cindent                                                     " C语言格式的自动缩进
set tabstop=4                                                   " 设置 tab宽度
set softtabstop=4
set shiftwidth=4
set expandtab                                                   " 自动扩展 TAB

set autowrite                                                   " 自动保存
set autoread                                                    " 文件修改时自动加载
set noeb                                                        " 去掉输入错误的提示声音
set confirm                                                     " 在处理未保存或只读文件的时候，弹出确认
set clipboard+=unnamed                                          " 共享剪贴板
set modifiable
set ignorecase                                                  " 搜索忽略大小写
set t_Co=256
set autochdir
" 显示特殊字符
" set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
" set list
set fillchars=stlnc:_,vert:\|,fold:~,diff:_             " 设置分屏间隔符


" 设置主题颜色
colorscheme koehler


" ======================================================================================================= plugins
filetype off
call plug#begin('~/.vim/plugged')

Plug 'mhinz/vim-startify'                                       " 启动页管理
Plug 'vim-airline/vim-airline'                                  " 状态栏管理
Plug 'vim-airline/vim-airline-themes'                           " 状态栏主题
Plug 'bling/vim-bufferline'                                     " 状态栏显示 buffer 信息
Plug 'bsdelf/bufferhint'                                        " 缓冲区管理
Plug 'mbbill/undotree'                                          " undo 管理
Plug 'junegunn/vim-peekaboo'                                    " 寄存器管理
Plug 'TaDaa/vimade'                                             " 窗口增强

Plug 'preservim/nerdtree'                                       " 目录管理
Plug 'jistr/vim-nerdtree-tabs'                                  " nerdtree 增强
Plug 'Xuyuanp/nerdtree-git-plugin'                              " nerdtree 增强 git

Plug 'tpope/vim-fugitive'                                       " git 插件
Plug 'zivyangll/git-blame.vim'                                  " 状态栏显示 git blame
Plug 'airblade/vim-gitgutter'                                   " sign 栏显示 git 信息
Plug 'junegunn/gv.vim'                                          " buffer 显示 git 提交记录

Plug 'mg979/vim-visual-multi', {'branch': 'master'}             " 多行编辑
Plug 'Yggdroot/indentLine'                                      " 上下对齐线
Plug 'itchyny/vim-cursorword'                                   " 高亮当前单词
Plug 'luochen1990/rainbow'                                      " 高亮括号

Plug 'vim-syntastic/syntastic'                                  " 编程语法
Plug 'preservim/nerdcommenter'                                  " 代码注释
Plug 'preservim/tagbar'                                         " 标签
Plug 'skywind3000/asyncrun.vim'                                 " 异步运行
Plug 'sbdchd/neoformat'
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }

Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()
filetype plugin indent on

" ======================================================================================================= vim-plug
let g:plug_threads=1
let g:plug_timeout=15
let g:plug_retries=1
let g:plug_url_format='https://github.com/%s.git'

" ======================================================================================================= airline
let g:airline_theme='dark'
let g:airline_detect_paste = 1
let g:airline_detect_modified = 1
let g:airline_detect_spell = 1
let g:airline_section_c_only_filename = 0                       " 显示完整文件名
let g:airline_inactive_collapse = 1                             " 不活动窗口折叠显示
let g:airline_statusline_ontop = 0                              " 显示在下方
let g:airline_powerline_fonts = 1                               " 使用 unicode 字符
let g:airline_skip_empty_sections = 1                           " 跳过空的 section

let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'    " 自动隐藏默认的编码格式
let g:airline#extensions#tabline#enabled = 1                    " 开启 tab 和 buffer
let g:airline#extensions#tabline#left_sep = ' >'
let g:airline#extensions#tabline#right_sep = '< '
let g:airline#extensions#bufferline#enabled = 1                 " 集成 bufferline
let g:airline#extensions#bufferline#overwrite_variables = 1     " 允许 bufferline 修改变量
let g:airline#extensions#coc#enabled = 1                        " 集成 coc
let g:airline#extensions#tagbar#enabled = 1                     " 集成 tagbar
let g:airline#extensions#tagbar#flags = 's'                     " 显示函数签名
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = ' '
let g:airline_symbols.maxlinenr = ' '
let g:airline_symbols.colnr = ' col:'

" ======================================================================================================= bufferline
let g:bufferline_echo = 1                                       " 在命令栏自动显示
let g:bufferline_active_buffer_left = '['                       " 激活 buffer 的左侧分隔符
let g:bufferline_active_buffer_right = ']'                      " 活动 buffer 的右侧分隔符
let g:bufferline_modified = '+'                                 " buffer 被修改的的标识符 
let g:bufferline_show_bufnr = 1                                 " 显示 buffer 数字
let g:bufferline_rotate = 0                                     " buffer 不循环不滚动
let g:bufferline_fixed_index = -1                               " rotate 时固定 buffer 位置
let g:bufferline_fname_mod = ':.'                               " 文件名显示为相对路径 
let g:bufferline_pathshorten = 0                                " 显示 buffer name 中的完整路径

" ======================================================================================================= bufferhint
let g:bufferhint_SortMode = 0                                   " buffer 排序方式
let g:bufferhint_MaxWidth = 48                                  " 窗口宽度
let g:bufferhint_KeepWindow = 1                                 " buffer 删除后保存窗口

" ======================================================================================================= vimade
let g:vimade_running = 1                                        " 运行vimade
let g:vimade = {"fadelevel": 0.5, 'groupdiff':1}

" ======================================================================================================= NERDTree
let g:NERDTreeWinPos = 'left'                                   " 窗口位置
let g:NERDTreeWinSize = 32                                      " 窗口大小
let g:NERDTreeMinimalUI = 1                                     " 不显示提示
let g:NERDTreeShowBookmarks = 0                                 " 不显示书签
let g:NERDTreeHijackNetrw = 1                                   " 使用 netrw
let g:NERDTreeChDirMode = 2                                     " cd 模式
let g:NERDTreeMinimalMenu = 1                                   " 启用最小功能菜单
let g:NERDTreeCaseSensitiveSort = 1                             " 排序时区分大小写
let g:NERDTreeNaturalSort = 1                                   " 自然排序而不是按照字符串排序
let g:NERDTreeCascadeSingleChildDir = 1                         " 目录下只有一个子目录时折叠显示
let g:NERDTreeCascadeOpenSingleChildDir = 1                     " 目录下只有一个子目录时递归打开
let g:NERDTreeAutoDeleteBuffer = 1                              " 自动删除 buffer
let g:NERDTreeAutoCenterThreshold = 10                          " 窗口内容居中的阈值
let g:NERDTreeDirArrowExpandable = '+'                          " 收起图标
let g:NERDTreeDirArrowCollapsible = '-'                         " 展开图标
let g:NERDTreeShowHidden = 0                                    " 显示隐藏文件
let g:NERDTreeIgnore = ['\~$', '\.pyc', '\.swp', '__pycache__'] " 忽略指定格式的文件
let g:NERDTreeRespectWildIgnore = 0                             " 使用 vim 的 'wildignore' 忽略文件
let g:NERDTreeShowLineNumbers = 1                               " 窗口显示行号
let g:NERDTreeHighlightCursorline  = 1                          " 使用 vim 的 'cursorline' 选项高亮当前行
let g:NERDTreeCreatePrefix='silent keepalt keepjumps'

" ======================================================================================================= NerdTreeTab
let g:nerdtree_tabs_open_on_console_startup = 2                 " 当打开目录时启动 nerdtree
let g:nerdtree_tabs_startup_cd = 1                              " 当命令行给的是目录名称，直接进入
let g:nerdtree_tabs_synchronize_focus = 1                       " 同步焦点
let g:nerdtree_tabs_synchronize_view = 0                        " 同步视图
let g:nerdtree_tabs_autoclose = 1                               " 当仅剩 nerdtree 窗口时自动退出
let g:nerdtree_tabs_autofind = 1                                " 在 nerdtree 中自动查找当前打开的文件

" ======================================================================================================= NERDTree-Git
let g:NERDTreeGitStatusShowClean = 0                            " clean 状态不显示
let g:NERDTreeGitStatusShowIgnored = 0                          " 显示忽略的文件
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"   : "*",
    \ "Staged"     : "+",
    \ "Untracked"  : "!",
    \ "Renamed"    : "%",
    \ "Unmerged"   : "=",
    \ "Deleted"    : "-",
    \ "Dirty"      : "~",
    \ "Clean"      : "",
    \ "Ignored"    : "",
    \ "Unknown"    : "?"
    \}                                                          " 状态符号

" =======================================================================================================  undortree
let g:undotree_WindowLayout = 3                                 " 显示布局
let g:undotree_SplitWidth = 48                                  " 宽度
let g:undotree_DiffpanelHeight = 30                             " 高度
let g:undotree_SetFocusWhenToggle = 1                           " 打开时聚焦
let g:undotree_ShortIndicators = 1                              " 显示短格式的时间
let g:undotree_CursorLine = 1                                   " 高亮显示
let g:undotree_HelpLine = 0                                     " 不显示帮助信息

" ======================================================================================================  tagbar
let g:tagbar_case_insensitive = 1                               " 排序时遵循大小写
let g:tagbar_autoshowtag = 1                                    " 展开折叠的标签
let g:tagbar_show_data_type = 1                                 " 显示 tag 类型
let g:tagbar_show_linenumbers = -1                              " 显示行号
let g:tagbar_iconchars = ['+', '-']                             " 折叠符号


" ======================================================================================================= indentLine
let g:indentLine_char_list = ['|', '¦', '┆', '┊']               " 对齐线用到的字符列表
let g:indentLine_bufTypeExclude = ['help', 'terminal']          " 给定的缓冲区类型不用对齐线

" ======================================================================================================= rainbow
let g:rainbow_active = 1                                        " 启用括号彩色匹配

" ======================================================================================================= syntastic
let g:syntastic_check_on_open = 1                               " 文件打开时检查语法
let g:syntastic_check_on_wq = 0                                 " 文件关闭时不检查语法
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1 
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_mode_map = { "mode": "active", "active_filetypes": [], "passive_filetypes": ["python"] }

" ======================================================================================================= NERDCommenter
let g:NERDCompactSexyComs = 0                                   " 多行注释更好的风格
let g:NERDCommentEmptyLines = 1                                 " 空行也注释
let g:NERDSpaceDelims = 1                                       " 注释时增加前后增加一个空格
let g:NERDRemoveExtraSpaces = 1                                 " 移除注释时也移除多余空格
let g:NERDTrimTrailingWhitespace = 1                            " 移除注释时，如果是空行则移除所有空白
let g:NERDDefaultAlign = 'left'                                 " 注释对齐方式
let g:NERDCustomDelimiters = {
    \ 'c'           : { 'left': '//', 'leftAlt': '/*', 'rightAlt': '*/' },
    \ 'cpp'         : { 'left': '//', 'leftAlt': '/*', 'rightAlt': '*/' },
    \ 'java'        : { 'left': '//', 'leftAlt': '/*', 'rightAlt': '*/' },
    \ 'python'      : { 'left': '#', 'leftAlt': '#' },
    \ 'sh'          : { 'left': '#'},
    \ 'sql'         : { 'left': '-- ', 'leftAlt': '/*', 'rightAlt': '*/' },
    \ 'dockerfile'  : { 'left': '#' },
    \ 'lua'         : { 'left': '--', 'leftAlt': '--[[', 'rightAlt': ']]' },
    \ 'vimperator'  : { 'left': '"' },
    \ 'yaml'        : { 'left': '#' },
    \ }                                                         " 不同文件注释方式

" ======================================================================================================= asyncrun
let g:asyncrun_open=10
let g:asyncrun_save=1

" ======================================================================================================= coc

let g:coc_global_extensions =['coc-clangd', 'coc-jedi', 'coc-snippets','coc-markdownlint','coc-git','coc-cmake','coc-tabnine']
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
            \ coc#pum#visible() ? coc#pum#next(1):
            \ CheckBackspace() ? "\<Tab>" :
            \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" ======================================================================================================= 按键映射
nnoremap <silent><nowait> <C-q> :call F_auto_close()<CR>                        " 正常模式下保存操作
inoremap <silent><nowait> <C-q> <ESC>:call F_auto_close<CR>                     " 插入模式下保存操作
nnoremap <silent><nowait> <C-s> :update<CR>                                      " 正常模式下保存操作
inoremap <silent><nowait> <C-s> <Esc>:update<CR>                                 " 插入模式下保存操作
nnoremap <silent><nowait> <C-z> undo                                             " 所有模式下撤销操作                        
inoremap <silent><nowait> <C-z> <Esc>:undo<CR>                                   " 所有模式下撤销操作                        

nnoremap <silent><nowait> tn :tabnew untitled<CR>                                " 创建新的标签页
nnoremap <silent><nowait> tc :w<CR>:tabclose<CR>                                 " 保存并关闭当前标签页                                
nnoremap <silent><nowait> t<Left> :-tabnext<CR>                                  " 往左边切换标签页
nnoremap <silent><nowait> t<Right> :+tabnext<CR>                                 " 往右边切换标签页

nnoremap <silent><nowait> <Tab> <C-w>w                                           " 循环移动光标到下一个窗口 ???
nnoremap <silent><nowait> w<Left> <C-w>h                                         " 光标移动到左边窗口
nnoremap <silent><nowait> w<Right> <C-w>l                                        " 光标移动到右边窗口
nnoremap <silent><nowait> w<Up> <C-w>k                                           " 光标移动到上边窗口
nnoremap <silent><nowait> w<Down> <C-w>j                                         " 光标移动到下边窗口
nnoremap <silent><nowait> w[ :res -3<CR>                                         " 垂直减小
nnoremap <silent><nowait> w] :res +3<CR>                                         " 垂直加长
nnoremap <silent><nowait> w= :vertical resize+8<CR>                              " 水平加宽
nnoremap <silent><nowait> w- :vertical resize-8<CR>                              " 水平减宽

noremap <silent><nowait> <F1> :NERDTreeToggle<CR>                                " NerdTree
noremap <silent><nowait> <F2> :TagbarToggle<CR>                                  " Tagbar
noremap <silent><nowait> <F5> :call F_auto_run()<CR>
noremap <silent><nowait> <F6> :UndotreeToggle<CR>                                " UndoTree
noremap <silent><nowait> <F9> :call F_auto_comment()<CR>
noremap <silent><nowait> <F12> :call F_paste_toggle()<CR>

set autochdir
nnoremap . :NERDTree .<CR>
nnoremap .. :NERDTree ..<CR>
" BufferHint
nnoremap b- :call bufferhint#Popup()<CR>
nnoremap b= :call bufferhint#LoadPrevious()<CR>
nmap \\ <leader>c<Space>                                        " 快速注释
nnoremap gb :<C-u>call gitblame#echo()<CR>                      " git blame

" ====================================================================================

nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" 跳转到变量定义。normal 模式下在一个变量名上按一下 gd 即可跳转到定义位置，然后ctrl-o 可以快速返回原位置
nmap <silent> gd <Plug>(coc-definition)
" 跳转到值的类型定义，或者跳转到函数的返回值类型。在你想要快速查找一个类型的结构的时候非常有用
nmap <silent> gy <Plug>(coc-type-definition)
" 跳转到 interface 接口的对应实现。比如查看go里一个 interface 被哪些 struct 实现了
nmap <silent> gi <Plug>(coc-implementation)
" 打开当前变量、函数等被引用的列表。比如看一个 函数 在哪些地方使用了
nmap <silent> gr <Plug>(coc-references)


" ======================================================================================================= 自定义功能

function! F_auto_close()
    if &buftype == 'nofile' || &readonly 
        :q!
    else
        :wq
    endif
endfunction


" 切换粘贴模式
let b:paste_toggle_on = 1
function! F_paste_toggle()
    if b:paste_toggle_on == 1
        if &filetype == 'csv'
            exec ":RainbowAlign"
        else
            :GitGutterBufferDisable
            :IndentLinesDisable
            :set nonumber
            :set paste
            :set signcolumn=no
        endif
        let b:paste_toggle_on = 0
    else
        if &filetype == 'csv'
            exec ":RainbowShrink"
        else
            :GitGutterBufferEnable
            :IndentLinesEnable
            :set number
            :set nopaste
            :set signcolumn=yes
        endif
        let b:paste_toggle_on = 1
    endif
    echo "Format " . &filetype ." success."
endfunction

" Your vimrc
function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction
set statusline+=%{GitStatus()}




" 设置折叠
function PythonFoldText()
    let line = getline(v:foldstart)
    echo line
    let sub = substitute(line, ':.*$', '', 'g')
    return v:folddashes . '(' . v:foldstart. '~'. v:foldend . ') ' . sub
endfunction

function! GetPythonFold(lnum)
    let line = getline(a:lnum - 1)

    " Classes and functions get their own folds
    if line =~ '^\s*\(class\|def\)\s'
    " Verify if the next line is a class or function definition
    " as well
        let imm_nnum = a:lnum + 1
        let nnum = nextnonblank(imm_nnum)
        if nnum - imm_nnum < 2
            let nind = indent(nnum)
            let pind = indent(a:lnum - 1)
            if pind >= nind
                let nline = getline(nnum)
                let w:nestinglevel = nind
                return "<" . ((w:nestinglevel + &sw) / &sw)
            endif
        endif
        let w:nestinglevel = indent(a:lnum - 1)
        return ">" . ((w:nestinglevel + &sw) / &sw)
    endif

    " If next line has less or equal indentation than the first one,
    " we end a fold.
    let nind = indent(nextnonblank(a:lnum + 1))
    if nind <= w:nestinglevel
        let w:nestinglevel = nind
        return "<" . ((w:nestinglevel + &sw) / &sw)
    else
        let ind = indent(a:lnum)
        if ind == (w:nestinglevel + &sw)
            if nind < ind
                let w:nestinglevel = nind
                return "<" . ((w:nestinglevel + &sw) / &sw)
            endif
        endif
    endif

    " If none of the above apply, keep the indentation
    return "="
endfunction

func F_set_fold()
    if &filetype == 'python'
        set foldmethod=expr
        set foldexpr=GetPythonFold(v:lnum)
        set foldtext=PythonFoldText()
    endif
endfunc


highlight VertSplit ctermfg=green ctermbg=None term=None


"----------------------------------------------------------------------------------------------------------
"                                                        user-defined function
" add comment
" # autocmd BufEnter * if 0 == len(filter(range(1, winnr('$')), 'empty(getbufvar(winbufnr(v:val), "&bt"))')) | qa! | endif
" autocmd BufEnter *.h,*.hpp,*.cpp,*.c,*.cc,*.cxx,*.py exec ":TagbarOpen"
" autocmd BufNewFile *.h,*.hpp,*.cpp,*.c,*.py,*.sh exec ":call F_auto_comment()"
" autocmd BufWrite,FileWritePre *h,*.cpp,*.c,*.py,*.sh exec ":call F_auto_update()"
" autocmd BufEnter *.py exec ":call F_set_fold()"

let s:userAuthor = 'H.Yin'
let s:userEmail  = 'csustyinhao@gmail.com'

fun F_auto_update()
    let a:lnum = search("^[*#]  Modified")
    let a:line = "  Modified    : "
    if a:lnum > 0
        if &filetype == 'sh' || &filetype == 'python'
            let a:line = '#'. a:line
        elseif &filetype == 'cpp' || &filetype == 'c'
            let a:line = '*'. a:line
        else
            let a:line = ''
        endif
        let a:line .= strftime("%Y-%m-%d %H:%M:%S(%z)")
        call setline(a:lnum, a:line)
    endif
endfunc


"----------------------------------------------------------------------------------------------------------

func F_auto_comment_h()
    call append(0, "/*******************************************************************")
    call append(1, "*  File        : ". expand("%:t"))
    call append(2, "*  Author      : ". s:userAuthor)
    call append(3, "*  Email       : ". s:userEmail)
    call append(4, "*  Created     : ". strftime("%Y-%m-%d %H:%M:%S(%z)"))
    call append(5, "*  Modified    : ". strftime("%Y-%m-%d %H:%M:%S(%z)"))
    call append(6, "*  GitHub      : https://github.com/H-Yin/")
    call append(7, "*  Description : ")
    call append(8, "*******************************************************************/")
    call append(line("$"), "")
    call append(line("$"), "")
    call append(line("$"), "#pragma once")
    call append(line("$"), "#ifndef __".toupper(expand("%:t:r"))."_H__")
    call append(line("$"), "#define __".toupper(expand("%:t:r"))."_H__")
    call append(line("$"), "")
    call append(line("$"), "#ifdef __cplusplus")
    call append(line("$"), "extern \"C\" {")
    call append(line("$"), "#endif")
    call append(line("$"), "")
    call append(line("$"), "")
    call append(line("$"), "")
    call append(line("$"), "#ifdef __cplusplus")
    call append(line("$"), "}")
    call append(line("$"), "#endif")
    call append(line("$"), "#endif //".expand("%:t:r").".h")
    call append(line("$"), "")
    call append(line("$"), "")
endfunc

func F_auto_comment_cpp()
    call append(0, "/*******************************************************************")
    call append(1, "*  File        : ". expand("%:t"))
    call append(2, "*  Author      : ". s:userAuthor)
    call append(3, "*  Email       : ". s:userEmail)
    call append(4, "*  Created     : ". strftime("%Y-%m-%d %H:%M:%S(%z)"))
    call append(5, "*  Modified    : ". strftime("%Y-%m-%d %H:%M:%S(%z)"))
    call append(6, "*  GitHub      : https://github.com/H-Yin/")
    call append(7, "*  Description : ")
    call append(8, "*******************************************************************/")
    call append(line("$"), "")
    call append(line("$"), "")
endfunc

fun F_get_shabang(interpreter)
    let a:cmd = ':0r !which '. a:interpreter
    exec a:cmd
    let a:line = '#!'. getline(1)
    call setline(1, a:line)
endfunc

func F_auto_comment_sh()
    " call F_get_shabang('bash')
    call setline(1, "#!/usr/bin/env bash")
    call setline(2, "")
    call append(2, "##################################################################")
    call append(3, "#  File        : ". expand("%:t"))
    call append(4, "#  Author      : ". s:userAuthor)
    call append(5, "#  Email       : ". s:userEmail)
    call append(6, "#  Created     : ". strftime("%Y-%m-%d %H:%M:%S(%z)"))
    call append(7, "#  Modified    : ". strftime("%Y-%m-%d %H:%M:%S(%z)"))
    call append(8, "#  GitHub      : https://github.com/H-Yin/")
    call append(9, "#  Description : ")
    call append(10, "#################################################################")
    call append(11, "")
    call append(12, "")
endfunc

func F_auto_comment_python()
    call F_get_shabang('python')
    call setline(2, "#-*- coding=utf-8 -*-")
    call setline(3, "")
    call append(3, "##################################################################")
    call append(4, "#  File        : ". expand("%:t"))
    call append(5, "#  Author      : ". s:userAuthor)
    call append(6, "#  Email       : ". s:userEmail)
    call append(7, "#  Created     : ". strftime("%Y-%m-%d %H:%M:%S(%z)"))
    call append(8, "#  Modified    : ". strftime("%Y-%m-%d %H:%M:%S(%z)"))
    call append(9, "#  GitHub      : https://github.com/H-Yin/")
    call append(10, "#  Description : ")
    call append(11, "#################################################################")
    call append(12, "")
    call append(13, "")
endfunc

func F_auto_comment()
    " echo &filetype
    if &filetype == 'sh'
        call F_auto_comment_sh()
    elseif &filetype == 'python'
        call F_auto_comment_python()
    elseif &filetype == 'cpp' || &filetype =='c'
        call F_auto_comment_cpp()
    else
        if expand("%:e") == 'h'
            call F_auto_comment_h()
        endif
    endif
endfunc


func! F_auto_run()
    exec "w"
    if &filetype == 'c'
        exec ':AsyncRun -mode=term -pos=hide gcc "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)"'
        exec ":AsyncRun -mode=term -pos=bottom -rows=10 -focus=0 $(VIM_FILEDIR)/$(VIM_FILENOEXT)"
    elseif &filetype == 'cpp'
        exec ':AsyncRun -pos=hide g++ -O3 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" -lpthread'
        exec ":AsyncRun -mode=term -pos=bottom -rows=10 -focus=0 $(VIM_FILEDIR)/$(VIM_FILENOEXT)"
    elseif &filetype == 'python'
        exec ":AsyncRun -mode=term -pos=bottom -rows=10 -focus=0 python3 $(VIM_FILEPATH)"
    elseif &filetype == 'html'
        exec ":AsyncRun -mode=term -pos=hide open $(VIM_FILEPATH)"
    elseif &filetype == 'go'
        exec ":AsyncRun -mode=term -pos=hid go build $(VIM_FILEDIR)/$(VIM_FILENOEXT)"
        exec ":AsyncRun -mode=term -pos=bottom -rows=10 -focus=0 go run $(VIM_FILEPATH)"
    elseif &filetype == 'javascript'
        exec ":AsyncRun -mode=term -pos=bottom -rows=10 -focus=0 node $(VIM_FILEPATH)"
    endif
endfunc

