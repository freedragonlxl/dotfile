"" 在设置let g:ale_sign_error = '✗'和let g:ale_sign_warning = '⚡'这些时，可能vim不让你保存，提示fenc这个东西。
set fenc= 
syntax on
syntax enable
filetype plugin indent on
" 显示行号
set nu
" 屏蔽行号
" set nonu
"" 允许折叠˽
"set foldenable 
" Enable folding
"set foldmethod=indent
"set foldlevel=99
" 通过空格键快速打开和关闭折叠
"nnoremap <space> za
" 自动缩进
set smartindent
"set autoindent 
"set cindent
" Tab Setting
" set tab  to space
set expandtab
" read file's tab to 4 space
set tabstop=4
" when backspace, 4 space to 1 tab
set softtabstop=0
" set tab to 4 space width
set shiftwidth=4
" set exist tab to space
" retab!
" 搜索高亮
set hlsearch 
" 在输入要搜索的文字时，vim会实时匹配
set incsearch 
" 高亮显示匹配的括号
set showmatch 
" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\  
" 设置空白字符的视觉提示
set list listchars=extends:❯,precedes:❮,tab:▷\ ,trail:◌
" 保存文件前建立备份，保存成功后删除该备份
set writebackup 
 "设置无备份文件
set nobackup 
set noswapfile
" Start interactive EasyAlign in visual mode (e.g. vipga)
nnoremap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nnoremap ga <Plug>(EasyAlign)
" set <leader> is space
let mapleader = "\<space>"
"objc switch hm
nnoremap <leader>hm :e %:p:s,.h$,.X123X,:s,.m$,.h,:s,.X123X$,.m,<CR>
"filetype
"augroup project
"  autocmd!
"  autocmd BufRead,BufNewFile *.h,*.m set filetype=objc
"augroup END

"设置文件类型为objc
nnoremap <leader>oc :set filetype=objc<CR>

"custom translate
nnoremap <Leader>en :!trans -e google -b :en<Space>
nnoremap <Leader>zh :!trans -e google -b :zh-CN<Space>

" n/N search up/down sheild key, make me mitake
nnoremap n <Nop>
nnoremap N <Nop>
" Neovim
" 在插入模式下无法输入以下按键，还有其他没有列出屏蔽，在这里警告别使用以下按键
map F1 <Nop>
map F2 <Nop>
map F3 <Nop>
map F4 <Nop>
map F5 <Nop>
map F6 <Nop>
map F7 <Nop>
map F8 <Nop>
map F9 <Nop>
map F10 <Nop>
map F11 <Nop>
map F12 <Nop>

"滚动，光标下保持显示行数
set scrolloff=20

"python auto format

"##### auto fcitx  ###########
"1 en, 2 zh
"记录输入法
let g:input_toggle = 1
function! Normal()
    let s:input_status = system("fcitx-remote")
    let g:input_toggle = s:input_status
    if s:input_status == 2
       let l:a = system("fcitx-remote -c")
    endif
endfunction

function! Insert()
    let s:input_status = system("fcitx-remote")
    if g:input_toggle == 1
        let l:a = system("fcitx-remote -c")
    else
        let l:a = system("fcitx-remote -o")
    endif
endfunction

"退出插入模式
autocmd InsertLeave * call Normal()
"进入插入模式
autocmd InsertEnter * call Insert()
"##### auto fcitx end ###### 

"鼠标滚动
"set mouse=a

"多次粘贴
xnoremap p pgvy

" 光标竖横线
set cursorcolumn
set cursorline

"<NerdTree 插件配置>
"autocmd vimenter * NERDTree  "自动开启Nerdtree
let g:NERDTreeWinSize = 30 "设定 NERDTree 视窗大小
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
nnoremap <leader>nt :NERDTreeToggle<CR>
nnoremap <leader>cd :NERDTreeFind <CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeIgnore = ['\.pyc$', '\.swp', '\.swo', '\.vscode', '__pycache__']
let g:NERDTreeShowLineNumbers=0  " 是否显示行号
let g:NERDTreeHidden=0     "不显示隐藏文件
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinPos='right'
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

"  < YouCompleteMe 插件配置 >
" -----------------------------------------------------------------------------
let g:ycm_register_as_syntastic_checker = 0 "default 1
"let g:syntastic_objcpp_checkers = ['clang++']
"let g:syntastic_objc_checkers = ['clang']
let g:Show_diagnostics_ui = 0 "default 1
let g:ycm_key_invoke_completion = '<c-z>'
let g:ycm_max_diagnostics_to_display = 0
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_python_binary_path = '/Users/freedragon/.pyenv/shims/python'
let g:ycm_server_python_interpreter = '/Users/freedragon/.pyenv/shims/python'
let g:ycm_key_list_select_completion   = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
nnoremap <leader>gt :YcmCompleter GoTo<CR>
nnoremap <leader>fx :YcmCompleter FixIt<CR>
let g:ycm_filetype_whitelist = {
            \ "c":1,
            \ "cpp":1,
            \ "objc":1,
            \ "objcpp":1,
            \ "python":1,
            \ }
"disable ycm 语法检查
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 0
set completeopt=menu,menuone
let g:ycm_add_preview_to_completeopt = 0
"noremap <c-z> <NOP>
let g:ycm_semantic_triggers =  {
\ 'c,cpp,java,go,erlang,perl,cs,lua,javascript,python': ['re!\w{2}'],
\ 'objc,objcpp' : ['re!\@"\.*"\s',
\ 're!\@\w+\.*\w*\s',
\ 're!\@\(\w+\.*\w*\)\s',
\ 're!\@\(\s*',
\ 're!\@\[.*\]\s',
\ 're!\@\[\s*',
\ 're!\@\{.*\}\s',
\ 're!\@\{\s*',
\ "re!\@\’.*\’\s",
\ '#ifdef ',
\ 're!:\s*',
\ 're!=\s*'],
"\ 're!,\s*', ],
\ }

""<syntastic>
"" ----------------------------------------------------------------------------
"Execute pathogen#infect()
"Set statusline+=%#warningmsg#
"Set statusline+=%{SyntasticStatuslineFlag()}
"Set statusline+=%*
""总是打开Location List（相当于QuickFix）窗口，如果你发现syntastic因为与其他插件冲突而经常崩溃，将下面选项置0
"Let g:syntastic_always_populate_loc_list = 1
""自动打开Locaton List，默认值为2，表示发现错误时不自动打开，当修正以后没有再发现错误时自动关闭，置1表示自动打开自动关闭，0表示关闭自动打开和自动关闭，3表示自动打开，但不自动关闭
"Let g:syntastic_auto_loc_list = 1
""打开文件时自动进行检查
"Let g:syntastic_check_on_open = 0
""进行实时检查，如果觉得卡顿，将下面的选项置为1
"Let g:syntastic_check_on_wq = 1
""checkers
"Let g:syntastic_c_checkers = ['oclint', 'gcc']
"Let g:syntastic_objc_checkers = ['oclint', 'gcc']
"Let g:syntastic_cpp_checkers = ['oclint', 'gcc']
"Let g:syntastic_objcpp_checkers = ['oclint', 'gcc']
"Let g:syntastic_objcpp_exec = '/usr/local/bin/oclint'
""让syntastic支持C++11
"Let g:syntastic_cpp_compiler = 'clang++'
"Let g:syntastic_objc_compiler = 'clang'
"Let g:syntastic_cbjcpp_compiler = 'clang++'
"Let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
""设置error和warning的标志
"Let g:syntastic_enable_signs = 1
"Let g:syntastic_error_symbol='✗'
"Let g:syntastic_warning_symbol='⚡'
""修改Locaton List窗口高度
"Let g:syntastic_loc_list_height = 5
""自动跳转到发现的第一个错误或警告处
"Let g:syntastic_auto_jump = 1
""高亮错误
"Let g:syntastic_enable_highlighting=1
"Nmap <silent> sp   <Plug>LocationPrevious
"Nmap <silent> sn   <Plug>LocationNext
""关闭syntastic语法检查, 鼠标复制代码时用到, 防止把错误标志给复制了
"Nnoremap <silent> <Leader>st :SyntasticToggleMode<CR>

" <LeaderF 不用，转用unite>
" -----------------------------------------------------------------------------------------
let g:Lf_ShowRelativePath = 1
" don't show the help in normal mode
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseMemoryCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
" popup mode
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }
"搜索当前目录下的文件
let g:Lf_ShortcutF = "<leader>ff"
" 搜索当前的Buffer:当前文件缓存堆栈
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
" 搜索最近使用过的文件
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
" 搜索当前文件的字符
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>
"noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
"noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
" search visually selected text literally
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
noremap go :<C-U>Leaderf! rg --recall<CR>
" should use `Leaderf gtags --update` first
let g:Lf_GtagsAutoGenerate = 0
let g:Lf_Gtagslabel = 'pygments'
noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>

"" <ale>
"" --------------------------------------------------------------------------------------
""异步语法检查
" ale-setting {{{
let g:ale_set_highlights = 0
"自定义error和warning图标
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '•'
"在vim自带的状态栏中整合ale
let g:ale_statusline_format = ['✗ %d', '• %d', '✔ OK']
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = '✗ E'
let g:ale_echo_msg_warning_str = '• W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"打开文件时不进行检查
let g:ale_lint_on_enter = 0
"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nnoremap <Leader>pe <Plug>(ale_previous_wrap)
nnoremap <Leader>ne <Plug>(ale_next_wrap)
"<Leader>s触发/关闭语法检查
nnoremap <Leader>t :ALEToggle<CR>
"<Leader>d查看错误或警告的详细信息
nnoremap <Leader>d :ALEDetail<CR>
"使用clang对c和c++进行语法检查，对python使用pylint进行语法检查
"python :flake8 是 pep8（检查代码风格）、pyflakes（检查代码错误）、mccabe（检查代码复杂度
let g:ale_linters = {
\   'c++': ['clang'],
\   'objc': ['clang'],
\   'objcpp': ['clang'],
\   'c': ['clang'],
\   'python': ['flake8'],
\   'swift': ['swiftlint'],
\}
let g:ale_fixers = {
\  'python': [
\    'yapf'
\   ]
\}
" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1
" 保存时候，才进行语法检测
let g:ale_open_list = 0
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 0
"let g:ale_c_clang_options = ''
"let g:ale_cpp_clang_options = ''
"let g:ale_objc_clang_options = '-std=gnu++14'
"let g:ale_objcpp_clang_options = '-std=gnu++14'

"Format <Clang Format>
" -------------------------------------------------------------------------------------
let g:clang_format#detect_style_file = 1
let g:clang_format#auto_format=1
let g:clange_format#command = "clang-format"
" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc,objcpp nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc,objcpp vnoremap <buffer><Leader>cf :ClangFormat<CR>
" if you install vim-operator-user
autocmd FileType c,cpp,objc,objcpp map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
"autocmd FileType c,cpp,objc,objcpp ClangFormatAutoEnable

" Chromatica for clang syntax highlight
"let g:chromatica#libclang_path='/Applications/Xcode.app/Contents/Frameworks/libclang.dylib'
"let g:chromatica#enable_at_startup=0

" spell check
set spell spelllang=en_us,cjk
set nospell

" ultisnips
let g:UltiSnipsExpandTrigger="<c-d>"
let g:UltiSnipsJumpForwardTrigger="<c-d>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" solve leg on relative line number
set regexpengine=1
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/UltiSnips']

"ag
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

" Unite outline
nnoremap <leader>o :Unite outline<cr>

" solarized
syntax enable
set background=dark
colorscheme solarized
if has('gui_running')
    set background=light
else
    set background=dark
endif
let g:solarized_termcolors=256
"set t_Co=256 
"let g:solarized_termtrans = 1
"colorscheme solarized
""let hr = (strftime('%H'))
""if hr >= 19
""   set background=dark
""elseif hr >= 8
""   set background=light
""elseif hr >= 0
""   set background=dark
""endif
"func! Theme()
"    if &background == 'dark'
"        set background=light
"    elseif &background == 'light'
"        set background=dark
"    endif
"endfunc
"set background=dark
"let g:solarized_termcolors=256

" Yank text to the OS X clipboard" 将文本复制到OS X剪贴板中
set clipboard+=unnamedplus

"in vim run
nnoremap <leader>py :call PRUN()<CR>
func! PRUN()
        exec "w"
        if &filetype == 'sh'
                :!time bash %
        elseif &filetype == 'python'
                exec "!clear"
                exec "!time python3 %"
        endif
endfunc

"markdown
let g:vim_markdown_math = 1
let g:vim_markdown_folding_disabled = 1
function RToc()
    exe "/-toc .* -->"
    let lstart=line('.')
    exe "/-toc -->"
    let lnum=line('.')
    execute lstart.",".lnum."g/           /d"
endfunction
"取消储存时自动更新目录
let g:vmt_auto_update_on_save = 1
let g:previm_open_cmd = 'open -a Google\ Chrome'
let g:previm_show_header = 0
"查看所有配置建议
":help vim-markdwon
"[[ "跳转上一个标题
"]] "跳转下一个标题
"]c "跳转到当前标题
"]u "跳转到副标题
"zr "打开下一级折叠
"zR "打开所有折叠
"zm "折叠当前段落
"zM "折叠所有段落
":Toc "显示目录
"在当前光标后生成目录
":GenTocMarked
"更新目录
":UpdateToc
"??????
let c_no_curly_error = 1
"you need cp cmd
let g:fcitx_install = './build.py build all'
"fcitx.vim
set ttimeoutlen=50

"airline
let g:airline#extensions#wordcount#enabled = 0
"为什么不直接映射命令，因为vim脚本不执行|noh
function! WordCount()
    exec "%s/\\S//gn | noh"
endfunction
noremap wc :call WordCount()<CR>

"" jedi-vim
"let g:jedi#goto_command = "<leader>gc"
"let g:jedi#goto_assignments_command = "<leader>ga"
"let g:jedi#goto_stubs_command = "<leader>gs"
"let g:jedi#goto_definitions_command = "<leader>gd"

"leetcode
"nnoremap <leader>ll :LeetCodeList<cr>
"nnoremap <leader>lt :LeetCodeTest<cr>
"nnoremap <leader>ls :LeetCodeSubmit<cr>
"nnoremap <leader>li :LeetCodeSignIn<cr>
"
"let g:leetcode_china = 1
"let g:leetcode_solution_filetype = 'python3'
"let g:leetcode_browser = 'chrome'
"let g:leetcode_debug = 1

call plug#begin('~/.config/nvim/plugged')
    "input /brew install brew reinstall codefalling/fcitx-remote-for-osx/fcitx-remote-for-osx --with-baidu-pinyin 
    "Plug 'CodeFalling/fcitx-vim-osx'
    "安装完之后输入这命令
    "cp ~/.config/nvim/plugged/fcitx-remote-for-osx/fcitx-remote-baidu-pinyin /usr/local/bin/fcitx-remote
    Plug 'CodeFalling/fcitx-remote-for-osx', {'do': g:fcitx_install }
"    Plug 'lilydjwg/fcitx.vim'
    "stutas line
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'junegunn/vim-easy-align'
    Plug 'jiangmiao/auto-pairs'
    Plug 'altercation/vim-colors-solarized'
    Plug 'preservim/nerdtree'
    Plug 'ycm-core/YouCompleteMe', {'do':'./install.py --clang-completer --system-libclang'}
    Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
    Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
    Plug 'rhysd/vim-clang-format'
    "use ale
"   Plug 'vim-syntastic/syntastic'
    " swift
    Plug 'keith/swift.vim'
    " C, C++, Objc
"   Plug 'arakashic/chromatica.nvim'
    " Python
    Plug 'hynek/vim-python-pep8-indent'
    "Code Snippets
    Plug 'SirVer/ultisnips'
    "ACK search
    Plug 'mileszs/ack.vim'
    "Unite
    Plug 'Shougo/unite.vim'
    Plug 'Shougo/unite-outline'
    Plug 'ryotakato/unite-outline-objc'
    "git
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'
    "markdown
    Plug 'godlygeek/tabular'
    Plug 'plasticboy/vim-markdown'
    Plug 'mzlogin/vim-markdown-toc'
"   good makrdown preview
    Plug 'tyru/open-browser.vim'
    Plug 'previm/previm'
"    Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
" 占 CPU太多了
"    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
    "include lib problem? ok
    Plug 'dense-analysis/ale'
"vim 里已经有 Leaderf  和 ack 不过少了个全局搜索的工具~~~
    Plug '/usr/local/opt/fzf'
    Plug 'junegunn/fzf.vim'
"tmux
    Plug 'tpope/vim-obsession', {'do':'vim -u NONE -c \"helptags vim-obsession/doc\" -c q'}
"coding
    Plug 'jiazhoulvke/jianfan'
"python 补全，不用ycm
"    Plug 'davidhalter/jedi-vim'
"leetcode
"    Plug 'ianding1/leetcode.vim'
    Plug 'keith/sourcekittendaemon.vim'
call plug#end()
