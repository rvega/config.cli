
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Install plugins
" 

call plug#begin()

" Color scheme
Plug 'olimorris/onedarkpro.nvim'

" Adds actions for adding surronds: ys, deleting: ds, changing: ds, etc.
Plug 'tpope/vim-surround'

" Makes more stuff (like surround) repeatable with "."
Plug 'tpope/vim-repeat'

" Seamless navigation between tmux panes and vim splits.
Plug 'christoomey/vim-tmux-navigator'

" Fuzzy finder, file picker, etc.
Plug 'ibhagwan/fzf-lua'

" Undo Tree
Plug 'simnalamburt/vim-mundo'

" Distraction free mode  
" :Goyo
Plug 'junegunn/goyo.vim'

" Switch between h and c files
Plug 'derekwyatt/vim-fswitch'

" markdown and wiki files.
" <leader>ww
Plug 'plasticboy/vim-markdown'
Plug 'lervag/wiki.vim'
Plug 'lervag/lists.vim'

" :Bdelete is better than :bdelete because it does not mess up splits /
" layouts. See https://github.com/moll/vim-bbye
Plug 'moll/vim-bbye'

" Align columns ga
Plug 'junegunn/vim-easy-align'

" save files with sudo
Plug 'lambdalisue/suda.vim'

" Language server protocol. look at init.lua. 
Plug 'mason-org/mason.nvim'   " Installs external LSPs, formatters, etc.
Plug 'neovim/nvim-lspconfig'  " This is neovim's LSP client. 
Plug 'stevearc/conform.nvim'  " Sometimes LSP formatters are bad. This helps.


""""
" Better syntax highlighting
" Look for other languages here https://github.com/sheerun/vim-polyglot
" 
Plug 'justinmk/vim-syntax-extra'            " For C
Plug 'vim-jp/vim-cpp'                       " CPP
Plug 'jelera/vim-javascript-syntax'         " Javascript
Plug 'amadeus/vim-xml'                      " XML
Plug 'StanAngeloff/php.vim'                 " php
Plug 'git@github.com:peterhoeg/vim-qml.git' " QML
Plug 'vim-python/python-syntax'             " Python

""""
" Text objects.
"
" Allow for user defined text objects. See here if more text objects are needed
" https://github.com/kana/vim-textobj-user/wiki
Plug 'kana/vim-textobj-user'

" gb for text object last pasted text.
" Nice with comments or indents, e.g. indent pasted text "=gb"
Plug 'saaguero/vim-textobj-pastedtext'

" Better paragraphs. p for paragraphs, { and } for motions.
Plug 'rvega/vim-textobj-indented-paragraph'

" Block with same indentation i.
Plug 'kana/vim-textobj-indent'

" f for functions in C, Java and Vimscript. May be extended for more languages.
Plug 'kana/vim-textobj-function'
Plug 'thinca/vim-textobj-function-javascript' " Adds JS support
Plug 'bps/vim-textobj-python'                 " Adds python support
Plug 'kentaro/vim-textobj-function-php'       " Adds php

call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Config
" 
set encoding=utf-8
filetype on
filetype plugin on
filetype indent on
 set relativenumber
" set number
set ignorecase 
set smartcase
set shiftwidth=4
set softtabstop=4
set expandtab
set clipboard^=unnamed,unnamedplus
set linebreak
set breakindent
set showbreak=>>
set textwidth=0 
set wrapmargin=0
set hidden
set scrolloff=10
set wildmenu
set wildmode=list:longest
set laststatus=4  " Do not show status line, use horizontal line as pane separator instead.
set signcolumn=yes
set exrc

set foldmethod=indent
set foldlevelstart=99
set foldminlines=0
function! MyFoldText()
    " blanks is the spaces in the beggining of the first folded line, to keep 
    " indentation when folded.
    let nl = v:foldend - v:foldstart + 1
    let firstline = getline(v:foldstart)
    let blanks = substitute(firstline, '\(^ *\).*', '\1', 'g')
    let txt = '  ' . blanks . nl . ' folded lines. '
    return txt
endfunction
set foldtext=MyFoldText()

" For motions, underscore separates words.
" For searches with * underscore does not separate words.
"set iskeyword-=_
"nnoremap * :set iskeyword+=_<cr>*:set iskeyword-=_<cr>:set hlsearch<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors
" Config is in init.lua. 
 set termguicolors
 syntax enable
 set background=dark


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Settings particular to a file type 

augroup c_ft
    autocmd!
    " autocmd BufEnter *.h :setlocal filetype=c
augroup END

augroup cpp_ft
    autocmd!
    "autocmd FileType cpp :setlocal foldmethod=syntax
    autocmd FileType cpp :setlocal autoindent noexpandtab tabstop=4 shiftwidth=4

    " Strip trailing whitespace when saving
    autocmd FileType cpp autocmd BufWritePre * :call StripTrailingWhitespace()
augroup END

augroup php_ft
    autocmd!
    autocmd FileType php :setlocal softtabstop=4
    autocmd FileType php :setlocal shiftwidth=4
    autocmd FileType php :setlocal tabstop=4
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
" 

" Training wheels: Don't use backspace repeatedly, use <c-w> or <c-h>
" inoremap <backspace> <nop>
nnoremap jj <nop>
nnoremap kk <nop>
nnoremap hh <nop>
nnoremap ll <nop>

" Use spacebar as leader
nnoremap <space> <nop>
let mapleader=" " 

" fd instead of escape. Also clear search highlight.
nnoremap <esc> <nop>
noremap fd <esc>:noh<cr>
noremap! fd <esc>:noh<cr>
" noremap df <esc>:noh<cr>
" noremap! df <esc>:noh<cr>

" I'm using the å character as a workaround for the ctrl+w shortcut in
" windows.
noremap! å <c-w>

" Ctrl backspace deletes one word in insert mode
" noremap! <c-backspace> bbb
" noremap! <backspace> aaa

" Ctrl+v is normally visual block mode, change to leader+v
noremap <leader>v <C-v>

" Paste and indent 
noremap p p=gb

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
nnoremap <leader>n :bn<cr>
nnoremap <leader>p :bp<cr>
"nnoremap <leader>l :Buffers<cr>  " Taken care by fzf-lua.
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

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ctags
"
" Generate tags manually, externally, with something like 
" `ctags --recurse --languages=c --languages=c++ ./` 
"
" Or, see the automatic git hooks I set up for this in
" ~/Config/git/gittemplate/hooks
" Explained here: https://tbaggery.com/2011/08/08/effortless-ctags-with-git.html

" Jump to tag under cursor with <c-[> or g<c-[>, use [t and ]t to jump to other
" occurences. Also :tag <keyword> is useful

" Look for tags file in file directory or current directory
" set tags=./tags,tags,/home/vega/tags
set tags=./tags,tags

" If you want to index external libraries, for example Qt:
"   cd ~/Qt/6.8.3/Src
"   ctags --recurse --languages=c --languages=c++ ./
"set tags+=/mnt/c/Qt/6.6.1/Src/tags


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

"call minpac#add('SirVer/ultisnips')
"call minpac#add('honza/vim-snippets')
" packadd ultisnips
" packadd vim-snippets
" 
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-n>"
" let g:UltiSnipsJumpBackwardTrigger="<c-p>"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Undo history
"
set undofile
autocmd BufWritePre /tmp/* setlocal noundofile
nnoremap <leader>z :MundoToggle<cr>
let g:mundo_auto_preview_delay = 1000


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search Replace
" Select fzf results with tab or with alt+a (and then enter), to put
" them in the quickfix list.  Then, for example, replace all occurrences...

" Replace in many files. Put stuff in the quicklist fzf and then do 
"   :Replace search_str replace_str
function! ReplaceFn( ... )
    " With confirmation before replace: 
    let cmd = 'cfdo %s/' . a:1 . '/' . a:2 . '/gc | update'

    " Without confirmation for each replace, just do it:
    "let cmd = 'cfdo %s/' . a:1 . '/' . a:2 . '/g | update'

    execute cmd
    "echo cmd
    "cfdo %s/search_string/replace_string/g | update
endfunction
command! -bang -nargs=+ Replace call ReplaceFn(<f-args>)
nmap <leader>re :Replace searchThis replaceWithThis 

" Or, without the fzf picker:
" :SearchReplace search_this replace_with_this *.cpp\ *.h
function! SearchReplaceFn( ... )
    " With confirmation for each replace:
    let cmd = 'vimgrep ' . a:1 . ' ' . a:3 .' | cfdo %s/' . a:1 . '/' . a:2 . '/gc | update'

    " Without confirmation for each replace, just do it.
    "let cmd = 'vimgrep ' . a:1 . ' ' . a:3 .' | cfdo %s/' . a:1 . '/' . a:2 . '/g | update'
    execute cmd
endfunction
command! -bang -nargs=+ SearchReplace call SearchReplaceFn(<f-args>)
nmap <leader>sr :SearchReplace searchThis replaceWithThis *.cpp\ *.h

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Jump between c and h (companion) files.
" 
" See :h fswitchlocs to add directories for finding sources.

nnoremap <leader>h :call FSwitch('%', '')<cr>

"autocmd BufEnter *.c let b:fswitchlocs = 'reg:/src/include/,reg:|src|include/**|,ifrel:|/src/|../include|'

" Where to find QT's cpp files.
autocmd BufEnter *.h let b:fswitchlocs = '/src/include/,reg:|src|include/**|,ifrel:|/src/|../include|'

" ts and html files, useful for angular projects
au! BufEnter *.ts let b:fswitchdst = 'html' | let b:fswitchlocs = './'
au! BufEnter *.html let b:fswitchdst = 'ts' | let b:fswitchlocs = './'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Compile stuff. 
" When :make is called, the makeprg below is executed. 
" Then, the error messages from the compiler are parsed by errorformat and put
" in the quickfix. Sometimes, external processing of the error messages is
" needed, for example, ansi2txt removes hard to parse error escape codes:
"   let &makeprg = "cd build && ninja \\\| ansi2txt"
"
" There's a bunch of errorformats here: https://github.com/neomake/neomake/tree/584f882b9f991245374e7e7d7d1f78bae90b7a35/autoload/neomake/makers/ft


"""
" Todo: explore the following to parse and display messages as they are 
" generated, asynchronously.
" https://github.com/tpope/vim-dispatch
" https://stackoverflow.com/questions/21592167/cmake-can-i-filter-compiler-output-through-another-program
" https://phelipetls.github.io/posts/async-make-in-nvim-with-lua/

"""
" For clang + cmake:
let &makeprg = "cd build/Qt_6_8_3_for_macOS-Debug && ninja \\\| ansi2txt"
let &errorformat = ' 
    \%f:%l:%c: %trror: %m,  
    \%f:%l:%c: %tarning: %m, 
    \%f:%l:%c: %tote: %m,  
    \%f:%l:%c: %m,        
    \clang++: %trror: %m,
    \%+Eninja: build stopped: subcommand failed.,
    \%-G%.%#'                " -G ignores everything else
    "\%+Ininja: no work to do.,        

" Open qflist after compiling
function PostMake()
    if len(getqflist()) == 0
        call timer_start(2000, {-> execute("cclose", "")})
        unsilent echo "Make Ok"
    else
        copen
    endif
endfunction
autocmd QuickfixCmdPost * call PostMake()

"nnoremap <leader>b :silent make<cr>
nnoremap <leader>b :make<cr>

" Post processing for error messages can also happen here. This is not
" working. Here's an example that should work: 
" https://github.com/tpope/vim-fireplace/blob/5e66509599de92550762cf2681338fc4cd1e71cf/plugin/fireplace.vim#L17-L20
"function MakeErrorsPost()
"   let qflist = getqflist()
"   for i in qflist
"       echo bufname(i.bufnr) 
"       e main.cpp
"       let i.filename = "main.cpp"  
"   endfor
"   call setqflist(qflist)
"   copen
"endfunction
"autocmd QuickfixCmdPost * call MakeErrorsPost()


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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Strip white space

" :call StripTrailingWhitespace()

function! StripTrailingWhitespace()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" WIKI and markdown files

let g:wiki_root = '/mnt/c/Users/admin/Rafa/wiki'
let g:wiki_link_target_type = 'wiki'
let g:wiki_filetypes = ['md']
"let g:wiki_filetypes = ['wiki']  " On macos, must be wiki, weird.
"let g:wiki_root = '/Users/Rafa/wiki'

let g:markdown_folding = 1

" Enable lists in markdown files.
let g:lists_filetypes = ['markdown', 'md', 'wiki']
let g:lists_maps_default_override = {
      \ '<plug>(lists-toggle)' : '<leader>y',
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

" Open file links with xdg-open
" let g:wiki_file_open = 'WikiFileOpen'
" function! WikiFileOpen(...) abort dict
"   silent execute '!xdg-open' fnameescape(self.path) '&'
"   return 1
" endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Toggle Comments.
"
" In normal mode use "gc" with movemments or "gcc" for current line.
" e.g: "gcp" toggles comments for a paragraph
" In visual mode, select and then do "gc"

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
"cnoremap ee e uda://%
cnoremap ww w suda://%


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Integration with tmux
" 

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


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Clipboard integration in WSL
"let g:clipboard = {
"            \   'name': 'WslClipboard',
"            \   'copy': {
"            \      '+': 'clip.exe',
"            \      '*': 'clip.exe',
"            \    },
"            \   'paste': {
"            \      '+': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
"            \      '*': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
"            \   },
"            \   'cache_enabled': 0,
"            \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spelling

" Better spelling corrector
" call minpac#add('kamykn/spelunker.vim')

" See mappings in https://github.com/kamykn/spelunker.vim
" Zl -> list correction
" Zg -> add word to dictionary
" ZN -> Jump to next error
" ZP -> Jump to previous error

" Enable by default only in php files.
" let g:spelunker_disable_auto_group= 1
" augroup spelunker
"   autocmd!
"   autocmd BufWinEnter,BufWritePost *.php call spelunker#check()
" augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Macros
" 

" Fix Black rooster audio style doxygen code blocks.
" let @p = '^v%:s/\t//gv%kj:s/^/ * /gxwlh%XXv%>fdd2w=ip' 


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PHP Debugger
" :packadd vdebug to enable the plugin and then <f5> to listen for
" connections. You'll need to change mappings below for projects that use
" remote debugger (docker containers for example).
" packadd vdebug

  " call minpac#add('vim-vdebug/vdebug', {'type': 'opt'}) 

" let g:vdebug_options = {
" \   'path_maps': {
" \        "/var/1rpm/source/source": "/home/Rafa/Projects/Active/OneRPM/repos/onerpm-legacy/source",
" \        "/var/www/": "/home/Rafa/Projects/Active/OneRPM/repos/onerpm-api",
" \   },
" \}


lua require('init')
