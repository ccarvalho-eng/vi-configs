" -- General Settings --
set nocompatible              " Be iMproved, required
filetype off                  " required for Vundle
set encoding=utf-8            " Set default encoding to UTF-8
set number                    " Show line numbers
set relativenumber            " Show relative line numbers
set hidden                    " Allow buffer switching without saving
set clipboard=unnamed         " Use system clipboard
set backspace=indent,eol,start " Make backspace work as you would expect
set noswapfile                " Disable swap files
set nobackup                  " Disable backups
set nowritebackup             " Disable write backups

" -- Performance Optimizations --
set lazyredraw                " Don't redraw while executing macros
set ttyfast                   " Faster redrawing
set updatetime=300            " Faster completion
set timeoutlen=500            " By default timeoutlen is 1000 ms

" -- UI Config --
set termguicolors             " Enable true colors support
syntax enable                 " Enable syntax highlighting
set cursorline                " Highlight current line
set wildmenu                  " Visual autocomplete for command menu
set wildmode=list:longest,full " Complete files like a shell
set showmatch                 " Highlight matching [{()}]
set colorcolumn=80            " Show vertical line at column 80

" -- Spaces & Tabs --
set expandtab                 " Tabs are spaces, not tabs
set tabstop=2                 " Number of spaces that a <Tab> counts for
set shiftwidth=2              " Number of spaces to use for each step of (auto)indent
set softtabstop=2             " Number of spaces that a <Tab> counts for while performing editing operations
set autoindent                " Copy indent from current line when starting a new line
set smartindent               " Do smart autoindenting when starting a new line

" -- Searching --
set incsearch                 " Show search matches as you type
set hlsearch                  " Highlight all matches
set ignorecase                " Ignore case when searching
set smartcase                 " When searching try to be smart about cases

" -- Folding --
set foldenable                " Enable folding
set foldlevelstart=10         " Open most folds by default
set foldnestmax=10            " 10 nested fold max
set foldmethod=indent         " Fold based on indent level

" -- Movement --
" Move vertically by visual line
nnoremap j gj
nnoremap k gk

" -- Plugin Management --
" Auto-install vim-plug if not present
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
  " Existing plugins
  Plug 'mhinz/vim-startify'
  Plug 'github/copilot.vim'
  Plug 'elixir-editors/vim-elixir'
  Plug 'mhinz/vim-mix-format'
  Plug 'dense-analysis/ale'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'amiralies/coc-elixir', {'do': 'yarn install && yarn prepack'}
  Plug 'vim-test/vim-test'
  Plug 'kassio/neoterm'
  Plug 'preservim/nerdtree'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'kdheepak/lazygit.nvim'
  Plug 'junegunn/gv.vim'
  Plug 'tpope/vim-rhubarb'
  Plug 'airblade/vim-gitgutter'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'tpope/vim-commentary'
  Plug 'vim-erlang/vim-erlang-runtime'
  Plug 'vim-erlang/vim-erlang-compiler'
  Plug 'vim-erlang/vim-erlang-omnicomplete'
  Plug 'rust-lang/rust.vim'
  Plug 'gleam-lang/gleam.vim'
  Plug 'vim-python/python-syntax'
  Plug 'Vimjas/vim-python-pep8-indent'
  Plug 'kovisoft/slimv'
  Plug 'prabirshrestha/vim-lsp'
  Plug 'mattn/vim-lsp-settings'
  Plug 'joshdick/onedark.vim'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'ryanoasis/vim-devicons'
  
  " Additional useful plugins
  Plug 'tpope/vim-surround'               " Easily delete, change and add surroundings in pairs
  Plug 'tpope/vim-repeat'                 " Enable repeating supported plugin maps with '.'
  Plug 'jiangmiao/auto-pairs'             " Insert or delete brackets, parens, quotes in pair
  Plug 'alvan/vim-closetag'               " Auto close HTML tags
  Plug 'easymotion/vim-easymotion'        " Vim motions on speed
  Plug 'terryma/vim-multiple-cursors'     " Multiple selections for Vim
  Plug 'mbbill/undotree'                  " Visualize undo history
  Plug 'vimwiki/vimwiki'                  " Personal Wiki for Vim
  Plug 'junegunn/goyo.vim'                " Distraction-free writing in Vim
  Plug 'junegunn/limelight.vim'           " Hyperfocus-writing in Vim
call plug#end()

" -- Leader Shortcuts --
let mapleader = "\<Space>"    " Set leader key to space
nnoremap <leader>w :w<CR>     " Quick save
nnoremap <leader>q :q<CR>     " Quick quit

" Clear search highlight with Escape key
nnoremap <silent> <Esc> :noh<CR><Esc>

" Window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Toggle NERDTree
nnoremap <leader>n :NERDTreeToggle<CR>
" Toggle Undotree
nnoremap <leader>u :UndotreeToggle<CR>
" Toggle Goyo
nnoremap <leader>G :Goyo<CR>

" -- Plugin Configuration --
" Startify
function! CenterAsciiArt(lines)
    let longest_line = max(map(copy(a:lines), 'strwidth(v:val)'))
    let centered_lines = map(copy(a:lines), 'repeat(" ", (&columns - strwidth(v:val)) / 2) . v:val')
    return centered_lines
endfunction

let s:ascii_art = [
      \ '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
      \ '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
      \ '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
      \ '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⠋⢿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
      \ '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⡏⠀⠘⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
      \ '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⡿⠀⠀⠀⠹⣿⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
      \ '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⣿⠃⠀⠀⠀⠀⢹⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀',
      \ '⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⠇⠀⠀⠀⠀⠀⠀⢻⣿⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀',
      \ '⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⡟⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀',
      \ '⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀',
      \ '⠀⠀⠀⠀⠀⠀⣠⣿⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣿⣿⣷⣄⠀⠀⠀⠀⠀',
      \ '⠈⣶⣦⣤⣶⣿⣿⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣿⣿⣿⣿⣷⣶⣾⠇',
      \ '⠀⢻⣿⣿⣿⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣿⣿⣿⣿⣿⣿⠀',
      \ '⠀⣼⣿⣿⣿⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿⣿⣿⣿⣿⠀',
      \ '⠀⠛⠻⢿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⣿⣿⡿⠟⠛⠃',
      \ '⠀⠀⠀⠀⠙⠿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⡿⠋⠀⠀⠀⠀',
      \ '⠀⠀⠑⠄⡀⠀⠈⠙⠳⢦⣀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡠⠶⠋⠁⠀⢀⡠⠊⠀⠀',
      \ '⠀⠀⠀⠀⠈⠒⢤⣀⠀⠀⠀⠁⠀⠀⣠⣄⠀⠀⠀⠀⠀⠀⣀⡤⠒⠁⠀⠀⠀⠀',
      \ '⠀⠀⠀⠀⠀⠀⠀⠈⠉⠛⠷⠶⢶⣿⣿⣿⣿⡷⠶⠾⠛⠋⠁⠀⠀⠀⠀⠀⠀⠀',
      \ '',
      \ 'A S S A S S I N '' S   C R E E D',
      \ '',
      \ '[ Nothing is true, everything is permitted ]',
      \ '',
      \ 'Welcome to Vim, Assassin!'
      \ ]

let g:startify_custom_header = CenterAsciiArt(s:ascii_art)

function! LimitedList(type, cmd, header)
    return { 'type': a:type, 'header': a:header, 'command': a:cmd . ' | head -n5' }
endfunction

let g:startify_lists = [
      \ LimitedList('files',     'find . -type f -not -path "*/\.*" | sed "s|^./||"', ['   Recent Files']),
      \ LimitedList('dir',       'find . -mindepth 1 -maxdepth 1 -type d | sed "s|^./||"', ['   Current Directory '. getcwd()]),
      \ LimitedList('sessions',  'ls -1 ~/.vim/session', ['   Sessions']),
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']           },
      \ ]

let g:startify_padding_left = 3

let g:startify_bookmarks = [
      \ { 'c': '~/.config/nvim/init.vim' },
      \ { 'p': '~/Projects' },
      \ ]

let g:startify_session_persistence = 1
let g:startify_change_to_vcs_root = 1
let g:startify_custom_footer = CenterAsciiArt(['We Work in the Dark to Serve the Light.'])
let g:startify_custom_indices = map(range(1,100), 'string(v:val)')

function! StartifyEntryFormat()
    return 'StartifyEntryPadding() . substitute(entry_path, "\\s*$", "", "")'
endfunction

function! StartifyEntryPadding()
    return repeat(' ', g:startify_padding_left)
endfunction

highlight StartifyHeader  ctermfg=114 guifg=#87d787
highlight StartifyPath    ctermfg=245 guifg=#8a8a8a
highlight StartifyFile    ctermfg=255 guifg=#eeeeee
highlight StartifySlash   ctermfg=240 guifg=#585858

autocmd VimEnter * call matchadd('StartifyHeader', '\%1l\_.*\%29l')

let g:startify_custom_header_quotes = [
      \ map(['Recent Files', 'Current Directory '.getcwd(), 'Sessions', 'Bookmarks'],
      \ '"   ".v:val')
      \ ]

let g:startify_files_number = 5
let g:startify_session_number = 5

" GitHub Copilot settings
let g:copilot_enabled = 1

" rhubarb
nnoremap <leader>gh :.GBrowse<CR>

" CoC
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <silent> <leader>co  :<C-u>CocList outline<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" vim-test
let test#strategy = "neoterm"
let g:neoterm_default_mod = 'botright'
let g:neoterm_size = '20'
let g:neoterm_autoscroll = 1

nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" NERDTree
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>
let NERDTreeShowHidden=1      " Show hidden files in NERDTree

" Lazygit
nnoremap <silent> <leader>gg :LazyGit<CR>
let g:lazygit_floating_window_winblend = 0
let g:lazygit_floating_window_scaling_factor = 0.9
let g:lazygit_floating_window_border_chars= ['╭', '╮', '╰', '╯']
let g:lazygit_use_neovim_remote = 1

" FZF
nnoremap <C-p> :Files<CR>
nnoremap <leader>b :Buffers<CR>

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" Goyo and Limelight integration
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" ALE
let g:ale_fixers = {
  \ 'elixir': ['mix_format'],
  \ 'python': ['black']
  \ }
let g:ale_fix_on_save = 1

" -- Theme Configuration --
set background=dark
if (has("termguicolors"))
  set termguicolors
endif

syntax on
colorscheme onedark

highlight Comment cterm=italic

let g:airline_theme='onedark'

" -- Language-specific settings --

" Elixir
autocmd FileType elixir setlocal commentstring=#\ %s
autocmd FileType elixir setlocal shiftwidth=2 tabstop=2 softtabstop=2
let g:mix_format_on_save = 1

" Append a debug function to the end of a line
nnoremap <leader>d A \|> dbg()<Esc>

" Erlang
autocmd BufRead,BufNewFile *.erl,*.hrl setfiletype erlang
let g:erlang_show_errors = 1

" Rust
let g:rustfmt_autosave = 1
autocmd FileType rust setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4

" Gleam
autocmd BufRead,BufNewFile *.gleam setfiletype gleam
autocmd FileType gleam setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" Python
let g:python_highlight_all = 1
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType python setlocal autoindent fileformat=unix

" Lisp
let g:slimv_swank_cmd = '! xterm -e sbcl --load ~/.vim/slime/start-swank.lisp &'
autocmd FileType lisp setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" LSP configuration
if executable('pyls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'allowlist': ['python'],
        \ })
endif

if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'stable', 'rls']},
        \ 'workspace_config': {'rust': {'clippy_preference': 'on'}},
        \ 'allowlist': ['rust'],
        \ })
endif

" Key mappings for LSP
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
endfunction

augroup lsp_install
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=green guibg=green
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Add a shortcut to copy the current file path
nnoremap <leader>cp :let @+=expand("%:p")<CR>

" Configure CoC for Elixir
let g:coc_global_extensions = ['coc-elixir']

" -- Language-specific Shortcuts --

" Add a mapping for quick Elixir documentation lookup
nnoremap <silent> <leader>k :call CocActionAsync('doHover')<CR>

" Elixir
nnoremap <leader>md :!mix dialyzer<CR>
nnoremap <leader>mc :!mix credo<CR>
nnoremap <leader>mcs :!mix credo --strict<CR>
nnoremap <leader>mu :!mix deps.get<CR>
nnoremap <leader>mc :!mix compile<CR>
nnoremap <leader>mx :call RunCustomMixTask()<CR>
nnoremap <leader>ms :call SwitchTestImplementation()<CR>
nnoremap <leader>mf :!mix format %<CR>
nnoremap <leader>mi :terminal iex -S mix<CR>

function! RunCustomMixTask()
  let task = input('Enter mix task: ')
  if !empty(task)
    execute '!mix ' . task
  endif
endfunction

function! SwitchTestImplementation()
  let current_file = expand('%')
  if current_file =~ '_test\.exs$'
    let target_file = substitute(current_file, '/test/', '/lib/', '')
    let target_file = substitute(target_file, '_test\.exs$', '.ex', '')
  elseif current_file =~ '\.ex$'
    let target_file = substitute(current_file, '/lib/', '/test/', '')
    let target_file = substitute(target_file, '\.ex$', '_test.exs', '')
  else
    echo "Not in a recognized Elixir file"
    return
  endif
  if filereadable(target_file)
    execute 'edit ' . target_file
  else
    echo "Target file not found: " . target_file
  endif
endfunction

" Erlang
nnoremap <leader>ec :!erlc %<CR>
nnoremap <leader>er :!erl -noshell -s $(basename % .erl) start -s init stop<CR>

" Rust
nnoremap <leader>rr :RustRun<CR>
nnoremap <leader>rt :RustTest<CR>

" Gleam
nnoremap <leader>gr :!gleam run<CR>
nnoremap <leader>gt :!gleam test<CR>

" Python
nnoremap <leader>pr :!python %<CR>

" Lisp
nnoremap <leader>le :Eval<CR>
nnoremap <leader>lc :Call<CR>

" -- Custom Functions --
" Toggle between number and relativenumber
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

nnoremap <leader>r :call ToggleNumber()<CR>

" -- Auto Commands --
" Automatically source the Vimrc file on save.
augroup autosourcing
    autocmd!
    autocmd BufWritePost $MYVIMRC source %
augroup END

" -- Final Setup --
filetype plugin indent on    " Required
syntax on                    " Enable syntax highlighting
