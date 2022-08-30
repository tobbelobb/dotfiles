set nocompatible " Disable vi-compatibility
set backspace=2
filetype plugin on
filetype indent on
set encoding=utf-8

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

set scrolloff=1
set incsearch
" ODrive Firmware tab settings
"set tabstop=4
"set shiftwidth=4
"set softtabstop=4
"set expandtab
"set smarttab

" RepRapFirmware tab settings
"set smarttab
"set tabstop=4
"set shiftwidth=4
"set softtabstop=0
"set noexpandtab


"" Normal tab settings
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab

" Just want to find the tags files.
" The .git dirs in parent dirs were supposed to be searched by default
" But they weren't
set tags=./tags,../.git/tags,../../.git/tags,../../../.git/tags


set autoindent
set nu
set undofile
set ignorecase
set smartcase
set gdefault
"syntax on
syntax enable
set wrap
set textwidth=170
set formatoptions=qrn1
"set colorcolumn=85
set laststatus=2 " Always show the statusline
"set autochdir
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Format Rust code upon save
let g:rustfmt_autosave = 1
function! Formatonsave()
  let l:formatdiff = 1
  py3file ~/.vim/clang-format.py
endfunction
" Format C++ code upon save
"autocmd BufWritePre *.h,*.cc,*.cpp,*.hxx,*.cxx,*.c++,*.h++ call Formatonsave()

set nrformats=""
nmap ø :w<Esc>
vmap ø :w<Esc>
"cmap ø <Esc>
imap fd <Esc>
imap Fd <Esc>
imap đd <Esc>
imap øø <Esc>
nmap Ø :w<Esc>
nmap ö :w<Esc>
vmap ö :w<Esc>
imap öö <Esc>
"cmap ö <Esc>
nmap Ö :w<Esc>
"map ä :py3file ~/.vim/clang-format.py<cr>
map ä :RustFmt<cr>
"imap ä :w<Esc>
"cmap ä <Esc>
inoremap ää <right><Esc>
nmap Ä :w<Esc>
"map æ :py3file ~/.vim/clang-format.py<cr>
map æ :RustFmt<cr>
"nmap æ :w<Esc>
"vmap æ :w<Esc>
"cmap æ <Esc>
"inoremap ææ <right><Esc>
nmap Æ :w<Esc>
"inoremap ø- <right><Return>
"inoremap ö- <right><Return>
imap fd <Esc>

" Experimental. Alleviate finger strain from typing braces
imap fB {<cr>}<up><end><cr>
imap fb {}
imap ¨ #[()]

set winaltkeys=no
set clipboard=unnamed,unnamedplus
set notitle
" λ lambda
inoremap <C-l> <C-v>u3bb<Space>
let g:clang_library_path="/usr/lib/llvm-3.5/lib"
" Shift-j/k inserts blank line below/above
nnoremap <S-k> m`O<esc>``
nnoremap <S-j> m`o<esc>``
"inoremap <S-j> <esc>m`o<esc>``a
"inoremap <S-k> <esc>m`O<esc>``a
" page up, page down...
nnoremap <C-k> <C-b>
nnoremap <C-j> <C-f>
" split ordnung
set splitright
set splitbelow
"Spellchecking
"set spell
"setlocal spelllang=en
"setlocal spelllang=nb
setlocal spelllang=sv
" lisp stuff
let g:lisp_rainbow=1
" The command to start swank. Helping slimv a bit
" let g:slimv_swank_cmd = '! xterm -e sbcl --load /home/torbjorn/.vim/slime/start-swank.lisp &'
" Other possible swanks
" let g:slimv_swank_cmd = '! xterm -e sbcl --load  /usr/share/common-lisp/source/slime/start-swank.lisp &'
 let g:slimv_swank_cmd = '! xterm -e sbcl --load  /home/torbjorn/quicklisp/dists/quicklisp/software/slime-v2.18/start-swank.lisp &'
let paredit_mode=0
" A little larger blocks is faster when lots of data is sent, and not very slow otherwise
let g:swank_block_size = 65536
" Don't want to eval on every <Cr> in REPL
let g:slimv_repl_simple_eval=0
" Don't echo lines!
let g:slimv_echolines=0
" Jump to the last position when reopening a file
if has("autocmd")
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
\| exe "normal g'\"" | endif
endif
" Try a little bit harder to get highlighting of multiline comments and
" strings right...
" syntax sync minlines=500
" Try even harder to get highlightning right...
"autocmd BufEnter * :syntax sync fromstart
" Autoreload this file on save...
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }
" Save folds and restore when file is re-opened
"au BufWinLeave * mkview
"au BufWinEnter * silent loadview
" Base html-indenting on <p> as well...
let g:html_indent_inctags = "p"
" Don't indent on &! Never!
setlocal indentkeys-=\&
" Tab to next window. Ctrl-w means quit in Chrome
"nnoremap <S-tab> <c-w>w
"nnoremap <S-tab> <c-w>W

""""""""""""""" MESSING AROUND WITH DIRECTORIES """"""""""""""""""
" Save your backups to a less annoying place than the current directory.
" If you have .vim-backup in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/backup or . if all else fails.
if isdirectory($HOME . '/.vim/backup') == 0
  :silent !mkdir -p ~/.vim/backup >/dev/null 2>&1
endif
set backupdir-=.
set backupdir+=.
set backupdir-=~/
set backupdir^=~/.vim/backup/
set backupdir^=./.vim-backup/
set backup
" Save your swp files to a less annoying place than the current directory.
" If you have .vim-swap in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/swap, ~/tmp or .
if isdirectory($HOME . '/.vim/swap') == 0
  :silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
endif
set directory=./.vim-swap//
set directory+=~/.vim/swap//
set directory+=~/tmp//
set directory+=.

" viminfo stores the the state of your previous editing session
set viminfo+=n~/.vim/viminfo

if exists("+undofile")
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  " This is only present in 7.3+
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=./.vim-undo//
  set undodir+=~/.vim/undo//
  set undofile
endif
""""""""""" DONE MESSING AROUND WITH DIRECTORIES """"""""""""

"autocmd BufReadPost,BufReadPost *.mod,*.dat set filetype=ampl

" Make Vim get Alt- keybindings even when invoked in terminal
" Think this breaks macros...
"let c='a'
"while c <= 'z'
"  exec "set <A-".c.">=\e".c
"  exec "imap \e".c." <A-".c.">"
"  let c = nr2char(1+char2nr(c))
"endw
"set timeout ttimeoutlen=50

"Latex Indentation rules defined in /usr/share/vim/vim74/indent/tex.vim
" Make items in enumerate etc indent nicely
"let g:tex_indent_items = 0
" Don't jump on me everytime I write {
"let g:tex_indent_brace = 0
" Don't try do indent my columns
"let g:tex_indent_and = 0

" Increase numbers by 0, 1, 2, ...
function! Incr()
  let a = line('.') - line("'<")
  let c = virtcol("'<")
  if a > 0
    execute 'normal! '.c.'|'.a."\<C-a>"
  endif
  normal `<
endfunction
" Think Ascendning
vnoremap <C-a> :call Incr()<CR>

" Tab shortcut
"inoremap <S-Tab> <C-V><Tab>

" Often type spit when I mean split. This autocorrects for me
cnoreabbrev spit split
cnoreabbrev spilt split
cnoreabbrev vspilt vsplit
cnoreabbrev hspilt hsplit
" Also gerp
" cnoreabbrev gerp grep

" For hyphened lists
" - like
" - this
" The b stipulates that there must be a blank after the hyphen
set com=b:-

" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * highlight ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\s\+$/

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" color torte
" color vividchalk
" color peachpuff
color morning
"color delek

" Use colors to signify if we're in insert mode or nor
au InsertEnter * hi StatusLine ctermfg=Red
au InsertLeave * hi StatusLine ctermfg=Blue
hi StatusLine ctermfg=Blue

" Underline and overline characters
" modify selected text using combining diacritics
command! -range -nargs=0 Overline        call s:CombineSelection(<line1>, <line2>, '0305')
command! -range -nargs=0 Underline       call s:CombineSelection(<line1>, <line2>, '0332')
command! -range -nargs=0 DoubleUnderline call s:CombineSelection(<line1>, <line2>, '0333')
command! -range -nargs=0 Strikethrough   call s:CombineSelection(<line1>, <line2>, '0336')

function! s:CombineSelection(line1, line2, cp)
  execute 'let char = "\u'.a:cp.'"'
  execute a:line1.','.a:line2.'s/\%V[^[:cntrl:]]/&'.char.'/ge'
endfunction

" Search for word under cursor
"nnoremap <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

" Gives lvim a default lvim search word under cursor
cabbrev lvim
      \ noautocmd lvim /\<lt><C-R><C-W>\>/gj
      \ **/*<C-R>=(expand("%:e")=="" ? "" : ".".expand("%:e"))<CR>
      \ <Bar> lw
      \ <C-Left><C-Left><C-Left>

" Same, but includes C-relevant files only in the search
cabbrev cgw
      \ noautocmd lvim /\<lt><C-R><C-W>\>/gj
      \ **/*.h **/*.c **/*.cpp
      \ <Bar> lw
      \ <C-Left><C-Left><C-Left><C-Left><C-Left><C-Left>

" Use last search pattern instead of word under cursor
" Avoids error when on empty line and stuff
cabbrev cgr
      \ noautocmd lvim /\<lt><C-R>/\>/gj
      \ **/*.h **/*.c **/*.cpp
      \ <Bar> lw
      \ <C-Left><C-Left><C-Left><C-Left><C-Left><C-Left>

" Make use of the jumps list
function! GotoJump()
  jumps
  let j = input("Please select your jump: ")
  if j != ''
    let pattern = '\v\c^\+'
    if j =~ pattern
      let j = substitute(j, pattern, '', 'g')
      execute "normal " . j . "\<c-i>"
    else
      execute "normal " . j . "\<c-o>"
    endif
  endif
endfunction

nmap <C-h> :call GotoJump()<CR>

set cscoperelative
set nocscopeverbose
"cs add ~/eclipse-workspace/RepRapFirmware/src/cscope.out
"cs add ~/eclipse-workspace/CoreNG/variants/duetNG/cscope.out
"cs add ~/eclipse-workspace/CoreNG/cscope.out
set cscopeverbose
" cscope_maps.vim plugin has the following remaps that don't work
"nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
"nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
"nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
"nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
"nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
"nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
"nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
"nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
" I really care only about the c one for now

nmap <C-l> :cs find c <C-R>=expand("<cword>")<CR><CR>

" Jump between c++ and h++ files with F4
map <F4> :e %:p:s,.h++$,.X123X,:s,.c++$,.h++,:s,.X123X$,.c++,<CR>
" Jump between cpp and h files with F4
" map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>


set path+=**
set wildmenu
set wildmode=longest:full

let mapleader = " "

autocmd VimLeave * call system("xsel -ib", getreg('+'))

if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

"" Use <leader> then s to search for files
let g:ctrlp_map = '<leader>s'

call plug#begin('~/.vim/bundle')

"Plug 'mckellygit/vim-rtags'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rust-lang/rust.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'cespare/vim-toml', { 'branch': 'main' }
Plug 'tpope/vim-fugitive'

au FocusLost * :wa

call plug#end()


" Tab completion with rust coc
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Jumping around with rust coc
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gp <Plug>(coc-diagnostic-prev)
nmap <silent> gn <Plug>(coc-diagnostic-next)
" Use gk to show documentation in preview window.
nnoremap <silent> gk :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')
nmap <leader>rr <Plug>(coc-rename)

nnoremap <silent> <leader>? :call CocAction('diagnosticInfo') <CR>
nnoremap <silent> <leader>a :call CocAction('diagnosticRefresh') <CR>
nnoremap <silent> <leader>q :call CocAction('diagnosticToggleBuffer') <CR>

"augroup mygroup
"  autocmd!
"  " Setup formatexpr specified filetype(s).
"  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"  " Update signature help on jump placeholder.
"  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
"augroup end

" Formatting selected code.
"xmap ä  <Plug>(coc-format-selected)
"nmap ä  <Plug>(coc-format-selected)

hi MatchParen cterm=bold ctermbg=none ctermfg=red

map <leader>t :RustTest<cr>

compiler cargo
map <leader>! :make run<cr>

inoremap <S-Tab> <C-V><Tab>

" Removes weird characters >4;2m
" See https://stackoverflow.com/questions/62148994/strange-character-since-last-update-42m-in-vim
let &t_TI = ""
let &t_TE = ""

"let g:node_client_debug = 1
"let $NODE_CLIENT_LOG_FILE = '/home/torbjorn/.vim/coc-logfile'

" Things I needed to do to get ra-multiplex working:
"  - Upgrade to vim9
"  - rustup default nightly
"  - rustup component add rust-analyzer
"  - ln -s /home/torbjorn/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/bin/rust-analyzer rust-analyzer
"  - Inside vim: CocInstall coc-rust-analyzer
"  - git clone --depth 1 https://github.com/pr2502/ra-multiplex.git
"  - cd ra-multiplex; cargo build --release
"  - mkdir ~/.config/ra-multiplex/
"  - fill some defaults into ~/.config/ra-multiplex/config.toml. See github.com/pr2502/ra-multiplex for example
"  - in .vim/coc-setting.json add: "rust-analyzer.serverPath": "/home/torbjorn/GithubRepos/ra-multiplex/target/release/ra-multiplex",
"  - Among startup applications add /home/torbjorn/GithubRepos/ra-multiplex/target/release/ra-multiplex-server
" Easy as pie!
"
" Then, it won't work with new files that aren't saved to disk. That will make coc crash.
" So do :CocRestart if that happens...
