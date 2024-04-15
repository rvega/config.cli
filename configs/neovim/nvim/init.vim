
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Load some plugins manually
" 

" See lua/init.lua script. This is where the integration with language
" servers is configured. (semantic completions, fixers, linters, etc.)
packadd nvim-lspconfig

" Adds actions for adding surronds: ys, deleting: ds, changing: ds, etc.
packadd vim-surround
packadd vim-repeat

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Config
" 
set encoding=utf-8
filetype on
filetype plugin on
filetype indent on
set relativenumber
set number
set ignorecase 
set smartcase
set shiftwidth=4
set softtabstop=4
set expandtab
set clipboard^=unnamed,unnamedplus
set linebreak
set breakindent
set showbreak=>>
set foldmethod=indent
set foldlevelstart=99
set textwidth=0 wrapmargin=0
set hidden
set scrolloff=10
set wildmenu
set wildmode=list:longest
set laststatus=4  " Do not show status line, use horizontal line as pane separator instead.
set signcolumn=yes


" For motions, underscore separates words.
" For searches with * underscore does not separate words.
"set iskeyword-=_
"nnoremap * :set iskeyword+=_<cr>*:set iskeyword-=_<cr>:set hlsearch<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Settings particular to a file type 

augroup c_ft
  autocmd!
  " autocmd BufEnter *.h :setlocal filetype=c
augroup END

augroup cpp_ft
  autocmd!
  autocmd FileType cpp :setlocal foldmethod=syntax
augroup END

augroup php_ft
  autocmd!
  autocmd FileType php :setlocal softtabstop=4
  autocmd FileType php :setlocal shiftwidth=4
  autocmd FileType php :setlocal tabstop=4
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax Highlighting.
" 

" Better syntax highlighting. Look for other languages here
" https://github.com/sheerun/vim-polyglot

packadd vim-syntax-extra       " For C
packadd vim-cpp                " CPP
packadd vim-javascript-syntax  " Javascript
packadd vim-xml                " XML
packadd php.vim                " php


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
" 

" " Training wheels: Don't use backspace repeatedly, use <c-w> or <c-h>
" " inoremap <backspace> <nop>
" nnoremap jj <nop>
" nnoremap kk <nop>
" nnoremap hh <nop>
" nnoremap ll <nop>

" Use spacebar as leader
nnoremap <space> <nop>
let mapleader=" " 

" fd instead of escape. Also clear search highlight.
nnoremap <esc> <nop>
noremap fd <esc>:noh<cr>
noremap! fd <esc>:noh<cr>
" noremap df <esc>:noh<cr>
" noremap! df <esc>:noh<cr>

" Ctrl backspace deletes one word in insert mode
" noremap! <c-backspace> bbb
" noremap! <backspace> aaa

" Ctrl+v is normally visual block mode, change to leader+v
noremap <leader>v <C-v>

" Paste and indent 
noremap <leader>p p=gb

" expand {<cr> and {<space> in insert mode 
inoremap {<cr> {<cr>}<esc>O
inoremap (<cr> (<cr>)<esc>O
inoremap [<cr> [<cr>]<esc>O
inoremap {<space> { }<esc>hi 
inoremap (<space> ( )<esc>hi
inoremap [<space> [ ]<esc>hi

" Always show command history with :
" nnoremap : q:i
" vnoremap : q:i

" Navigate open buffers
packadd vim-bbye  " :Bdelete is better than :bdelete 
                  "  See https://github.com/moll/vim-bbye
nnoremap <leader>n :bn<cr>
nnoremap <leader>N :bp<cr>
nnoremap <leader>l :Buffers<cr>
nnoremap <leader>d :Bdelete<cr>

" Close file / window
nnoremap <leader>q :q<cr>

" Folds
" Disabling this. Use zR, zr, zM, zm instead. (z reduce and z more)
" nnoremap z0 :set foldlevel=99<cr>
" nnoremap z1 :set foldlevel=0<cr>
" nnoremap z2 :set foldlevel=1<cr>
" nnoremap z3 :set foldlevel=2<cr>

" Jump to sections (functions) with [], ][, [[ and ]]. See :h []
nnoremap [[ ?{<CR>w99[{(
nnoremap ]] ][j/{<CR>(
nnoremap ][ /}<CR>b99]}
nnoremap [] k$][%?}<CR>

" Increment and decrement numbers
nnoremap <leader>a <c-a>
nnoremap <leader>x <c-x>
vnoremap g<leader>a g<c-a>
vnoremap g<leader>x g<c-x>

" This one is useful for splitting strings into array items. Ex:
" foo = 'a b c d'
" into
" foo = ['a', 'b', 'c', 'd']
nnoremap <leader>s F'i<return><esc>A<return><esc>kV:s/ /', '/g<return>I[<esc>A]<esc>kJ:noh<return>

" Surround a word in C++ comments. Useful for parameter names in functions.
nnoremap gciw <right>bi/* <esc>ea */<esc>

" Jump to next underscore in line and convert to CamelCase
nnoremap <leader>_ f_xgUl
"
" Jump to next uppercase letter and replace it with underscore and lowercase.
" This is useful for converting camelCase to snake_case
nnoremap <leader>- /[A-Z]<return>i_<esc>lgul:noh<cr>

" Replace ['something'] with ->something This is useful for php
nnoremap <leader>> f[xxi-><esc>f]xX<esc>

" Replace ->something with ['something'] This is useful for php
nnoremap <leader>[ f-xxi['<esc>ea']<esc>

" Close html tag.
nnoremap <leader>/ a</<c-x><c-o><esc>==


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ctags
"
" Generate tags manually, externally, with something like 
" `ctags --recurse -languages=c --languages=c++ ./` 
"
" Or, see the automatic git hooks I set up for this in
" ~/Config/git/gittemplate/hooks
" Explained here: https://tbaggery.com/2011/08/08/effortless-ctags-with-git.html

" Jump to tag under cursor with <c-[> or g<c-[>, use [t and ]t to jump to other
" occurences. Also :tag <keyword> is useful

" Look for tags file in file directory or current directory
" set tags=./tags,tags,/home/vega/tags
set tags=./tags,tags

nnoremap <silent> [t :tprevious<CR>
nnoremap <silent> ]t :tnext<CR>
nnoremap <silent> [T :tfirst<CR>
nnoremap <silent> ]T :tlast<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocompletion

" Completion case sensitive, other things like search in file stay case
" insensitive. 
au InsertEnter * set noignorecase
au InsertLeave * set ignorecase

set completeopt=menu,longest

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Snippets. Ultisnips
" 

packadd ultisnips
packadd vim-snippets

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-p>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text objects
 
" Allows for user defined text objects. See here if more text objects 
" are needed https://github.com/kana/vim-textobj-user/wiki
packadd vim-textobj-user

" gb for text object last pasted text. Nice with comments or indents, 
" e.g: indent pasted text "=gb"
packadd vim-textobj-pastedtext

" f for functions in C, Java and Vimscript. Can be extended for 
" more languages.
packadd vim-textobj-function
packadd vim-textobj-function-javascript  " Adds JS support
packadd vim-textobj-python               " Adds python support
packadd vim-textobj-function-php         " Adds php

" Better paragraphs. p for paragraphs, { and } for motions.
" Note that I'm using my fork of this plugin. I did that 
" because it's the only way to change mappings.
packadd vim-textobj-indented-paragraph




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Undo history
"

packadd undotree

set undofile
autocmd BufWritePre /tmp/* setlocal noundofile
nnoremap <leader>z :UndotreeToggle<cr>

"" Another option is vim-undo (commented out below). 
"" It has better search in history of file but not working 
"" last time I checked.
""
""   call minpac#add('simnalamburt/vim-mundo')
""   autocmd BufWritePre /tmp/* setlocal noundofile
""   nnoremap <leader>z :MundoToggle<cr>
""   let g:mundo_prefer_python3 = 1
""   let g:mundo_auto_preview_delay = 1000


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fuzzy Finder
"
" Requires the fzf binary to be available in PATH. See zsh config.
"
" TODO: Explore! There are a lot of interesting commands in this 
" plugin. https://github.com/junegunn/fzf.vim
"
" Use these commands!!!
" <leader>t or :GFiles for opening files in repo. see below.
" <leader>T or :Files for opening ALL files, even gitignored files.
" <leader>r or :Rg to search in whole project. Respects ignore files
" :Tags
" :Snippets

packadd fzf
packadd fzf.vim

" nmap <leader><tab> <plug>(fzf-maps-n)
" xmap <leader><tab> <plug>(fzf-maps-x)
" omap <leader><tab> <plug>(fzf-maps-o)<Paste>
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)
let g:fzf_preview_window = []

"""""
" This will respect .gitignore and .ignore files (use the .ignore file!)
command! -bang RafaFiles call fzf#run(fzf#wrap({'source': "rg --files --follow --hidden --color=never", 'sink': 'e'}))
nmap <leader>t :RafaFiles<cr> 

" This NOT will respect .gitignore or .ignore files will show everything
command! -bang RafaAllFiles call fzf#run(fzf#wrap({'source': "rg --files --follow --hidden --no-ignore --color=never --glob !.cache --glob !.git", 'sink': 'e'}))
nmap <leader>T :RafaAllFiles<cr> 

" Search within files respecting .gitignore and .ignore
command! -bang -nargs=* RipGrep call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case -- ".shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)
nmap <leader>r :RipGrep 

" Search within files without respecting .gitignore and .ignore
command! -bang -nargs=* RipGrepAll call fzf#vim#grep("rg --no-ignore --glob !tags --glob !.git --glob !.cache --column --line-number --no-heading --color=always --smart-case -- ".shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)
nmap <leader>R :RipGrepAll 


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Jump between c and h (companion) files.
" 

packadd vim-fswitch
nnoremap <leader>h :call FSwitch('%', '')<cr>

"autocmd BufEnter *.c let b:fswitchlocs = 'reg:/src/include/,reg:|src|include/**|,ifrel:|/src/|../include|'

" ts and html files, useful for angular projects
au! BufEnter *.ts let b:fswitchdst = 'html' | let b:fswitchlocs = './'
au! BufEnter *.html let b:fswitchdst = 'ts' | let b:fswitchlocs = './'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Compile using cmake

packadd cmake4vim

" let g:cmake_build_dir="Build/Debug"
let g:cmake_build_dir="build"
let g:cmake_project_generator="Ninja"
" g:cmake_build_executor_height=5
" map <leader>b :CMakeBuild<cr>:copen<cr>
map <leader>b :CMakeBuild<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Line wrapping and vertical movement as a word processor.
" Better for writing text, not code.

" :call WordProcessorMode()

function! WordProcessorMode()
  setlocal formatoptions=1
  setlocal showbreak=
  map <buffer> j gj
  map <buffer> k gk
  map <buffer> $ g$
  map <buffer> ^ g^
  map <buffer> 0 g0
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" WIKI and markdown files
"" Wiki.vim keeps to-do lists, notes, etc.
"" <leader>ww

packadd vim-markdown
packadd wiki.vim
packadd lists.vim

let g:wiki_root = '/home/rvg/wiki'
let g:wiki_link_target_type = 'md'
let g:wiki_filetypes = ['md']

" Enable lists in markdown files.
let g:lists_filetypes = ['markdown', 'md', 'wiki']

" <leader>X to toggle to-do items in bulleted lists. <c-s> is default
let g:lists_maps_default_override = {
      \ '<plug>(lists-toggle)' : '<leader>X',
\}

function! MarkdownConfig()
  call WordProcessorMode()
  setlocal softtabstop=3
  setlocal shiftwidth=3
  setlocal conceallevel=1
  inoremap <buffer> [<space> * [ ]<space>
  :ListsEnable
endfunction

augroup markdfown_ft
  autocmd!
  autocmd BufEnter *.md :call MarkdownConfig()
  autocmd BufEnter *.wiki :call MarkdownConfig()
  autocmd BufEnter *.wiki :setlocal filetype=markdown
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Toggle Comments.
"
" In normal mode use "gc" with movemments or "gcc" for current line.
" e.g: "gcp" toggles comments for a paragraph
" In visual mode, select and then do "gc"

packadd vim-commentary

augroup c_ftft
   autocmd!
   autocmd FileType c :setlocal commentstring=//\ %s
   autocmd FileType cpp :setlocal commentstring=//\ %s
augroup END

augroup php_ftft
   autocmd!
   autocmd FileType php :setlocal commentstring=//\ %s
augroup END

augroup js_ftft
   autocmd!
   autocmd FileType typescript :setlocal commentstring=//\ %s
   autocmd FileType js :setlocal commentstring=//\ %s
augroup END


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ask for sudo password
" 

packadd suda.vim
"cnoremap ee e suda://%
cnoremap ww w suda://%


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Integration with tmux
" 

packadd vim-tmux-navigator

let g:tmux_navigator_no_mappings = 2
nnoremap <silent> <c-a>h :TmuxNavigateLeft<cr>
nnoremap <silent> <c-a>j :TmuxNavigateDown<cr>
nnoremap <silent> <c-a>k :TmuxNavigateUp<cr>
nnoremap <silent> <c-a>l :TmuxNavigateRight<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use TMUX clipboard instead of X11 clipboard. 
" This is useful for remote ssh+tmux sessions.
" 
" Use this only in remote machines. It breaks linewise pasting as described
" in https://github.com/roxma/vim-tmux-clipboard/issues/4 but it's still
" useful for remote ssh+tmux sessions.

" call minpac#add('roxma/vim-tmux-clipboard')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spelling

" See mappings in https://github.com/kamykn/spelunker.vim
" Zl -> list correction
" Zg -> add word to dictionary
" ZN -> Jump to next error
" ZP -> Jump to previous error

" Enable by default only in php files.
let g:spelunker_disable_auto_group= 1
augroup spelunker
  autocmd!
  autocmd BufWinEnter,BufWritePost *.php call spelunker#check()
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Macros
" 

" Fix Black rooster audio style doxygen code blocks.
let @p = '^v%:s/\t//gv%kj:s/^/ * /gxwlh%XXv%>fdd2w=ip' 


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors
" 
" More color config is in init.lua. 

packadd onedarkpro

set termguicolors
syntax enable
set background=dark


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PHP Debugger
" :packadd vdebug to enable the plugin and then <f5> to listen for
" connections. You'll need to change mappings below for projects that use
" remote debugger (docker containers for example).

" packadd vdebug

let g:vdebug_options = {
\   'path_maps': {
\        "/var/1rpm/source/source": "/home/Rafa/Projects/Active/OneRPM/repos/onerpm-legacy/source",
\        "/var/www/": "/home/Rafa/Projects/Active/OneRPM/repos/onerpm-api",
\   },
\}

lua require('init')
