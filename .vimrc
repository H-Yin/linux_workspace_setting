" Author: H.Yin
" Email : csustyinhao@gmail.com
" GitHub: https://github.com/H-Yin/linux_workspace_setting

"----------------------------------------------------------------------------------------------------------
"                                                   basic settings
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
set ignorecase              " 搜索忽略大小写
set nocompatible            " 设置不使用 vi 键盘模式
" set mouse=a                 " 设置鼠标点击可移动光标
" 显示特殊字符
" set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
" set list

" 设置分屏间隔符
set fillchars=vert:\ ,stlnc:\ 

" 切换窗口
map <Tab> <C-w>w
" 保存文件
" nmap <C-s> :update<CR>
" vmap <C-s> <C-C>:update<CR>
" imap <C-s> <Esc>:update<CR>i

" 设置主题颜色
colorscheme koehler

"----------------------------------------------------------------------------------------------------------
"                                                        user-defined function
" add comment
autocmd BufNewFile *.h,*.cpp,*.c,*.py,*.sh exec ":call F_auto_comment()"
autocmd BufWrite,FileWritePre *h,*.cpp,*.c,*.py,*.sh exec ":call F_auto_update()"
map <F4> :call F_auto_comment()<CR>

let s:userAuthor = 'H.Yin'
let s:userEmail  = 'csustyinhao@gmail.com'

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
"                                                         plug-ins management
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'xuyuanp/nerdtree-git-plugin'

Plugin 'vim-scripts/taglist.vim'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'bling/vim-bufferline'

Bundle 'scrooloose/nerdcommenter'
Plugin 'vim-scripts/DoxygenToolkit.vim'
Plugin 'vim-syntastic/syntastic'

" Plugin 'fholgado/minibufexpl.vim'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'ervandew/supertab'
Plugin 'kien/ctrlp.vim'


" sql plug-ins
Plugin 'vim-scripts/sqlcomplete.vim'
Plugin 'vim-scripts/sql.vim'

Plugin 'vim-scripts/sh.vim'
Plugin 'vim-scripts/awk.vim'
Plugin 'mattn/emmet-vim'
Plugin 'maksimr/vim-jsbeautify'



" scala highlight
Bundle 'derekwyatt/vim-scala'

Plugin 'Valloric/MatchTagAlways'
Plugin 'benmills/vimux'
Plugin 'roman/golden-ratio'

call vundle#end()
filetype plugin indent on


" NERDTree
map <F1> :NERDTreeToggle<CR>
let g:NERDTreeWinSize = 45               " 窗口大小
let g:NERDTreeHidden = 1                 " 不显示隐藏文件
let g:NERDTreeMinimalUI = 1              " 不现实提示
let g:NERDTreeWinPos = 'left'            " 窗口位置
let g:NERDTreeShowHidden = 1
let g:NERDTreeNaturalSort = 1
let g:NERDTreeShowLineNumbers = 1        " 窗口显示行号
" let g:NERDTreeAutoCenter = 1             " 窗口内容随鼠标居中
let g:NERDTreeAutoCenterThreshold = 30   " 窗口内容居中的阈值
let g:NERDTreeDirArrowExpandable = '+'   " 收起图标
let g:NERDTreeDirArrowCollapsible = '-'  " 展开图标
let g:NERDTreeHighlightCursorline  = 1   " 高亮当前行
let g:NERDTreeIgnore = ['\.pyc', '\.swp'] " 忽略指定格式的文件
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"   : "*",
    \ "Staged"     : "+",
    \ "Untracked"  : ">",
    \ "Renamed"    : "%",
    \ "Unmerged"   : "=",
    \ "Deleted"    : "!",
    \ "Dirty"      : "-",
    \ "Clean"      : "+",
    \ "Ignored"    : "-",
    \ "Unknown"    : "?"
    \}

" 自动启动 NERDTree
" autocmd vimenter * NERDTree
" 只剩 NERDTree 窗口时直接退出
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" taglist
map <F2> :TlistToggle<CR>
let g:Tlist_Auto_Update = 1       " 
let g:Tlist_Compact_Format = 1    "
let g:Tlist_Show_Menu = 0         " 不显示菜单
let g:Tlist_Show_One_File = 1     " 仅显示当前文件中的tags
let g:Tlist_Enable_Fold_Column = 1 "
let g:Tlist_Exit_OnlyWindow = 1   " 如果taglist窗口是最后一个窗口，则退出vim
let g:Tlist_Use_Right_Window = 1  " 使用右侧窗口
let g:Tlist_GainFocus_On_ToggleOpen = 1
let g:Tlist_WinWidth = 32

nmap <F1> :TlistToggle<CR>:NERDTreeToggle<CR><C-w>w
autocmd BufEnter * if 0 == len(filter(range(1, winnr('$')), 'empty(getbufvar(winbufnr(v:val), "&bt"))')) | qa! | endif

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
" let g:miniBufExplMapWindowNavVim = 1 
" let g:miniBufExplMapWindowNavArrows = 1 
" let g:miniBufExplMapCTabSwitchBufs = 1 
" let g:miniBufExplModSelTarget = 1
" let g:miniBufExplMoreThanOne=0


let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#left_sep = '»'
let g:airline#extensions#tabline#right_sep = '«'
" let g:airline#extensions#bufferline#enabled = 1
" let g:airline#extensions#bufferline#overwrite_variables = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = '='
let g:airline_symbols.maxlinenr = ''


let g:bufferline_echo = 0

let g:SuperTabDefaultCompletionType = "context"
let g:loaded_golden_ratio = 1
let g:golden_ratio_exclude_nonmodifiable = 1

let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" emmet-vim
let g:user_emmet_expandabbr_key = '<C-e>'
