call plug#begin('/Users/kubrick/.config/nvim/autoload')


" ********************************************************
" 基本配置
" ********************************************************
" 设置前缀键为space, E: <space>w 保存当前文件 , <space>q 退出vim
let mapleader=" "
" 这个有点东西
noremap ; :

" 加载配置文件
nmap <leader>so :so ~/.config/nvim/init.vim<CR>

" 设置行号
set number
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936

"禁止生成临时文件
set nobackup
set noswapfile
" 换行
set tabstop=4
" 禁止提示音  
set noeb
" 突出显示当前行
set cursorline 
" 修改补全的提示框颜色，默认是粉红色
highlight Pmenu ctermfg=15 ctermbg=0 guifg=darkgrey guibg=black
highlight CursorLine   cterm=NONE ctermbg=black ctermfg=red guibg=NONE guifg=NONE
highlight CursorColumn cterm=NONE ctermbg=black ctermfg=yellow guibg=NONE guifg=NONE
" 光标样式竖线
" set gcr=n-v-c:ver25-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor/lCursor
" 设置相对行号
set relativenumber


" ********************************************************
" theme
" ********************************************************
Plug 'morhetz/gruvbox'
" Plug 'jacoborus/tender.vim'

" ********************************************************
" 启动界面
" https://github.com/mhinz/vim-startify
" ********************************************************
Plug 'mhinz/vim-startify'

" ********************************************************
" 可以快速对齐的插件
" https://github.com/junegunn/vim-easy-align
" ********************************************************
Plug 'junegunn/vim-easy-align'


" ********************************************************
" 粘贴板记录
" https://github.com/vim-scripts/YankRing.vim coc有替代品
" ********************************************************
" Plug 'vim-scripts/YankRing.vim'


" ********************************************************
" Plug 'itchyny/lightline.vim' "底部状态栏
" ********************************************************
Plug 'vim-airline/vim-airline'
set statusline+=%1*\ %<%F\     "文件路径
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1


" ********************************************************
" 模糊搜索插件
" https://github.com/Yggdroot/LeaderF 
" tab 切换，F1y有快捷键介绍
" ********************************************************
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
" don't show the help in normal mode
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
" popup mode
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

let g:Lf_ShortcutF = "<leader>ff"
noremap fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

" noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
" noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
" search visually selected text literally
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
noremap go :<C-U>Leaderf! rg --recall<CR>

" should use `Leaderf gtags --update` first
let g:Lf_GtagsAutoGenerate = 0
let g:Lf_Gtagslabel = 'native-pygments'
noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>



" ********************************************************
" 搜索
" https://github.com/junegunn/fzf
" ********************************************************
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"Plug 'junegunn/fzf.vim'
"nmap <leader>qf :Files<CR>
"nmap <leader>b :Buffers<CR>
"first vim script 2019-12-15
"nmap <leader>l :Lines<CR> 
"let g:fzf_action = { 'ctrl-e': 'edit' }


" ********************************************************
" Rust language
" ********************************************************
Plug 'rust-lang/rust.vim'
let g:rustfmt_autosave = 1


" ********************************************************
" 语法检查，支持lsp
" https://github.com/dense-analysis/ale
" ********************************************************
Plug 'dense-analysis/ale'
let g:ale_list_window_size = 5
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
let g:ale_completion_enabled = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_swift_swiftlint_use_defaults = 1
let g:ale_open_list = 0
let g:ale_lint_delay = 1000
let g:ale_linters = {
      \ 'go': ['golint', 'go vet', 'go build'],
      \ }
nmap ]a <Plug>(ale_next_wrap)
nmap [a <Plug>(ale_previous_wrap)


" ********************************************************
" 自动补全括号
" https://github.com/jiangmiao/auto-pairs
" ********************************************************
Plug 'jiangmiao/auto-pairs'
let g:AutoPairs = {',':' ','(':')', '[':']', '{':'}',"'":"'",'"':'"', "`":"`", '```':'```', '"""':'"""', "'''":"'''"} 
let g:AutoPairs = {'if':' ','(':')', '[':']', '{':'}',"'":"'",'"':'"', "`":"`", '```':'```', '"""':'"""', "'''":"'''"}  


" ********************************************************
" 远程
" https://github.com/roxma/nvim-yarp
" ********************************************************
Plug 'roxma/nvim-yarp'


" ********************************************************
" Golang language
" https://github.com/fatih/vim-go
" ********************************************************
Plug 'fatih/vim-go'
" 默认运行golang main
nmap <C-R> :GoRun<CR>
" 默认运行golang test
nmap <C-T> :GoTest<CR>


" ********************************************************
" Golang 方法跳转插件
" https://github.com/dgryski/vim-godef
" ********************************************************
Plug 'dgryski/vim-godef'
" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mode = 'gopls'
let g:go_def_mapping_enabled = 0
" open new window
" let g:godef_split=0 
let g:godef_same_file_in_same_window=1

" --- vim go (polyglot) settings.
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_auto_sameids = 1


" file manager 
"Plug 'vifm/vifm.vim'
Plug 'kevinhwang91/rnvimr'
let g:rnvimr_ex_enable = 1
let g:rnvimr_pick_enable = 1
let g:rnvimr_draw_border = 0
" let g:rnvimr_bw_enable = 1
highlight link RnvimrNormal CursorLine
nnoremap <silent> R :RnvimrToggle<CR><C-\><C-n>:RnvimrResize 0<CR>
let g:rnvimr_action = {
            \ '<C-t>': 'NvimEdit tabedit',
            \ '<C-x>': 'NvimEdit split',
            \ '<C-v>': 'NvimEdit vsplit',
            \ 'gw': 'JumpNvimCwd',
            \ 'yw': 'EmitRangerCwd'
            \ }
let g:rnvimr_layout = { 'relative': 'editor',
            \ 'width': &columns,
            \ 'height': &lines,
            \ 'col': 0,
            \ 'row': 0,
            \ 'style': 'minimal' }
let g:rnvimr_presets = [{'width': 1.0, 'height': 1.0}]


" ********************************************************
" 文件夹树
" https://github.com/preservim/nerdtree
" ********************************************************
Plug 'scrooloose/nerdtree'


" ********************************************************
" 文件夹树+git相关标识
" ********************************************************
Plug 'Xuyuanp/nerdtree-git-plugin'
" 文件树设置 {{{
" 关闭NERDTree快捷键
map <F2> :NERDTreeMirror<CR>
map <F2> :NERDTreeToggle<CR>
""当NERDTree为剩下的唯一窗口时自动关闭
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
""修改树的显示图标
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeAutoCenter=1
" 显示行号
" let NERDTreeShowLineNumbers=1
" 是否显示隐藏文件
let NERDTreeShowHidden=1
" 设置宽度
let NERDTreeWinSize=33
" 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
" 忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
let g:NERDTreeGitStatusIndicatorMapCustom= {
	\ "Modified"  : "✹",
	\ "Staged"    : "✚",
	\ "Untracked" : "✭",
	\ "Renamed"   : "➜",
	\ "Unmerged"  : "═",
	\ "Deleted"   : "✖",
	\ "Dirty"     : "✗",
	\ "Clean"     : "✔︎",
	\ 'Ignored'   : '☒',
	\ "Unknown"   : "?"
  \ }
let g:gitgutter_max_signs = 500  " default value " gitgutter


" ********************************************************
" 文件类型展示
" https://github.com/ryanoasis/vim-devicons
" ********************************************************
Plug 'ryanoasis/vim-devicons'


" ********************************************************
" 缩进线
" ********************************************************
Plug 'Yggdroot/indentLine'
let g:indentLine_char='┆'
let g:indentLine_enabled = 1



"coc config start
" -------------------------------------------------------------------------------------------------
" coc.nvim default settings
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
" ------------------------------------------------------------------------------------------------

" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
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

" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


" ********************************************************
" coc explorer
" https://github.com/neoclide/coc.nvim
" ********************************************************
" Use release branch (Recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
nmap ge :CocCommand explorer<CR> 
"coc config end 


" ********************************************************
"  find and release 
" ********************************************************
Plug 'brooth/far.vim'

call plug#end()

" Theme
syntax enable
" colorscheme tender
colorscheme gruvbox
set background=dark cursorline termguicolors

" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1


" ********************************************************
" terminal
" ********************************************************
nnoremap ts :te<CR>
let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert
tnoremap <C-N> <C-\><C-N>
tnoremap <C-O> <C-\><C-N><C-O>
let g:terminal_color_0  = '#000000'
let g:terminal_color_1  = '#FF5555'
let g:terminal_color_2  = '#50FA7B'
let g:terminal_color_3  = '#F1FA8C'
let g:terminal_color_4  = '#BD93F9'
let g:terminal_color_5  = '#FF79C6'
let g:terminal_color_6  = '#8BE9FD'
let g:terminal_color_7  = '#BFBFBF'
let g:terminal_color_8  = '#4D4D4D'
let g:terminal_color_9  = '#FF6E67'
let g:terminal_color_10 = '#5AF78E'
let g:terminal_color_11 = '#F4F99D'
let g:terminal_color_12 = '#CAA9FA'
let g:terminal_color_13 = '#FF92D0'
let g:terminal_color_14 = '#9AEDFE'


" ********************************************************
" map list 插入模式的映射键列表 
" ********************************************************
" 全选、剪切、复制
map <C-A> <Esc>ggVG
map <C-X> dd
map <C-C> yy


" ********************************************************
" nmap/nnoremap list 常规模式的映射键列表 
" ********************************************************

" 保存、退出
nnoremap S :w<CR>
nnoremap Q :q<CR>
noremap <C-q> :qa<CR>
" resize window
nnoremap <Up> :resize +2<CR> 
nnoremap <Down> :resize -2<CR>
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>
" window move
nnoremap <leader>h <C-W>h
nnoremap <leader>j <C-W>j
nnoremap <leader>k <C-W>k
nnoremap <leader>l <C-W>l
" buffer move
nnoremap <silent> bu :enew<CR>
nnoremap <silent> bn :bnext<CR>
nnoremap <silent> bb :bprevious<CR>
nnoremap <silent> bd :bdelete<CR>
" five word
noremap <silent> W 5W
noremap <silent> B 5b
" five line 
noremap <silent> U 5k
noremap <silent> E 5j


" ********************************************************
" imap list 插入模式的映射键列表 
" ********************************************************
" 退出插入模式 
inoremap <C-[> <Esc>

" emacs line editor
imap <C-e> <END>
imap <C-a> <HOME>
imap <C-f> <Right>
imap <C-b> <Left>
imap <C-p> <UP>
imap <C-n> <DOWN>


" ********************************************************
" inoremap list 插入模式的非递归映射键列表 
" ********************************************************
" 自动补全括号
" inoremap { {<CR>}<ESC>kA<CR>
 

" ********************************************************
" cmap list 命令模式的映射键列表 
" ********************************************************
" 移动到行首
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" ********************************************************
" vmap list 可视模式的映射键列表 
" ********************************************************
