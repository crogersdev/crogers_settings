" Pathogen load
 filetype off
"
call pathogen#infect()
call pathogen#helptags()
"
execute pathogen#infect()

set number
set relativenumber
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab
set smarttab
set autoindent

filetype plugin indent on
syntax on

let mapleader=","

nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

set hlsearch
set ignorecase
set smartcase
" these aren't working on iterm2 and macvim.  not sure why.  solarized may be
" overwriting?
hi Search cterm=NONE ctermbg=yellow ctermfg=black
hi Visual cterm=NONE ctermbg=gray ctermfg=black
set cursorline
" comment/uncomment the following line to get an underline as well as a highlight
hi CursorLine gui=underline cterm=underline
set modeline

set laststatus=2

set t_Co=256
let g:solarized_termcolors=16
set background=light
colorscheme solarized
highlight SpecialKey ctermfg=11 ctermbg=8

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

set list listchars=tab:\ \ ,trail:·
set scrolloff=8
set sidescrolloff=15
set sidescroll=1

inoremap jk <esc>
inoremap <esc> <nop>

autocmd VimResized * wincmd =
set mouse=a
set linespace=0
set splitright
set backspace=indent,eol,start
set tags=./.tags;$HOME

nnoremap <C-c> :bp\|bd #<CR>
" enable the following if you want nerdtree to load on start
"autocmd vimenter * NERDTree | wincmd p
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeIgnore = ['\.pyc$']

set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map='<c-p>'
let g:ctrlp_cmd='CtrlPMixed'

function! CopyMatches(reg)
  let hits = []
  %s//\=len(add(hits, submatch(0))) ? submatch(0) : ''/gne
  let reg = empty(a:reg) ? '+' : a:reg
  execute 'let @'.reg.' = join(hits, "\n") . "\n"'
endfunction
command! -register CopyMatches call CopyMatches(<q-reg>)

nmap <F6> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>

" ---------------------------------- "
" Configure YouCompleteMe
" ---------------------------------- "
let g:ycm_server_use_vim_stdout = 0
let g:ycm_server_keep_logfiles = 1

let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string
"let g:ycm_min_num_of_chars_for_completion = 5

let g:ycm_key_list_select_completion = ['<C-j>', '<TAB>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<S-TAB>']

nnoremap <leader>y :let g:ycm_auto_trigger=0<CR>   " turn off YCM
nnoremap <leader>Y :let g:ycm_auto_trigger=1<CR>   " turn on YCM

" Goto definition with F3
map <F3> :YcmCompleter GoTo<CR>
nnoremap tq :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
nnoremap * *``

set encoding=UTF-8
" after a re-source, fix syntax matching issues (concealing brackets):
if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif

