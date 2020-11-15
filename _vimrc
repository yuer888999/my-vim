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






"******************�Զ���vim*****************************************

"���ø���������Ч
"autocmd BufWritePost $MYVIMRC source $MYVIMRC

"����vim�ַ�����
"set  encoding=utf-8
set  fileencodings=ucs-bom,utf-8,cp936
"set  fileencoding=gb2312
"set  termencoding=utf-8
"
"��ӳ�佫�ڲ���д��ļ�
nnoremap <leader>ev :vsplit $MYVIMRC<cr>


"�����к�
set number
"�����кſ��
set numberwidth=5
"���ô������
set syntax=on
"����������ɫ
"colorscheme evening
"��F2����ճ��ģʽ
set pastetoggle=<F2>
"���ø�������
set hlsearch
"�����۵���ʽ
set foldmethod=indent
"����256ɫ
set t_Co=256

"�����ļ����ͼ�飬��������������Ͷ�Ӧ����������
filetype indent on

"���»س�������һ�е��������Զ�����һ�е���������һ��
set autoindent

"����tab��ʱ��vim��ʾ�Ŀո���
set tabstop=3

"��ʾ������ڵĵ�ǰ�е��кţ������ж�Ϊ����ڸ��е�����к�
set relativenumber

"��ʾ���ڵĵ�ǰ�и���
set cursorline

"��ʾ���ڵĵ�ǰ�и���
set cursorcolumn

"�����п���һ����ʾ���ٸ��ַ�
set textwidth=80

"�Զ����У���̫�����зֳɼ�����ʾ
set wrap

"ָ�����д���༭���ڵ��ұ�Ե֮����ַ���
set wrapmargin=2

"�������Բ���ţ������ţ�������ʱ���Զ�������Ӧ����һ��Բ���ţ������źʹ�����
set showmatch

"����ʱ���Դ�Сд
set ignorecase



"ֱ�Ӹ���ճ��ϵͳ����������
set clipboard=unnamed


"ȴ��buffer
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> [n :bnext<CR>

"ʹ�� ctrl+h/j/k/l �л�window
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l



"********************** vim ����ӳ��� ***********************************
"ʹ��map�Ϳ���ʵ��ӳ��
"mapϵ�������еݹ�ķ���
"vim�ṩ�˷ǵݹ�ӳ�䣬��Щ�����ݹ����
"ʹ��map��Ӧ��nnoremap/vnoremap/inoremap
"���ʱ��Ӧ��ʹ�÷ǵݹ�ӳ��



"ȫ���쵼��
let mapleader=','

"�����쵼��
:let maplocalleader = "\\"


"�ڿ���ģʽ�¿���ȴ����Сд
:vmap \ U

"��normalģʽ�´�ֱ����
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
"��normalģʽ��ˮƽ����
":nnoremap <leader>ev :split $MYVIMRC<cr>

"�� sv ʱʱ���� _vimrc �ļ�
"nnoremap <leader>sv :source $MYVIMRC<cr>





"******************* ��װ vim-plug ��������� *****************************

"call plug#begin('~/.vim/plugged')
call plug#begin()

"vim ����ҳ��
Plug 'mhinz/vim-startify'
"vim �����
Plug 'scrooloose/nerdtree'
"Plug 'preservim/nerdtree'

"vim ״̬��
Plug 'vim-airline/vim-airline'
"vim ��������
Plug 'yggdroot/indentline'

"vim ��ɫ
Plug 'w0ng/vim-hybrid'
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'

"���������ļ�
Plug 'ctrlpvim/ctrlp.vim'

"���������ļ�
Plug 'easymotion/vim-easymotion'

"�ɶԱ༭���
Plug 'anyakichi/vim-surround'

"ģ�������ļ��������Ŀ¼
Plug 'junegunn/fzf.vim'

"�����滻���
Plug 'brooth/far.vim'

"����������
Plug 'majutsushi/tagbar'

"��������Ȥ����
Plug 'lfv89/vim-interestingwords'

"���벹ȫ���
Plug 'shougo/deoplete.nvim'
Plug 'yatli/coc-powershell'

"�����ʽ���Ծ�̬���
Plug 'chiel92/vim-autoformat'
"Plug 'w0rp/ale'
"Plug 'dense-analysis/ale'
Plug 'mtscout6/syntastic-local-eslint.vim'
 
"����ע�Ͳ��
Plug 'tpope/vim-commentary'

"tmux���
Plug 'benmills/vimux'

"html5 ���
Plug 'othree/html5.vim'

"����������»���
Plug 'itchyny/vim-cursorword'
Plug 'lfv89/vim-interestingwords'






call plug#end()


"NERDTree��ݼ�
nnoremap <leader>v :NERDTreeFind<cr>
nnoremap <leader>g :NERDTreeToggle<CR>

"ctrlp��������
let g:ctrlp_map = '<c-p>'

"����easymotion
nmap ss <Plug>(easymotion-s2)


"tagbar���������
nnoremap <leader>t :TagbarToggle<CR>

"startify�������
":h startify
":h startify-faq

"����ʱĬ����ʽ
colorscheme evening

"colorscheme_bg = "solarized"




