let g:python_host_prog="/home/hello/anaconda3/bin/python"
call plug#begin('~/.vim/plugged')

" Leader键设置
let mapleader=" "

" 空格线条
Plug 'Yggdroot/indentLine'

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" 配色
Plug 'crusoexia/vim-monokai'

" 状态栏 标签栏
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes' "airline 的主题

" 注释插件
Plug 'scrooloose/nerdcommenter'

" githubcopilot
" Plug 'github/copilot.vim'

" 嵌套括号高亮插件
Plug 'luochen1990/rainbow'

" 树形的目录管理插件
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" 函数树
Plug 'majutsushi/tagbar'

" vim-go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" 补全
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" markdown 预览
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

call plug#end()

" indentLine 配置
let g:indent_guides_guide_size        = 1  " 指定对齐线的尺寸
let g:indent_guides_start_level = 2  " 从第二层开始可视化显示缩进

" vim-monokai 配色配置
colo monokai

"""""""""""""""""""""""""""设置状态栏""""""""""""""""""""""""""""Begin
" 设置状态栏
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_theme = 'desertink'  " 主题
let g:airline#extensions#keymap#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_idx_format = {
       \ '0': '0 ',
       \ '1': '1 ',
       \ '2': '2 ',
       \ '3': '3 ',
       \ '4': '4 ',
       \ '5': '5 ',
       \ '6': '6 ',
       \ '7': '7 ',
       \ '8': '8 ',
       \ '9': '9 '
       \}
" 设置切换tab的快捷键 <\> + <i> 切换到第i个 tab
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
" 设置切换tab的快捷键 <\> + <-> 切换到前一个 tab
nmap <leader>- <Plug>AirlineSelectPrevTab
" 设置切换tab的快捷键 <\> + <+> 切换到后一个 tab
nmap <leader>+ <Plug>AirlineSelectNextTab
" 设置切换tab的快捷键 <\> + <q> 退出当前的 tab
nmap <leader>q :bp<cr>:bd #<cr>
" 修改了一些个人不喜欢的字符
" if !exists('g:airline_symbols')
"     let g:airline_symbols = {}
" endif


" let g:airline_symbols.linenr = "CL" " current line
" let g:airline_symbols.whitespace = '|'
" let g:airline_symbols.maxlinenr = 'Ml' "maxline
" let g:airline_symbols.branch = 'BR'
" let g:airline_symbols.readonly = "RO"
" let g:airline_symbols.dirty = "DT"
" let g:airline_symbols.crypt = "CR"
"""""""""""""""""""""""""""设置状态栏""""""""""""""""""""""""""""End

"""""""""""""""""""""""""""注释插件""""""""""""""""""""""""""""Begin
"add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" python 自动的会多加一个空格
au FileType python let g:NERDSpaceDelims = 0

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1
"""""""""""""""""""""""""""注释插件""""""""""""""""""""""""""""End

"""""""""""""""""""""""""""嵌套括号高亮插件""""""""""""""""""""""""""""Begin
let g:rainbow_active = 1
let g:rainbow_conf = {
\   'guifgs': ['darkorange3', 'seagreen3', 'royalblue3', 'firebrick'],
\   'ctermfgs': ['lightyellow', 'lightcyan','lightblue', 'lightmagenta'],
\   'operators': '_,_',
\   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\   'separately': {
\       '*': {},
\       'tex': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\       },
\       'lisp': {
\           'guifgs': ['darkorange3', 'seagreen3', 'royalblue3', 'firebrick'],
\       },
\       'vim': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\       },
\       'html': {
\           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\       },
\       'css': 0,
\   }
\}
"""""""""""""""""""""""""""嵌套括号高亮插件""""""""""""""""""""""""""""End

"""""""""""""""""""""""""""树形的目录管理插件""""""""""""""""""""""""""""Begin
" autocmd vimenter * NERDTree  "自动开启Nerdtree
let g:NERDTreeWinSize = 25 "设定 NERDTree 视窗大小
let NERDTreeShowBookmarks = 1  " 开启Nerdtree时自动显示Bookmarks
"打开vim时如果没有文件自动打开NERDTree
" autocmd vimenter * if !argc()|NERDTree|endif
"当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" 设置树的显示图标
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let NERDTreeIgnore = ['\.pyc$']  " 过滤所有.pyc文件不显示
let g:NERDTreeShowLineNumbers = 0 " 是否显示行号
let g:NERDTreeHidden=0     "不显示隐藏文件
""Making it prettier
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
nnoremap td :NERDTreeToggle<CR> " 开启/关闭nerdtree快捷键
"""""""""""""""""""""""""""树形的目录管理插件""""""""""""""""""""""""""""End

" 显示定义
nnoremap gd :call CocActionAsync('doHover')<CR>

" 查文件
nnoremap ff :Files<CR>

" 模糊查找
nnoremap fa :Ag<CR>

"""""""""""""""""""""""""""函数树形插件""""""""""""""""""""""""""""Begin
let g:tagbar_width = 30
" nnoremap <silent> <F4> :TagbarToggle<CR> " 将tagbar的开关按键设置为 tf
nnoremap tf :TagbarToggle<CR> " 将tagbar的开关按键设置为 tf
"""""""""""""""""""""""""""函数树形插件""""""""""""""""""""""""""""End


"""""""""""""""""""""""""""键位映射""""""""""""""""""""""""""""Begin
" 快速进入命令模式 jj
imap jj <Esc>

" 禁用上下左右键
imap <Up> <Nop>
nnoremap <Up> <Nop>

imap <Down> <Nop>
nnoremap <Down> <Nop>

imap <Left> <Nop>
nnoremap <Left> <Nop>

imap <Right> <Nop>
nnoremap <Right> <Nop>

" 快速定位行首行末
nnoremap H ^
nnoremap L $

" 命令模式下便捷 : 进入末行模式
nnoremap ; :

" 分页切换
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>h <C-w>h
nnoremap <leader>l <C-w>l

" 页面大小设置
nnoremap <C-k> <C-w>-
nnoremap <C-j> <C-w>+

nnoremap <C-h> <C-w><
nnoremap <C-l> <C-w>>
"""""""""""""""""""""""""""键位映射""""""""""""""""""""""""""""End


"""""""""""""""""""""""""""拆行配置""""""""""""""""""""""""""""Begin
" 自动打开折行
" au BufWinLeave * silent mkview
" au BufWinEnter * silent loadview
" 设置cmd下正常使用使用双字
" set ambiwidth=double

" 设置折行模式
set fdm=marker
"""""""""""""""""""""""""""拆行配置""""""""""""""""""""""""""""End


"""""""""""""""""""""""""""Coc""""""""""""""""""""""""""""Begin
" Coc====================================================================begin
" if hidden is not set, TextEdit might fail.
set hidden
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" You will have bad experience for diagnostic messages when it's default 4000.
" set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" Remap keys for gotos
" nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
"""""""""""""""""""""""""""Coc""""""""""""""""""""""""""""End

""""""""""""""""""""""""""光标tab""""""""""""""""""""""""""""begin
" begin 个性设置
" 显示行号
" 绝对行号
set number
" 相对行号
set relativenumber

" 设置高亮行和列
set cursorcolumn
set cursorline

" 自动缩进
set autoindent

" 设置tab宽度
set tabstop=2
set softtabstop=2
set noexpandtab
set shiftwidth=2
"""""""""""""""""""""""""""光标tab""""""""""""""""""""""""""""End

" indentLine
autocmd FileType json,markdown let g:indentLine_conceallevel = 0
" vim-json
autocmd FileType json,markdown let g:vim_json_syntax_conceal = 0

" set fileencoding=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
" set termencoding=utf-8
set encoding=utf-8

" 使用系统剪切板
set clipboard+=unnamedplus
