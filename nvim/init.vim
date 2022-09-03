" Settings relevant only for GUI versions
"set guifont=Hack:h11
"set lines=40 columns=135

call plug#begin("~/.vim/plugged")
  " Plugin Section
  Plug 'nvim-treesitter/nvim-treesitter'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'morhetz/gruvbox'
  Plug 'arcticicestudio/nord-vim'
  Plug 'sainnhe/sonokai'
  Plug 'vim-airline/vim-airline'
  Plug 'scrooloose/nerdcommenter'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'ryanoasis/vim-devicons'
  Plug 'airblade/vim-gitgutter'
  Plug 'sbdchd/neoformat'
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
set colorcolumn=100
set relativenumber                      " Relative line numbers
set mouse=a                             " Mouse selection won't include line numbers and such

"set background=light                    " light mode for gruvbox, dark is default
if (has("termguicolors"))
 set termguicolors
endif

syntax enable

let g:sonokai_style = 'espresso'
let g:sonokai_better_performance = 1

"colorscheme gruvbox
colorscheme sonokai
"colorscheme nord

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
nmap <C-_> <plug>NERDCommenterToggle
vmap <C-_> <plug>NERDCommenterToggle
nmap <C-m> :Neoformat<CR>

" Telescope (file tree)
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
