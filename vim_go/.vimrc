
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'file:///home/gmarik/path/to/plugin'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'nsf/gocode', {'rtp': 'vim/'}
Plugin 'SirVer/ultisnips'
Plugin 'fatih/vim-go'
Plugin 'Valloric/YouCompleteMe'
Plugin 'majutsushi/tagbar'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'dgryski/vim-godef'
Plugin 'alvan/vim-closetag'
call vundle#end()            " required

filetype plugin indent on    " required
set backspace=indent,eol,start
set autowrite
set ts=4
set expandtab

set nu
set encoding=utf-8
syntax on
set fencs=utf-8,gbk

"括号补全与缩进set tabstop=4
set softtabstop=4
set shiftwidth=4

"set autoindent
set smartindent
inoremap ' ''<ESC>i
inoremap " ""<ESC>i
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {<CR>}<ESC>O


"for gotags
let g:tagbar_type_go = {
			\ 'ctagstype' : 'go',
			\ 'kinds'     : [
			\ 'p:package',
			\ 'i:imports:1',
			\ 'c:constants',
			\ 'v:variables',
			\ 't:types',
			\ 'n:interfaces',
			\ 'w:fields',
			\ 'e:embedded',
			\ 'm:methods',
			\ 'r:constructor',
			\ 'f:functions'
			\ ],
			\ 'sro' : '.',
			\ 'kind2scope' : {
			\ 't' : 'ctype',
			\ 'n' : 'ntype'
			\ },
			\ 'scope2kind' : {
			\ 'ctype' : 't',
			\ 'ntype' : 'n'
			\ },
			\ 'ctagsbin'  : 'gotags',
			\ 'ctagsargs' : '-sort -silent'
			\ }

" set tagbar width
let g:tagbar_width=30

map <F2> :GoImports<CR>

"build and run project
map <F4>  <ESC> :w <CR> :GoRun<CR>

"build and run current file
map <F5> <ESC> :w <CR> :GoRun ./%< <CR>

map <F8> :TagbarToggle<CR>
map <F12> :!gotags -R $GOPATH/src/github.com > tags <CR>

let g:godef_split=3 """左右打开新窗口的时候
let g:godef_same_file_in_same_window=1 """函数在同一个文件中时不需要打开新窗口
imap <F2> <C-x><C-o>

autocmd FileType go nnoremap <buffer> gd :call GodefUnderCursor()<cr>
autocmd FileType go nnoremap <buffer> <C-]> :call GodefUnderCursor()<cr>
let g:godef_split=3 """左右打开新窗口的时候
let g:godef_same_file_in_same_window=1 """函数在同一个文件中时不需要打开新窗口
"autocmd BufWritePre *.go :Fmt
"

"进行版权声明的设置
"添加或更新头
map <F11> :call TitleDet()<cr>'s
function AddTitle()
    call append(0,"/*=============================================================================")
    call append(1,"#")
    call append(2,"# Author: fanpf - fanpf@jd.com")
    call append(3,"#")
    call append(4,"# Last modified: ".strftime("%Y-%m-%d %H:%M"))
    call append(5,"#")
    call append(6,"# Filename: ".expand("%:t"))
    call append(7,"#")
    call append(8,"# Description: ")
    call append(9,"#")
    call append(10,"=============================================================================*/")
    echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
endf
"更新最近修改时间和文件名
function UpdateTitle()
    normal m'
    execute '/# *Last modified:/s@:.*$@\=strftime(":\t%Y-%m-%d %H:%M")@'
    normal ''
    normal mk
    execute '/# *Filename:/s@:.*$@\=":\t\t".expand("%:t")@'
    execute "noh"
    normal 'k
    echohl WarningMsg | echo "Successful in updating the copy right." | echohl None
endfunction

"判断前10行代码里面，是否有Last modified这个单词，
"如果没有的话，代表没有添加过作者信息，需要新添加；
"如果有的话，那么只需要更新即可
function TitleDet()
    let n=1
    "默认为添加
    while n < 10
        let line = getline(n)
        if line =~ '^\#\s*\S*Last\smodified:\S*.*$'
            call UpdateTitle()
            return
        endif
        let n = n + 1
    endwhile
    call AddTitle()
endfunction


