call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'sbdchd/neoformat'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'nickaroot/vim-xcode-dark-theme'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'haishanh/night-owl.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'owickstrom/vim-colors-paramount'

call plug#end()

:autocmd InsertEnter * set cul
:autocmd InsertLeave * set nocul

noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>

set encoding=UTF-8
set nocompatible
set noerrorbells
set exrc
set expandtab 
set mouse=a
set tabstop=2
set shiftwidth=2
set softtabstop=2 
set noeb vb t_vb=
set relativenumber

set smartindent
set smarttab
set autoindent
set cindent
 
set showcmd
set number
set autowrite
set autoread
set wrap
set incsearch  
set noswapfile
set smartcase 
syntax on
set clipboard=unnamedplus
syntax enable
filetype plugin on 


if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

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
"""
let g:NERDTreeIgnore = ['^node_modules$']
let g:NERDTreeShowHidden=1
let g:webdevicons_enable_airline_statusline = 1

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"""
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes
set cmdheight=1

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <c-space> coc#refresh()

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <F2> <Plug>(coc-rename)

""" prettier 
autocmd BufWritePre *.js Neoformat

"""
" file search 
nnoremap <expr> <C-p> (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<cr>"


let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }

" nmap <C-p> :Files<CR>
" let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

""" ::: THEME ::: 


if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

if (has("termguicolors"))
 set termguicolors
endif

let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_italic=1
let g:gruvbox_invert_selection='0'
colorscheme gruvbox
set background=dark
let g:lightline = {'colorscheme' : 'gruvbox'}

" colorscheme nord

" set background=dark
" colorscheme palenight
" let g:lightline = { 'colorscheme': 'palenight' }
" colorscheme xcode_dark
" set background=dark
" colorscheme paramount
" colorscheme night-owl
" let g:lightline = {'colorscheme' : 'gruvbox'}


"
"""leader
let mapleader = " "

""" KEYBINDINGS
nmap <C-b> :NERDTreeToggle<CR>
imap <C-b> <ESC>:NERDTreeToggle<CR>
nmap <A-a> m<CR>
nmap <C-\> <C-^>
imap <C-\> <ESC> <C-^>
vnoremap <C-c> "*y :let @+=@*<CR> 
map <C-v> "+p
map <C-S-v> "+P
map <c-i> :tabn<CR>
noremap <leader>/ :Commentary<cr>

""" c++ special

nmap <F9> :!g++ %<CR>
imap <F9> <ESC>:w<CR>:!g++ %
nmap <F8> :!./a.out<CR>

""" cursor line (|) on insert mode :)
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" Optionally reset the cursor on start:
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END
