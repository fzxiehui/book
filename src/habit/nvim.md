# Neo-Vim

## 下载安装

- 下载

```shell
# wget https://github.com/neovim/neovim/releases/download/v0.6.1/nvim-linux64.tar.gz
wget https://github.com/neovim/neovim/releases/download/v0.10.0/nvim-linux64.tar.gz
sudo mv nvim-linux64.tar.gz /usr/local/
cd /usr/local
sudo tar -zxvf nvim-linux64.tar.gz
sudo rm nvim-linux64.tar.gz -rf
```

- 安装

```shell
echo "export PATH="/usr/local/nvim-linux64/bin:\$PATH"" >> ~/.bashrc
# 设置默认编辑器
echo export EDITOR=/usr/local/nvim-linux64/bin/nvim >> ~/.bashrc
source ~/.bashrc
```

## Plug

- 依赖

```shell
# 安装 curl
sudo apt install curl

# 下载Plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
# 打开 nvim 输入
# :PlugInstall
```

- 配置

```vim
"""""""""""""""""""""""""""插件管理器""""""""""""""""""""""""""Begin
call plug#begin('~/.vim/plugged')
" 在end前填写需要的插件, 使用 :PlugInstall 安装

call plug#end()
"""""""""""""""""""""""""""插件管理器""""""""""""""""""""""""""End
```

## 系统剪切板

- 依赖

```shell
sudo apt install xclip
```

- 配置

```vim
"""""""""""""""""""""""""""剪切板设置""""""""""""""""""""""""""Begin
" 使用系统剪切板 需要安装 sudo apt install xclip
set clipboard+=unnamedplus
"""""""""""""""""""""""""""剪切板设置""""""""""""""""""""""""""End
```

## 常规设置

- 键位映射

```vim
" Leader键设置
let mapleader=" "

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
vnoremap H ^
vnoremap L $

" 命令模式下便捷 : 进入末行模式
nnoremap ; :

" 分屏切换
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>h <C-w>h
nnoremap <leader>l <C-w>l

" 分屏时页面大小调节（Ctrl + kjhl）
nnoremap <C-k> <C-w>-
nnoremap <C-j> <C-w>+
nnoremap <C-h> <C-w><
nnoremap <C-l> <C-w>>
```

- 光标设置

```vim
" 显示行号(绝对行号)
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
```

- 折行设置

```vim
" 自动打开折行
" au BufWinLeave * silent mkview
" au BufWinEnter * silent loadview

" 设置折行模式
set fdm=marker
```

- 鼠标设置

```vim
" 禁用鼠标
set mouse=c
```

- 字符集设置(一定要设置utf-8)

```vim
set encoding=utf-8
```

## 插件设置

- 目录插件

    - 安装

    ```vim
    call plug#begin('~/.vim/plugged')
    " 树形的目录管理插件
    Plug 'preservim/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'

    call plug#end()
    ```

    - 配置

    ```vim
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
    " let g:NERDTreeHidden=0     "不显示隐藏文件
    ""Making it prettier
    let NERDTreeMinimalUI = 1
    let NERDTreeDirArrows = 1
    nnoremap td :NERDTreeToggle<CR> " 开启/关闭nerdtree快捷键
    """""""""""""""""""""""""""树形的目录管理插件""""""""""""""""""""""""""""End
    ```
- coc自动补全插件

    - 安装

    ```shell
    # https://github.com/neoclide/coc.nvim
    # 官方说明 node 需要 >= 16.18.0
    sudo n v16.18.0
    ```

    配置文件, 在`plug#begin()` - `plug#end()`之间添加:

    ```vim
    " coc
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    ```

- 主题插件

    - 安装

    ```vim
    call plug#begin('~/.vim/plugged')
    " 配色
    Plug 'crusoexia/vim-monokai'
    call plug#end()
    ```

    - 配置

    ```vim
    """""""""""""""""""""""""""配色""""""""""""""""""""""""""""Begin
    " vim-monokai 配色配置
    colo monokai
    """""""""""""""""""""""""""配色""""""""""""""""""""""""""""End
    ```

## coc 

- 安装`go`, 参考[go安装](../golang/install.md)
- coc设置, 在nvim中输入`:CocConfig`, 填写以下内容

```json
{
  "languageserver": {
    "golang": {
      "command": "gopls",
      "rootPatterns": ["go.mod", ".git/"],
      "filetypes": ["go"]
    }
  }
}
```

- 添加`Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }`

```vim
" https://github.com/fatih/vim-go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
```

- 添加coc键位设置

```vim
" """""""""""""""""""""""""""Coc设置""""""""""""""""""""""""""""Begin
" " gd：跳转到定义
" nmap <silent> gd <Plug>(coc-definition)
" " gy：跳转type定义，如常量对应的type定义
" nmap <silent> gy <Plug>(coc-type-definition)
" " gi：跳转到实现，如接口的实现
" nmap <silent> gi <Plug>(coc-implementation)
" " gr：打开当前变量，函数使用位置选择
" nmap <silent> gr <Plug>(coc-references)
" 
" " 输入rnn给变量重命名
" nmap <silent>rnn <Plug>(coc-rename)
" " set signcolumn=yes
" " tab 可当作 c-n使用
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
""""""""""""""""""""""""""""Coc设置""""""""""""""""""""""""""""End

"""""""""Coc设置(复制github: https://github.com/neoclide/coc.nvim)""""""Begin
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

"""""""""Coc设置(复制github: https://github.com/neoclide/coc.nvim)""""""End
```

- `python` 在`nvim`中输入 `:CocInstall coc-pyright`
- `git` 在`nvim`中输入`:CocInstall coc-git`

## 配置文件

<<< @/src/code/habit/newinit.vim
