" Modeline and Notes
"   This is my personal .vimrc, I don't recommend you copy it, just
"   use the "   pieces you want(and understand!).  When you copy a
"   .vimrc in its entirety, weird and unexpected things can happen.
"
"   If you find an obvious mistake hit me up at:
"   http://robertmelton.com (many forms of communication)

" Startup
    source $VIMRUNTIME/vimrc_example.vim
    source $VIMRUNTIME/mswin.vim
    behave mswin
    let s:colorful_term = (&term =~ "xterm") || (&term =~ "screen")
    let g:erlangHighlightBif = 1
    let g:erlangHighLightOperators = 1

" Functions those should before basic
    func! GetRunningOS()
        if has("win32")
            return "windows"
        elseif has("unix")
            if system('uname')=~'Darwin'
                return "mac"
            else
                return "linux"
            endif
        endif
    endfu
    let g:os=GetRunningOS()

" Basics
    set nocompatible " explicitly get out of vi-compatible mode
    set noexrc " don't use local version of .(g)vimrc, .exrc
    set background=dark " we plan to use a dark background
    set fencs=ucs-bom,utf-8,chinese,taiwan,japan,korean,latin1
    set fenc=utf-8
    if g:os=="windows" || g:os=="mac"
        set fenc=utf-8
        set tenc=utf-8
        set enc=utf-8
    elseif g:os=="linux"
        set fenc=utf-8
        set tenc=utf-8
        let s:enc=""
        if exists("$LANG") && $LANG != "C"
            let s:enc = substitute($LANG, '\w\{2\}_\w\{2\}\.', "", "")
        endif
        if s:enc != ""
            let &enc=s:enc
        else
            set enc=utf-8
        endif
    endif
    language messages en_US.UTF-8 " fix Unrecognizable Code in console output
    set langmenu=en_US.UTF-8 " set language of menu
    source $VIMRUNTIME/delmenu.vim " prevent menu from becoming Unrecognizable Code
    source $VIMRUNTIME/menu.vim " prevent menu from becoming Unrecognizable Code
    set cpoptions=aABceFsmq
    "             |||||||||
    "             ||||||||+-- When joining lines, leave the cursor between joined lines
    "             |||||||+-- When a new match is created (showmatch) pause for .5
    "             ||||||+-- Set buffer options when entering the buffer
    "             |||||+-- :write command updates current file name automatically add <CR> to the last line when using :@r
    "             |||+-- Searching continues at the end of the match at the cursor position
    "             ||+-- A backslash has no special meaning in mappings
    "             |+-- :write updates alternative file name
    "             +-- :read updates alternative file name
    syntax on " syntax highlighting on
    let g:skip_loading_mswin=1 " Just in case :)

" Newish
    set history=9999 " big old history
    set timeoutlen=300 " super low delay (works for me)
    set formatoptions+=n " Recognize numbered lists
    set formatlistpat=^\\s*\\(\\d\\\|[-*]\\)\\+[\\]:.)}\\t\ ]\\s* "and bullets, too
    set viminfo+=! " Store upper-case registers in viminfo
    set nomore " Short nomore

" General
    filetype plugin indent on " load filetype plugins/indent settings
    set autochdir " always switch to the current file directory
    set backspace=indent,eol,start " make backspace a more flexible
    set backup " make backup files
    set undofile " make undo files
    set clipboard+=unnamed " share windows clipboard
    set colorcolumn=81
    if g:os == "windows"
        let folderPath=$HOME . '/vimfiles/backup'
        echo(system('if not exist "' . folderPath . '" md "' . folderPath . '"'))
        let &backupdir=folderPath " where to put backup files
        let folderPath=$HOME . '/vimfiles/temp'
        echo(system('if not exist "' . folderPath . '" md "' . folderPath . '"'))
        let &directory=folderPath " directory to place swap files in
        let folderPath=$HOME . '/vimfiles/undo'
        echo(system('if not exist "' . folderPath . '" md "' . folderPath . '"'))
        let &undodir=folderPath " directory to place swap files in
        let folderPath=$HOME . '/vimfiles/view'
        let &viewdir=folderPath " directory to mkview
    else
        let folderPath=$HOME . '/.vim/backup'
        echo(system('if [ ! -d "' . folderPath . '" ]; then mkdir "' . folderPath . '"; fi'))
        let &backupdir=folderPath " where to put backup files
        let folderPath=$HOME . '/.vim/temp'
        echo(system('if [ ! -d "' . folderPath . '" ]; then mkdir "' . folderPath . '"; fi'))
        let &directory=folderPath " directory to place swap files in
        let folderPath=$HOME . '/.vim/undo'
        echo(system('if [ ! -d "' . folderPath . '" ]; then mkdir "' . folderPath . '"; fi'))
        let &undodir=folderPath " directory to place swap files in
        let folderPath=$HOME . '/.vim/view'
        let &viewdir=folderPath " directory to mkview
    endif
    set fileformats=unix,dos,mac " support all three, in this order
    set hidden " you can change buffers without saving
    " (XXX: #VIM/tpope warns the line below could break things)
    set iskeyword+=_,$,@,%,# " none of these are word dividers
    set mouse=a " use mouse everywhere
    set noerrorbells " don't make noise
    set whichwrap=b,s,h,l,<,>,~,[,] " everything wraps
    "             | | | | | | | | |
    "             | | | | | | | | +-- "]" Insert and Replace
    "             | | | | | | | +-- "[" Insert and Replace
    "             | | | | | | +-- "~" Normal
    "             | | | | | +-- <Right> Normal and Visual
    "             | | | | +-- <Left> Normal and Visual
    "             | | | +-- "l" Normal and Visual (not recommended)
    "             | | +-- "h" Normal and Visual (not recommended)
    "             | +-- <Space> Normal and Visual
    "             +-- <BS> Normal and Visual
    set wildmenu " turn on command line completion wild style
    set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.jpg,*.gif,*.png " ignore these list file extensions
    set wildmode=list:longest " turn on wild mode huge list
    let html_number_lines = 0
    let html_use_css = 0
    let use_xhtml = 0
    let g:FuzzyFinderOptions = { 'Base':{}, 'Buffer':{}, 'File':{}, 'Dir':{}, 'MruFile':{}, 'MruCmd':{}, 'Bookmark':{}, 'Tag':{}, 'TaggedFile':{}}

" Vim UI
    set incsearch " BUT do highlight as you type you search phrase
    set laststatus=2 " always show the status line
    set lazyredraw " do not redraw while running macros
    set linespace=0 " don't insert any extra pixel lines betweens rows
    set list " we do what to show tabs, to ensure we get them out of my files
    set listchars=tab:>-,trail:- " show tabs and trailing
    set matchtime=5 " how many tenths of a second to blink matching brackets for
    set hlsearch " do not highlight searched for phrases
    set nostartofline " leave my cursor where it was
    set novisualbell " don't blink
    set number " turn on line numbers
    set numberwidth=5 " We are good up to 99999 lines
    set report=0 " tell us when anything is changed via :...
    set ruler " Always show current positions along the bottom
    set scrolloff=10 " Keep 10 lines (top/bottom) for scope
    set shortmess=aOstT " shortens messages to avoid 'press a key' prompt
    set showcmd " show the command being typed
    set showmatch " show matching brackets
    set sidescrolloff=10 " Keep 5 lines at the size
    set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
    "              | | | | |  |   |      |  |     |    |
    "              | | | | |  |   |      |  |     |    + current column
    "              | | | | |  |   |      |  |     +-- current line
    "              | | | | |  |   |      |  +-- current % into file
    "              | | | | |  |   |      +-- current syntax in square brackets
    "              | | | | |  |   +-- current fileformat
    "              | | | | |  +-- number of lines
    "              | | | | +-- preview flag in square brackets
    "              | | | +-- help flag in square brackets
    "              | | +-- readonly flag in square brackets
    "              | +-- rodified flag in square brackets
    "              +-- full path to file in the buffer

" Text Formatting/Layout
    set completeopt=menuone " don't use a pop up menu for completions
    set expandtab " no real tabs please!
    set formatoptions=rq " Automatically insert comment leader on return, and let gq format comments
    set ignorecase " case insensitive by default
    set infercase " case inferred by default
    set wrap " wrap line
    set shiftround " when at 3 spaces, and I hit > ... go to 4, not 5
    set smartcase " if there are caps, go case-sensitive
    set shiftwidth=4 " auto-indent amount when using cindent, >>, << and stuff like that
    set softtabstop=4 " when hitting tab or backspace, how many spaces should a tab be (see expandtab)
    set tabstop=4 " real tabs should be 8, and they will show with set list on

" Folding
    set foldenable " Turn on folding
    set foldmethod=indent " Fold on the indent (damn you python)
    set foldlevel=100 " Don't autofold anything (but I can still fold manually)
    set foldopen=block,hor,mark,percent,quickfix,tag " what movements open folds
    function! SimpleFoldText() " {
        return getline(v:foldstart).' '
    endfunction " }
    set foldtext=SimpleFoldText() " Custom fold text function (cleaner than default)

" Plugin Settings
    let b:match_ignorecase = 1 " case is stupid
    let perl_extended_vars=1 " highlight advanced perl vars inside strings
    let tlist_aspjscript_settings = 'asp;f:function;c:class'
    let tlist_aspvbs_settings = 'asp;f:function;s:sub'
    let tlist_php_settings = 'php;c:class;d:constant;f:function'
    let tlist_vb_settings = 'asp;f:function;c:class'

" Mappings
    " hit f11 to paste
    " set pastetoggle=<f11>
    " space / shift-space scroll in normal mode
    noremap <S-space> <C-b>
    noremap <space> <C-f>
    " fuzzymaps
    " nmap <leader>f :FufFileWithCurrentBufferDir<CR>
    " nmap <leader>ff :FufFile<CR>
    " nmap <leader>b :FufBuffer<CR>
    " nmap <leader>t :FufBufferTag<CR>
    " nmap <tab> :FufBufferTag<CR>
    " make arrow keys useful
    map <left> <ESC>:NERDTreeFind<RETURN>
    " map <right> <ESC>:TagbarToggle<RETURN>
    nnoremap <buffer> <silent> k gk
    nnoremap <buffer> <silent> j gj
    nnoremap <buffer> <silent> gk k
    nnoremap <buffer> <silent> gj j

    map <up> <ESC>:bp<RETURN>
    map <down> <ESC>:bn<RETURN>
    map <C-H> :wincmd h<CR>
    map <C-J> :wincmd j<CR>
    map <C-K> :wincmd k<CR>
    map <C-L> :wincmd l<CR>

" Autocommands
    " ruby standard 2 spaces, always
    au BufRead,BufNewFile *.rb,*.rhtml set shiftwidth=2
    au BufRead,BufNewFile *.rb,*.rhtml set softtabstop=2
    " Override types
    au BufNewFile,BufRead *.ahk set filetype=autohotkey
    au BufNewFile,BufRead *.bat set filetype=dosbatch
    au BufNewFile,BufRead *.ps1 set filetype=ps1
    au BufNewFile,BufRead *.md set filetype=markdown
    au BufNewFile,BufRead *.dtl set filetype=htmldjango
    au BufNewFile,BufRead *.json,jquery.*.js set filetype=javascript syntax=jquery
    au BufNewFile,BufRead *.h,*.m,*.mm set filetype=objc
    au BufEnter,VimEnter,FileType *.ahk,*.bat set cindent cinoptions=+0
    au BufEnter,VimEnter,FileType *.autohotkey,*.batch set cindent cinoptions=+0
    au BufEnter,VimEnter,FileType *.ahk,*.bat,*.reg,*.ini set ff=dos
    " Remember everything (position, folds, etc)
    au BufWinLeave ?* mkview 1
    au BufWinEnter ?* silent loadview 1
    " Formatting
    function! RemoveTrailSpaces()
        let l:save_cursor = getpos('.')
        :%s/\(\s\|　\)\+$//gei
        call setpos('.', l:save_cursor)
    endfunction
    au BufWritePre * silent! call RemoveTrailSpaces()
    " Set highlights
    au BufEnter,VimEnter * set cursorline
    " highlight FormatWarning ctermbg=red ctermfg=white guibg=#592929 guifg=white
    highlight FormatWarning ctermbg=red guibg=#592929
    au BufEnter,VimEnter * match FormatWarning /\(\%81v.\+\|\( \|\t\)\+\n\)/

" GUI Settings
if has("gui_running")
    " Basics
    colorscheme molokai
    set guioptions=ce
    "              ||
    "              |+-- use simple dialogs rather than pop-ups
    "              +-- use GUI tabs, not console style tabs
    set mousehide " hide the mouse cursor when typing
    if g:os == "windows"
        set guifont=Consolas:h10
        set gfw=Consolas:h10
    elseif g:os == "linux"
        set guifont=Consolas\ 10.5
        set gfw=CourierNew\ 10.5
    elseif g:os == "mac"
        set guifont=Menlo:h11
        set gfw=Menlo:h11
    endif
    func! SwitchGUIDisplay() " Cusfunc, show a compact gui window
        if !exists("g:gdstate")
            let g:gdstate = 0
        else
            let g:gdstate = 1 - g:gdstate
        endif
        if (g:gdstate)
            set guioptions+=m
            set guioptions+=T
            set guioptions+=L
            set guioptions+=r
            set showtabline=1
        else
            set guioptions-=m
            set guioptions-=T
            set guioptions-=L
            set guioptions-=r
            set showtabline=0
        endif
    endfu
    nmap <F2> :call SwitchGUIDisplay()<CR>
    au VimEnter * call SwitchGUIDisplay()
    " map <F8> <ESC>:set guifont=Consolas:h8<CR>
    " map <F9> <ESC>:set guifont=Consolas:h10<CR>
    " map <F10> <ESC>:set guifont=Consolas:h12<CR>
    " map <F11> <ESC>:set guifont=Consolas:h16<CR>
    " map <F12> <ESC>:set guifont=Consolas:h20<CR>
endif

" Term Settings
if s:colorful_term
    "256 color --
    let &t_Co=256
    colorscheme molokai
    " colorscheme slate
    " restore screen after quitting
    if has("terminfo")
        let &t_Sf="\ESC[3%p1%dm"
        let &t_Sb="\ESC[4%p1%dm"
    else
        let &t_Sf="\ESC[3%dm"
        let &t_Sb="\ESC[4%dm"
    endif
endif

" Odds n Ends
set ttymouse=xterm2 " makes it work in everything

" plugin: vimtweak.dll - gvim transparency in windows
    " Alpha Window - SetAlpha
    " Maximized Window - EnableMaximize
    " EnableCaption - EnableCaption
    " TopMost Window - EnableTopMost
    func! ToggleDarkroom()
        if !exists("g:slate")
            let g:slate=1
            let s:o_lbr=&lbr
            let s:o_wrap=&wrap
            let s:o_colors = exists("g:colors_name") ? g:colors_name : "default"
        else
            let g:slate = 1 - g:slate
        endif
        if (g:slate)
            let &go=""
            set lbr wrap stal&
            call libcallnr("vimtweak.dll", "SetAlpha", 235)
            " call libcallnr("vimtweak.dll", "EnableCaption", 0)
        else
            let &lbr=s:o_lbr
            let &wrap=s:o_wrap
            set stal&
            call libcallnr("vimtweak.dll", "SetAlpha", 255)
            " call libcallnr("vimtweak.dll", "EnableCaption", 1)
        endif
    endfu
    nmap <F10> :call ToggleDarkroom()<CR>
    if has("gui_win32")
        au VimEnter * call ToggleDarkroom()
    elseif has("gui_mac") || has("gui_macvim")
        set transparency=7 " transparency, just work to MacVim
    endif

" plugin: Colorizer
    let cohi = 0
    if has("gui_running")
        let cohi = 1
    elseif stridx(&shell, 'cmd.exe') == -1
        let cohi = 1
    endif

    if cohi == 1
        au VimEnter * ColorHighlight
    endif

    " ColorHighlight " start/update highlighting
    " ColorClear " clear all highlights
    " ColorToggle " toggle highlights

" plugin: rainbow_parentheses
    au VimEnter * RainbowParenthesesToggle " on/off
    au Syntax * RainbowParenthesesLoadRound " ()
    au Syntax * RainbowParenthesesLoadSquare " []
    au Syntax * RainbowParenthesesLoadBraces " {}
    au Syntax * RainbowParenthesesLoadChevrons " <>

" plugin: Rainbow Parentheses
    " let g:rainbow_active = 1 " 0 if you want to enable it later via :RainbowToggle

" plugin: MiniBufExplorer
    let g:miniBufExplMapWindowNavVim = 1
    let g:miniBufExplMapWindowNavArrows = 1
    let g:miniBufExplMapCTabSwitchBufs = 0
    let g:miniBufExplModSelTarget = 1

" plugin: taglist
    if g:os == "windows"
        let Tlist_Ctags_Cmd = 'ctags'
    elseif g:os == "linux"
        let Tlist_Ctags_Cmd = '/usr/bin/ctags'
    elseif g:os == "mac"
        let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
    endif
    let Tlist_Show_One_File = 0
    let Tlist_Exit_OnlyWindow = 1
    let Tlist_User_Right_Window = 0

" plugin NERDTree
    let NERDTreeIgnore = ['\.beam', '\.pyc', 'ebin']
    " let NERDChristmasTree = 1
    " let NERDTreeMinimalUI = 1
    " let NERDTreeDirArrows = 0

    " these function and command make you can run NERDTree command easily.
        " <Original> --> <Customize>
        " NERDTree --> Ntr
        " NERDTreeFind --> Ntr find
        " NERDTreeClose --> Ntr close
    func! Ntr(...)
        let wholeCmd = "NERDTree"
        if exists("a:1")
            let capitalInitial = substitute(a:1, '\(.*\)', '\u\1', '')
            echo capitalInitial
            let wholeCmd = "NERDTree" . capitalInitial
        endif
        exec wholeCmd
    endfu
    command! -nargs=? Ntr call Ntr(<f-args>)

" Plugin neocomplcache
    " Disable AutoComplPop.
    let g:acp_enableAtStartup = 0
    " Use neocomplcache.
    let g:neocomplcache_enable_at_startup = 1
    " Use ignorecase
    let g:neocomplcache_enable_ignore_case = 1
    " Use smartcase.
    let g:neocomplcache_enable_smart_case = 0
    " Set minimum syntax keyword length.
    let g:neocomplcache_min_syntax_length = 1
    let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

    " Enable heavy features.
    " Use camel case completion.
    " let g:neocomplcache_enable_camel_case_completion = 1
    " Use underbar completion.
    " let g:neocomplcache_enable_underbar_completion = 1

    " Define dictionary.
    let g:neocomplcache_dictionary_filetype_lists = {
        \ 'default' : '',
        \ 'vimshell' : $HOME.'/.vimshell_hist',
        \ 'scheme' : $HOME.'/.gosh_completions'
            \ }

    " Define keyword.
    if !exists('g:neocomplcache_keyword_patterns')
        let g:neocomplcache_keyword_patterns = {}
    endif
    let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

    " Plugin key-mappings.
    inoremap <expr><C-g>     neocomplcache#undo_completion()
    inoremap <expr><C-l>     neocomplcache#complete_common_string()

    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
    return neocomplcache#smart_close_popup() . "\<CR>"
    " For no inserting <CR> key.
    "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
    endfunction
    " <TAB>: completion.
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
    inoremap <expr><C-y>  neocomplcache#close_popup()
    inoremap <expr><C-e>  neocomplcache#cancel_popup()
    " Close popup by <Space>.
    "inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

    " For cursor moving in insert mode(Not recommended)
    "inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
    "inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
    "inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
    "inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
    " Or set this.
    "let g:neocomplcache_enable_cursor_hold_i = 1
    " Or set this.
    "let g:neocomplcache_enable_insert_char_pre = 1

    " AutoComplPop like behavior.
    "let g:neocomplcache_enable_auto_select = 1

    " Shell like behavior(not recommended).
    "set completeopt+=longest
    "let g:neocomplcache_enable_auto_select = 1
    "let g:neocomplcache_disable_auto_complete = 1
    "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

    " Enable heavy omni completion.
    if !exists('g:neocomplcache_force_omni_patterns')
    let g:neocomplcache_force_omni_patterns = {}
    endif
    let g:neocomplcache_force_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    let g:neocomplcache_force_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
    let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

    " For perlomni.vim setting.
    " https://github.com/c9s/perlomni.vim
    let g:neocomplcache_force_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" Position and size settings
    let     g:dfl=30 | let g:dfc=86  | let g:dfx=-1  | let g:dfy=-1
    if g:os=="windows"
        let g:ml =48 | let g:mc =178 | let g:mx =7   | let g:my =7
        let g:ll =48 | let g:lc =101 | let g:lx =7   | let g:ly =7
        let g:rl =48 | let g:rc =101 | let g:rx =547 | let g:ry =7
        let g:lbl=26 | let g:lbc=113 | let g:lbx=0   | let g:lby=327
        let g:rbl=26 | let g:rbc=113 | let g:rbx=469 | let g:rby=327
        let g:ltl=26 | let g:ltc=113 | let g:ltx=0   | let g:lty=0
        let g:rtl=26 | let g:rtc=113 | let g:rtx=469 | let g:rty=0
    elseif g:os=="linux"
        let g:ml =49 | let g:mc =157 | let g:mx =7   | let g:my =29
        let g:ll =49 | let g:lc =87  | let g:lx =5   | let g:ly =28
        let g:rl =49 | let g:rc =87  | let g:rx =569 | let g:ry =29
        let g:lbl=33 | let g:lbc=110 | let g:lbx=4   | let g:lby=342
        let g:rbl=29 | let g:rbc=101 | let g:rbx=644 | let g:rby=335
        let g:ltl=33 | let g:ltc=110 | let g:ltx=4   | let g:lty=28
        let g:rtl=29 | let g:rtc=101 | let g:rtx=644 | let g:rty=29
    elseif g:os=="mac"
        let g:ml =56 | let g:mc =180 | let g:mx =8   | let g:my =32
        let g:ll =56 | let g:lc =100 | let g:lx =10  | let g:ly =32
        let g:rl =56 | let g:rc =100 | let g:rx =567 | let g:ry =32
        let g:lbl=34 | let g:lbc=118 | let g:lbx=3   | let g:lby=325
        let g:rbl=34 | let g:rbc=118 | let g:rbx=448 | let g:rby=325
        let g:ltl=34 | let g:ltc=118 | let g:ltx=3   | let g:lty=32
        let g:rtl=34 | let g:rtc=118 | let g:rtx=448 | let g:rty=32
    endif

    let hostfile=""
    if g:os=="windows"
        let hostfile=$HOME . '/vimfiles/gvimrc-' . substitute(hostname(), "\\..*", "", "")
    else
        let hostfile=$HOME . '/.vim/gvimrc-' . substitute(hostname(), "\\..*", "", "")
    endif
    if filereadable(hostfile)
        exe 'source ' . hostfile
    endif

    func! Size(posi)
        if a:posi ==? 'default' || a:posi ==? 'df'
            let g:posix = g:dfx | let g:posiy = g:dfy
            let g:sizel = g:dfl | let g:sizec = g:dfc
        elseif a:posi ==? 'max' || a:posi ==? 'm'
            let g:posix = g:mx | let g:posiy = g:my
            let g:sizel = g:ml | let g:sizec = g:mc
        elseif a:posi ==? 'left' || a:posi ==? 'l'
            let g:posix = g:lx | let g:posiy = g:ly
            let g:sizel = g:ll | let g:sizec = g:lc
        elseif a:posi ==? 'right' || a:posi ==? 'r'
            let g:posix = g:rx | let g:posiy = g:ry
            let g:sizel = g:rl | let g:sizec = g:rc
        elseif a:posi ==? 'leftbottom' || a:posi ==? 'lb'
            let g:posix = g:lbx | let g:posiy = g:lby
            let g:sizel = g:lbl | let g:sizec = g:lbc
        elseif a:posi ==? 'rightbottom' || a:posi ==? 'rb'
            let g:posix = g:rbx | let g:posiy = g:rby
            let g:sizel = g:rbl | let g:sizec = g:rbc
        elseif a:posi ==? 'lefttop' || a:posi ==? 'lt'
            let g:posix = g:ltx | let g:posiy = g:lty
            let g:sizel = g:ltl | let g:sizec = g:ltc
        elseif a:posi ==? 'righttop' || a:posi ==? 'rt'
            let g:posix = g:rtx | let g:posiy = g:rty
            let g:sizel = g:rtl | let g:sizec = g:rtc
        else
            let g:posix = -1 | let g:posiy = -1
            let g:sizel = -1 | let g:sizec = -1
        endif
        if g:posix == -1 && g:posiy == -1 && g:sizel == -1 && g:sizec == -1
            exec "echo('\"".a:posi."\" is not supported size!')"
        else
            " if g:posix > -1 && g:posiy > -1
            "     exec "winpos".g:posix." ".g:posiy
            " endif
            if g:sizel > -1 | exec "set lines=".g:sizel | endif
            if g:sizec > -1 | exec "set columns=".g:sizec | endif
        endif
    endfu

    command! -nargs=1 Size call Size(<f-args>)

    au GUIEnter * Size df
