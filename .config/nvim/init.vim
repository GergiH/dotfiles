set langmenu=en_US
let $LANG = 'en_US'
set columns=184 lines=46
set colorcolumn=100
set guifont=JetBrains\ Mono:h11
"set guifont=Roboto\ Mono:h11
"set guifont=Go\ Mono:h10
"set guifont=Fira\ Code:h11
"set guifont=Cascadia\ Code\ PL:h10
"set guifont=Hack:h9

call plug#begin("~/.vim/plugged")
  " Plugin Section
  Plug 'dracula/vim'
  Plug 'morhetz/gruvbox'
  Plug 'lifepillar/vim-gruvbox8'
  Plug 'rakr/vim-one'
  Plug 'pgavlin/pulumi.vim'
  Plug 'arcticicestudio/nord-vim'
  Plug 'lifepillar/vim-solarized8'
  Plug 'sonph/onehalf'
  Plug 'sainnhe/sonokai'
  Plug 'vim-airline/vim-airline'
  Plug 'scrooloose/nerdtree'
  Plug 'scrooloose/nerdcommenter'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'ryanoasis/vim-devicons'
  Plug 'airblade/vim-gitgutter'
  Plug 'sbdchd/neoformat'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver', 'coc-pairs']
call plug#end()

"Config Section
set tabstop=2                           " Insert 2 spaces for a tab
set shiftwidth=2                        " Change the number of space characters inserted for indentation
set expandtab                           " Converts tab characters to spaces
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set number                              " Line numbers
set cursorline                          " Enable highlighting of the current line
set relativenumber                      " Relative line numbers
set mouse=a                             " Mouse selection won't include line numbers and such

"set background=light                    " light mode for gruvbox, dark is default
if (has("termguicolors"))
 set termguicolors
endif
syntax enable
colorscheme sonokai
"colorscheme one
"colorscheme gruvbox8_hard
"colorscheme nord
"colorscheme solarized8
"colorscheme onehalflight

let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nmap <F2> :NERDTreeToggle<CR>

" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://bash
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" custom mappings
nmap <C-o> <plug>NERDCommenterToggle
vmap <C-o> <plug>NERDCommenterToggle
nmap <C-m> :Neoformat<CR>

nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

let $FZF_DEFAULT_COMMAND = 'ag -g ""'
