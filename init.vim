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
Plug 'git@github.com:Yggdroot/indentLine.git'
Plug 'neovim/nvim-lspconfig'
Plug 'SmiteshP/nvim-navic'

Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

Plug 'norcalli/nvim-colorizer.lua'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
"Plug 'glepnir/dashboard-nvim'
Plug 'goolord/alpha-nvim'
"Plug 'startup-nvim/startup.nvim'

Plug 'git@github.com:nvim-telescope/telescope-project.nvim.git'
Plug 'petertriho/nvim-scrollbar'
Plug 'karb94/neoscroll.nvim'

Plug 'nvim-treesitter/nvim-treesitter'
"Plug 'SmiteshP/nvim-gps'
"Plug 'phpactor/phpactor'
call plug#end()

let g:indentLine_defaultGroup = 'SpecialKey'
let g:indentLine_concealcursor='inc'
let g:indentLine_conceallevel=2
let g:indentLine_enabled = 1
let g:indentLine_char = 'c'
let g:indentLine_char_list = ['▏', '|', '¦', '┆', '┊']

let g:tokyonight_italic_comments=1
let g:tokyonight_italic_keywords=1
let g:tokyonight_italic_functions=1
let g:tokyonight_italic_variables=1

"let g:typescript_compiler_binary = 'tsc'
"let g:typescript_compiler_options = ''

let g:coc_global_extensions=['coc-tsserver', 'coc-json', 'coc-html', 'coc-eslint', 'coc-prettier', 'coc-vimlsp']
"coc-phpactor @yaegassy/coc-intelephense

let g:gitgutter_enabled=1
let g:gitgutter_highlight_lines=0
let g:gitgutter_highlight_linenrs=1

let g:delimitMate_expand_cr=2
let g:delimitMate_expand_space=1

let g:loaded_node_provider=0
let g:loaded_python3_provider=0

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
set showcmd
set nomodeline
set tabstop=2
set softtabstop=2
set shiftwidth=2
set mouse=a
set wildmode=longest,list
set clipboard=unnamedplus
set updatetime=200

lua <<EOF
local colorizer = require("colorizer").setup()
local navic = require("nvim-navic").setup()

require("lspconfig").clangd.setup {
  on_attach = function(client, bufnr)
    navic.attach(client, bufnr)
  end
}

--require("startup").setup()
EOF

hi GitGutterAdd    ctermfg=2 guifg=#50DC7E
hi GitGutterChange ctermfg=3 guifg=#F7BD5A
hi GitGutterDelete ctermfg=1 guifg=#F77B5A

hi link GitGutterAddLineNr Bold
hi link GitGutterChangeLineNr Bold
hi link GitGutterDeleteLineNr Bold
hi link GitGutterChangeDeleteLineNr Bold

highlight TelescopeSelection      guifg=#FEFFFA gui=bold
highlight TelescopeSelectionCaret guifg=#FEFFFA gui=bold
highlight TelescopeMultiSelection guifg=#928374
highlight TelescopeNormal         guibg=#282a36
highlight TelescopeBorder         guifg=#eff0eb
highlight TelescopePromptBorder   guifg=#eff0eb
highlight TelescopeResultsBorder  guifg=#eff0eb
highlight TelescopePreviewBorder  guifg=#eff0eb
highlight TelescopeMatching       guifg=#D79921 gui=bold
highlight TelescopePromptPrefix   guifg=#5af78e

"nnoremap <C-Left>  :tabprevious<CR>
"nnoremap <C-Right> :tabnext<CR>

nnoremap <C-Left>  :bp<CR>
nnoremap <C-Right> :bn<CR>
nnoremap <C-t> :tabnew .<CR>
nnoremap <C-c> :tabclose!<CR>
nnoremap <C-x> :bdelete!<CR>
nnoremap tr :NvimTreeToggle<CR>
nnoremap ff :Telescope find_files<CR>
nnoremap fg :Telescope live_grep<CR>
nnoremap fb :Telescope buffers<CR>
nnoremap fh :Telescope help_tags<CR>
nnoremap qq :q<CR>

source ~/.config/nvim/plugins/statusline.vim
source ~/.config/nvim/plugins/tabline.vim
source ~/.config/nvim/plugins/notification.vim
source ~/.config/nvim/plugins/tree.lua
"source ~/.config/nvim/plugins/dashboard.lua
source ~/.config/nvim/plugins/alpha.lua
"source ~/.config/nvim/plugins/startup.lua
source ~/.config/nvim/plugins/telescope.lua
source ~/.config/nvim/plugins/scrollbar.lua
source ~/.config/nvim/plugins/neoscroll.lua

