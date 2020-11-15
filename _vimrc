" Vim with all enhancements
source $VIMRUNTIME/vimrc_example.vim

" Remap a few keys for Windows behavior
source $VIMRUNTIME/mswin.vim

" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
if &diffopt !~# 'internal'
  set diffexpr=MyDiff()
endif
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction






"******************自定义vim*****************************************

"配置更新立即生效
"autocmd BufWritePost $MYVIMRC source $MYVIMRC

"设置vim字符编码
"set  encoding=utf-8
set  fileencodings=ucs-bom,utf-8,cp936
"set  fileencoding=gb2312
"set  termencoding=utf-8
"
"该映射将在拆分中打开文件
nnoremap <leader>ev :vsplit $MYVIMRC<cr>


"设置行号
set number
"设置行号宽带
set numberwidth=5
"设置代码高亮
set syntax=on
"设置主题颜色
"colorscheme evening
"按F2进入粘贴模式
set pastetoggle=<F2>
"设置高亮搜索
set hlsearch
"设置折叠方式
set foldmethod=indent
"启用256色
set t_Co=256

"开启文件类型检查，并且载入与该类型对应的缩进规则
filetype indent on

"按下回车建后，下一行的缩进会自动跟上一行的缩进保持一致
set autoindent

"按下tab键时，vim显示的空格数
set tabstop=3

"显示光标所在的当前行的行号，其它行都为相对于该行的相对行号
set relativenumber

"显示所在的当前行高亮
set cursorline

"显示所在的当前列高亮
set cursorcolumn

"设置行宽，即一行显示多少个字符
set textwidth=80

"自动折行，即太长的行分成几行显示
set wrap

"指定折行处与编辑窗口的右边缘之间的字符数
set wrapmargin=2

"光标遇到圆括号，方括号，大括号时，自动高亮对应的另一个圆括号，方括号和大括号
set showmatch

"搜索时忽略大小写
set ignorecase



"直接复制粘贴系统剪贴板内容
set clipboard=unnamed


"却换buffer
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> [n :bnext<CR>

"使用 ctrl+h/j/k/l 切换window
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l



"********************** vim 设置映射键 ***********************************
"使用map就可以实现映射
"map系列命令有递归的风险
"vim提供了非递归映射，这些命令不会递归解释
"使用map对应的nnoremap/vnoremap/inoremap
"如何时候应该使用非递归映射



"全局领导键
let mapleader=','

"本地领导键
:let maplocalleader = "\\"


"在可视模式下快速却换大小写
:vmap \ U

"在normal模式下垂直分屏
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
"在normal模式下水平分屏
":nnoremap <leader>ev :split $MYVIMRC<cr>

"按 sv 时时更新 _vimrc 文件
"nnoremap <leader>sv :source $MYVIMRC<cr>





"******************* 安装 vim-plug 插件管理器 *****************************

"call plug#begin('~/.vim/plugged')
call plug#begin()

"vim 开启页面
Plug 'mhinz/vim-startify'
"vim 侧边栏
Plug 'scrooloose/nerdtree'
"Plug 'preservim/nerdtree'

"vim 状态烂
Plug 'vim-airline/vim-airline'
"vim 代码缩进
Plug 'yggdroot/indentline'

"vim 配色
Plug 'w0ng/vim-hybrid'
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'

"快速搜索文件
Plug 'ctrlpvim/ctrlp.vim'

"快速搜索文件
Plug 'easymotion/vim-easymotion'

"成对编辑插件
Plug 'anyakichi/vim-surround'

"模糊搜索文件插件或者目录
Plug 'junegunn/fzf.vim'

"搜索替换插件
Plug 'brooth/far.vim'

"开启代码大纲
Plug 'majutsushi/tagbar'

"高亮感兴趣单词
Plug 'lfv89/vim-interestingwords'

"代码补全插件
Plug 'shougo/deoplete.nvim'
Plug 'yatli/coc-powershell'

"代码格式化以静态检查
Plug 'chiel92/vim-autoformat'
"Plug 'w0rp/ale'
"Plug 'dense-analysis/ale'
Plug 'mtscout6/syntastic-local-eslint.vim'
 
"代码注释插件
Plug 'tpope/vim-commentary'

"tmux插件
Plug 'benmills/vimux'

"html5 插件
Plug 'othree/html5.vim'

"给单词添加下划线
Plug 'itchyny/vim-cursorword'
Plug 'lfv89/vim-interestingwords'






call plug#end()


"NERDTree快捷键
nnoremap <leader>v :NERDTreeFind<cr>
nnoremap <leader>g :NERDTreeToggle<CR>

"ctrlp启动设置
let g:ctrlp_map = '<c-p>'

"设置easymotion
nmap ss <Plug>(easymotion-s2)


"tagbar插件触发器
nnoremap <leader>t :TagbarToggle<CR>

"startify插件开启
":h startify
":h startify-faq

"启动时默认样式
colorscheme evening

"colorscheme_bg = "solarized"




