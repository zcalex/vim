"set langmenu=utf

"



"编码格式, utf8
set fileencodings=utf-8,gbk
set fileencoding=utf-8
set encoding=utf-8
set termencoding=utf-8
set guifont=Courier_New:h20         ""设置字体
set fileformat=unix                 ""unix格式"

""tab缩进， 改成4个空格
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent                      ""自动缩进 

""语法高亮
syntax on
""配色方案
colorscheme molokai
""colorscheme foursee

set noeb                            ""无错误音
set number                          ""显示行号
set ignorecase smartcase            ""忽略大小写， 有大写仍然敏感
set nobackup                        ""禁止生成临时文件
set nocompatible                    ""不要使用vi键盘模式
set background=dark                 ""背景使用黑色
set autoread                        ""文件外部改动时自动载入
set autowrite                       ""自动保存

set history=100                     ""设置历史记录100
set backspace=indent,eol,start      ""回退相关的操作
set selectmode=mouse,key            ""鼠标相关
set hlsearch                        ""搜索字符高亮
set incsearch                       ""实时搜索
""set nowrapscan                      ""禁止在搜索到文件两端时重新搜索
set cursorline                      ""高亮当前行
set cursorcolumn                    ""高亮当前列
set wildmenu                        ""vim自身命令自动补全
filetype indent on

""高亮配色
highlight CursorLine   cterm=NONE ctermbg=darkred ctermfg=white
highlight CursorColumn cterm=NONE ctermbg=darkred ctermfg=white
set nowrap                          ""不自动换行
set showmatch                       ""高亮显示匹配括号
set autochdir                       ""自动切换到当前目录


" 在被分割的窗口间显示空白，便于阅读
 set fillchars=vert:\ ,stl:\ ,stlnc:\

""显示中文帮助
if version >= 603 
    set helplang=cn
    set encoding=utf-8
end  

""设置多语言环境, 文件编码
if has("multi_byte")
    ""暂时为空
endif    

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'ervandew/supertab'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Shougo/neocomplete.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'majutsushi/tagbar'
Plugin 'fatih/vim-go'

" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

if has("autocmd")
    ""新建文件插入文件头
    autocmd BufNewFile *.cpp,*.[ch],*.sh exec ":call SetTitle()"     
    filetype plugin indent on
    augroup vimrcEx 
        au!     
        autocmd FileType text setlocal textwidth=78
        autocmd BufReadPost *
                    \ if line("'\"") > 0 && line("'\"") <= line("$") |
                    \   exe "normal g`\"" |
                    \ endif 
    augroup END
endif

"" nerdtree 打开目录树
map <F2> :NERDTree<CR>
let NERDTreeIgnore=['\.o$', '\.ko$', '\.so$', '\.a$', '\.swp$', '\.bak$', '\~$']


"" ctrlp
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'

"" airline
set laststatus=2        ""永远显示状态栏
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
" 设置状态栏主题风格
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show=1
let g:airline#extensions#whitespace#enabled=1
let g:airline#extensions#whitespace#symbol='!'
let g:airline_powerline_fonts=1
if !exists('g:airline_symbols')
    let g:airline_symbols={}
    endif
let g:airline_left_sep=''
let g:airline_left_alt_sep=''
let g:airline_right_sep=''
let g:airline_right_alt_sep=''
let g:airline_symbols.branch=''
let g:airline_symbols.readonly=''
let g:airline_symbols.linenr=''
nnoremap <C-tab> :bn<CR>
nnoremap <C-s-tab> :bp<CR>

""supertab
let g:SuperTabRetainCompletionType=2
let g:SuperTabDefaultCompletionType="<C-X><C-O>"        ""tab补全，不要在字符后面ctrl+v tab

""vim go
let g:go_version_warning = 0
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1 
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_at_startup = 1

map <C-t> :TlistToggle<CR>

map <C-g> :cs find g <C-R>=expand("<cword>")<CR><CR>
map <C-c> :cs find c <C-R>=expand("<cword>")<CR><CR>
map <C-s> :cs find t <C-R>=expand("<cword>")<CR><CR>
"map <C-e> :cs find e <C-R>=expand("<cword>")<CR><CR>
"map <C-f> :cs find f <C-R>=expand("<cfile>")<CR><CR>
"map <C-i> :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
"map <C-d> :cs find d <C-R>=expand("<cword>")<CR><CR> 

if has("cscope")                                                                                                                                                                                                                            
    set csto=1
    set cst 
    set nocsverb
    if filereadable("cscope.out")
        cs add cscope.out
    endif
    set csverb
endif

""文件描述
map <C-h> :DoxAuthor<cr>
""函数描述
map <C-u> :Dox<cr>
""doxygen相关的配置内容
let g:DoxygenToolkit_licenseTag="Copyright(C)\<alex zhang>"
let g:DoxygenToolkit_blockHeader="------------------------------------------------------------------"
let g:DoxygenToolkit_blockFooter="------------------------------------------------------------------"
let g:DoxygenToolkit_briefTag_pre = "@brief "
let g:DoxygenToolkit_paramTag_pre = "@param "
let g:DoxygenToolkit_returnTag = "@return "
let g:DoxygenToolkit_briefTag_funcName = "yes"
let g:DoxygenToolkit_authorName="alex<zcalex.yy@gmail.com>" 
let g:doxygen_enhanced_color=1

func SetScriptHeader()
    call setline(2,  "\#########################################################################")
    call setline(3,  "\# Copyright (c) 2012-~ Zhang Chao")
    call setline(4,  "\# ")  
    call setline(5,  "\# This source code is released for free distribution under the terms of the")
    call setline(6,  "\# GNU General Public License")
    call setline(7,  "\# ")  
    call setline(8,  "\# Author     : Zhang Chao")
    call setline(9,  "\# File Name  : ".expand("%"))
    call setline(10,  "\# Description: ")
    call setline(11, "\#########################################################################")
endfunc
func SetSourceHeader()
    call setline(1, "\/*")
    call setline(2,   " * Copyright (c) 2012-~ Zhang Chao")
    call setline(3,  " *")
    call setline(4,  " * This source code is released for free distribution under the terms of the")
    call setline(5,  " * GNU General Public License")
    call setline(6,  " * Author      : Zhang Chao")
    call setline(7,  " * Created Time: ".strftime("%c"))
    call setline(8,  " * File Name   : ".expand("%"))
    call setline(9, " * Description:  ")
    call setline(10, " */")
endfunc

func SetTitle()

    if &filetype == 'sh'
        call setline(1, "\#!/bin/bash")
        call SetScriptHeader()
        call setline(12, "")
    endif

    if &filetype == 'c'
        call SetSourceHeader()
        call setline(11, "")
        call setline(12, "\#include <stdio.h>")
        call setline(13, "")
        call setline(14, "int main(int args, char *argv[])")
        call setline(15, "{")
        call setline(16, "    ")
        call setline(17, "    return 0;")
        call setline(18, "}")
    endif

    if &filetype == 'cpp'
        call SetSourceHeader()
        call setline(11, "")
        call setline(12, "\#include <iostream>")
        call setline(13, "")
        call setline(14, "int main()")
        call setline(15, "{")
        call setline(16, "    ")
        call setline(17, "    return 0;")
        call setline(18, "}")
    endif

    if expand("%:e") == 'h'
        call SetSourceHeader()
        call setline(11, "")
        call setline(12, "\#ifndef __xxx_H__")
        call setline(13, "\#define __xxx_H__")
        call setline(14, "")
        call setline(15, "")
        call setline(16, "")
        call setline(17, "\#endif")
    endif

    ""新建文件自动定位到文件为
    autocmd BufNewFile * normal G

endfunc

" add function description 用doxygen替代了
"map <C-u> :call AddFuncHead()<CR>
func AddFuncHead()
    call append('.', " *\/")
    call append('.', " * ")
    call append('.', " * @Return: ")
    call append('.', " * ")
    call append('.', " * @Parameters: ")
    call append('.', " *  ")
    call append('.', " * @Brief:  ")
    call append('.', "\/**")
endfunc


" add file description 用doxgen替代
"map <C-h> :call AddFileHead()<CR>
func AddFileHead()
    call append('.', " *\/")
    call append('.', " * @Date    ")
    call append('.', " * @Version ")
    call append('.', " * @Author  ")
    call append('.', " * @Brief   ")
    call append('.', " * @File    ")
    call append('.', "\/**")
endfunc
" add common description
"map <C-j> :call AddCommonDescr()<CR>
func AddCommonDescr()
    call append('.',"\/*   *\/")
endfunc


