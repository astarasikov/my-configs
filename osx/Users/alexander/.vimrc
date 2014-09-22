set nocompatible

" VUNDLE =====================================================================
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()
Plugin 'gmarik/vundle'
Plugin 'majutsushi/tagbar'
Plugin 'FuzzyFinder'
Plugin 'L9'
Plugin 'bling/vim-airline'
Plugin 'valloric/YouCompleteMe'
Plugin 'oblitum/rainbow'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-surround'
Plugin 'airblade/vim-gitgutter'

call vundle#end()
" VUNDLE END

filetype on
filetype plugin on
filetype plugin indent on
syntax on

set smarttab
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent

set t_Co=256
set noswapfile
set nobackup
set number
set nocp
set hlsearch
set hls is
set ws
set colorcolumn=80
set mouse=a
set ttyfast
set lazyredraw
set synmaxcol=150
set laststatus=2
set novisualbell
set noerrorbells
set t_vb=

" Fonts
set guifont=UbuntuMono\ 13
colorscheme my
if has("gui_running")
	set guioptions -=m
	set guioptions -=T
	set guioptions -=r
	colorscheme delek
	hi Search guibg=Orange
	hi Search guifg=Black
else
	colorscheme zellner
	hi Search ctermbg=red
	hi Search ctermfg=white
endif

au FileType c,cpp,objc,objcpp call rainbow#load()

" AIRLINE
let g:airline_theme='powerlineish'

" TagBar
let g:tagbar_left=1
let g:tagbar_width=30

" Misc
let g:rainbow_active=1
let g:syntastic_enable_balloons = 1
let g:syntastic_enable_highlighting = 1

" YCM
let g:ycm_global_ycm_extra_conf='~/.vim/plugin_conf/ycm_extra_conf.py'
nnoremap <leader>d :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>e :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Key Mappings
map <F5> :wa<ENTER>:make<ENTER>
map <F1> :NERDTree<ENTER>
map <F2> :bp<ENTER>
map <F3> :bn<ENTER>
map <F4> :bd<ENTER>
map <F6> :vsp<ENTER>
map <F7> :sp<ENTER>
map <F9> :make run<ENTER>
map <F10> :TagbarToggle<ENTER>
map <F11> :set foldmethod=syntax<ENTER>
map <F12> :PluginInstall!<ENTER>

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

function MyCD()
	if bufname("") !~ "(^\[A-Za-z0-9\]*://)\{1}"
		lcd %:p:h
	endif
endfunction
autocmd BufEnter * call MyCD()

" Custom file types
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_bufer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
highlight Pmenu ctermbg=238 gui=bold

