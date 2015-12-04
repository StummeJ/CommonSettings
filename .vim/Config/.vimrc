" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle plugins
"'Themes
Plugin 'mhumeSF/one-dark.vim'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'xero/sourcerer.vim'
"'Plugins
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'mhinz/vim-signify'
Plugin 'suan/vim-instant-markdown'

" Vundle load plugins
call vundle#end()
filetype plugin indent on

" Setup airline 
let g:airline_powerline_fonts = 1
let g:airline_theme='PaperColor'
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enable = 1
let g:airline#extensions#branch#format = 1

" Setup signify
let g:signify_vcs_list = [ 'git', 'hg' ]
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'
let g:signify_sign_changedelete      = g:signify_sign_change

" Setup instant markdown
let g:instant_markdown_autostart = 1

" English spell check
"setlocal spell spelllang=en_us

" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

" Set theme
set background=dark
colorscheme PaperColor
 
" Use powerline font
set guifont=Meslo\ LG\ S\ Regular\ for\ Powerline

" Line too long column
if exists("&colorcolumn")
  set colorcolumn=96
  highlight ColorColumn ctermbg=233
endif

" Enable line numbers
set number

" Enable syntax highlighting
syntax on

" Signify colors
"let g:signify_sign_color_guifg_add      = '#87ff5f'
"let g:signify_sign_color_guifg_delete   = '#d75f5f'
"let g:signify_sign_color_guifg_change   = '#ffff5f'
"let g:signify_sign_color_guibg          = 'none'
"let g:signify_sign_color_ctermfg_add    = 119
"let g:signify_sign_color_ctermfg_delete = 167
"let g:signify_sign_color_ctermfg_change = 227
"let g:signify_sign_color_ctermbg        = 'none'

" highlight lines in Sy and vimdiff etc
"119=87ff5f, 167=d75f5f, 227=ffff5f
"highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
"highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
"highlight DiffChange        cterm=bold ctermbg=none ctermfg=227

" highlight signs in Sy
highlight SignifySignAdd    cterm=bold ctermbg=none  ctermfg=119 gui=bold guibg=none guifg=#87ff5f
highlight SignifySignDelete cterm=bold ctermbg=none  ctermfg=167 gui=bold guibg=none guifg=#d75f5f
highlight SignifySignChange cterm=bold ctermbg=none  ctermfg=227 gui=bold guibg=none guifg=#ffff5f

