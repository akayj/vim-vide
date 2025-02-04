" ____    ____  __   _______   _______
" \   \  /   / |  | |       \ |   ____|
"  \   \/   /  |  | |  .--.  ||  |__
"   \      /   |  | |  |  |  ||   __|
"    \    /    |  | |  '--'  ||  |____
"     \__/     |__| |_______/ |_______|
"

autocmd BufNewFile *.lua,*.sh,*.php 0r !~/.vim/template.sh %:e
autocmd BufRead,BufNewFile *.conf setfiletype conf
autocmd BufWinEnter *.volt,*.tp,*.mako set filetype=html
autocmd BufWinEnter *.sls set filetype=yaml
autocmd GUIEnter * silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
call system('mkdir -p ~/.vimtmp/undodir ~/.vimtmp/backupdir ~/.vimtmp/directory')
colorscheme torte
filetype on
filetype plugin indent on
filetype plugin on
let g:is_bash=1
let $VIMFILES=$HOME.'/.vim'
let @w = 'x~n'
nmap <c-l> <esc>:noh<cr>
nmap <leader>3 :NERDTreeFind<cr>
nmap <leader>a :set filetype=awk        <CR>
nmap <leader>c :set filetype=css        <CR>
nmap <leader>d :set filetype=htmldjango <CR>
nmap <leader>e :set filetype=sed        <CR>
nmap <leader>g :set filetype=go         <CR>
nmap <leader>h :set filetype=html       <CR>
nmap <leader>j :set filetype=javascript <CR>
nmap <leader>l :set filetype=lua        <CR>
nmap <leader>m :set filetype=markdown   <CR>
nmap <leader>p :set filetype=php        <CR>
nmap <leader>s :set filetype=sh         <CR>
nmap <leader>t :set filetype=txt        <CR>
nmap <leader>v :set filetype=vim        <CR>
nmap <leader>y :set filetype=python     <CR>
set ambiwidth=double
set autoread
set autowriteall
set backup
set bs+=start
set smartindent cindent autoindent
set shiftwidth=4 tabstop=4 smarttab
set clipboard+=unnamed
set complete-=i
set cursorline
set expandtab
set encoding=utf-8 fileencodings=ucs-bom,utf-8,cp936 fileencoding=utf-8
set foldmethod=manual
set hidden hlsearch
set ignorecase smartcase
set noautochdir
set noshowmatch
set nowrapscan
set number
set pastetoggle=<F5>
set path+=./model/,./ctrl/,./lib/,*/templates/,*/static/,..,*/src/main/java/
set printoptions=formfeed:y,header:0,paper:A4,duplex:off,syntax:n
set scrolloff=1
set shell=/bin/bash
set nocompatible
set showcmd                                 " Show cmd in vim-cmdline.
set t_Co=256                                " Make vim look better in putty.
set textwidth=0
set undodir=~/.vimtmp/undodir
            \ directory=~/.vimtmp/directory
            \ backupdir=~/.vimtmp/backupdir
            \ viewdir=~/.vimtmp/view
            \ undofile
set vb t_vb=                                " Turn off bi-sound of vim.
set wildignore+=*.git\\*,*.tgz,*.zip,*.url,*.pyc,*.class
syntax on

"
" statusline
"
set laststatus=2
set statusline=(Vide)\ \ %<%f
set statusline+=%w%h%m%r
set statusline+=\ %{getcwd()}
set statusline+=\ [%{&ff}:%{&fenc}:%Y]
set statusline+=%=%-14.(%l,%c%V%)\ %p%%

"
" vim-plug
"
call plug#begin('~/.vim/plug')
Plug 'airblade/vim-gitgutter'
Plug 'cespare/vim-toml'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'godlygeek/tabular'
Plug 'kien/ctrlp.vim'
Plug 'mzlogin/vim-markdown-toc'
Plug 'plasticboy/vim-markdown'
Plug 'roxma/vim-paste-easy'
Plug 'scrooloose/nerdtree'
Plug 'tmhedberg/matchit'

Plug 'tpope/vim-commentary'
" Plug 'scrooloose/nerdcommenter'

Plug 'vim-syntastic/syntastic'
Plug 'ntpeters/vim-better-whitespace'
Plug 'jiangmiao/auto-pairs'
Plug 'rust-lang/rust.vim'
Plug 'posva/vim-vue'
call plug#end()

let g:vim_markdown_folding_disabled = 1
let g:gitgutter_max_signs=10000

"
" syntastic
"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_quiet_messages = { "level": "errors" }
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

"
" go-vim
"
let g:go_version_warning = 0
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"
let g:go_fmt_options = {
\ 'gofmt': '-s',
\ 'goimports': '-local git.ppdaicorp.com',
\ 'goreturns': '-local git.ppdaicorp.com',
\ }

"
" NERDTree
"
let g:NERDTreeDirArrowExpandable  = '@'
let g:NERDTreeNodeDelimiter       = "\u00a0"
let g:NERDTreeDirArrowCollapsible = '-'
let g:NERDTreeShowHidden          = 0
let g:NERDTreeBookmarksFile       = $HOME.'/.vimtmp/NerdBookmarks.txt'
let g:NERDTreeShowBookmarks       = 1
let g:NERDTreeShowFiles           = 1
let g:NERDTreeShowLineNumbers     = 0
let g:NERDTreeWinSize             = 29
let g:NERDTreeMinimalUI           = 1
let g:NERDTreeDirArrows           = 1
let g:NERDTreeIgnore              = [
            \ '.*\.class',
            \ '.*\.pyc',
            \ '.*\.chm',
            \ '.*\.ttf',
            \ '.*\.lnk',
            \ '.*\.cproj',
            \ '.*\.exe',
            \ '.*\.dll',
            \ '.*\.out',
            \ '.*\.files',
            \ '.*\.zip',
            \ '.*\.rar',
            \ '.*\.gif'
            \ ]
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

"
" ctrlp
"
" Making CtrlP.vim load 100x faster — A Tiny Piece of Vim — Medm
" https://medium.com/a-tiny-piece-of-vim/making-ctrlp-vim-load-100x-faster-7a722fae7df6#.emcvo89nx
let g:ctrlp_user_command = [
            \ '.git/',
            \ 'git --git-dir=%s/.git ls-files -oc --exclude-standard'
            \ ]
let g:ctrlp_match_window       = 'bottom,order:btt,min:5,max:5,results:10'
let g:ctrlp_cmd                = 'CtrlPMixed'
let g:ctrlp_mruf_default_order = 1

"
" utime.vim
"
let g:timeStampFormat = '170101'
let g:timeStampString = '%y%m%d'
let g:timeStampLeader = 'version'

"
" white-spaces
"
let g:strip_whitespace_confirm=0
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

"
" autopair
"
let g:AutoPairsFlyMode = 1

"
" nerdcommenter
"
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
" let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1
