call plug#begin()
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'git@github.com:tpope/vim-fugitive.git'
Plug 'git@github.com:airblade/vim-gitgutter.git'
Plug 'git@github.com:Raimondi/delimitMate.git'
Plug 'rcarriga/nvim-notify'
"Plug 'phpactor/phpactor'
call plug#end()

syntax on
colorscheme tokyonight
filetype plugin indent on

set number
set showmatch
set termguicolors
set expandtab
set autoindent
set cursorline
set noswapfile
set hlsearch
set incsearch
set tabstop=2
set softtabstop=2
set shiftwidth=2
set mouse=a
set wildmode=longest,list
set clipboard=unnamedplus
set updatetime=200

"let g:typescript_compiler_binary = 'tsc'
"let g:typescript_compiler_options = ''

let g:coc_global_extensions=['coc-tsserver', 'coc-json', 'coc-html', 'coc-eslint', 'coc-prettier']
"coc-phpactor @yaegassy/coc-intelephense

let g:gitgutter_enabled=1
let g:gitgutter_highlight_lines=0
let g:gitgutter_highlight_linenrs=1

let g:delimitMate_expand_cr=2
let g:delimitMate_expand_space=1

hi GitGutterAdd    ctermfg=2 guifg=#50DC7E
hi GitGutterChange ctermfg=3 guifg=#F7BD5A
hi GitGutterDelete ctermfg=1 guifg=#F77B5A

hi link GitGutterAddLineNr Bold
hi link GitGutterChangeLineNr Bold
hi link GitGutterDeleteLineNr Bold
hi link GitGutterChangeDeleteLineNr Bold

"nnoremap <C-Left>  :tabprevious<CR>
"nnoremap <C-Right> :tabnext<CR>

nnoremap <C-Left>  :bp<CR>
nnoremap <C-Right> :bn<CR>

nnoremap <C-t> :tabnew .<CR>
nnoremap <C-c> :tabclose!<CR>
nnoremap <C-b> :vi .<CR>
nnoremap <C-x> :bdelete<CR>
nnoremap <C-X> :bdelete!<CR>

source ~/.config/nvim/plugins/statusline.vim
source ~/.config/nvim/plugins/tabline.vim
source ~/.config/nvim/plugins/notification.vim




