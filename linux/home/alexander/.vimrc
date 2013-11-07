set nocompatible
filetype on
filetype plugin on
syntax on

set tabstop=4
set shiftwidth=4
set autoindent
set t_Co=256
set noswapfile
set nobackup
set number
set guifont=terminus
set nocp
set hlsearch
set hls is
set ws
set colorcolumn=80
set mouse=a
set ttyfast
set lazyredraw

colorscheme my
if has("gui_running")
	colorscheme delek
	hi Search guibg=Orange
	hi Search guifg=Black
else
	colorscheme zellner
	hi Search ctermbg=red
	hi Search ctermfg=white
endif

" let g:clang_debug=1
" let g:clang_complete_auto=1
" let g:clang_hl_errors=1
" let g:clang_user_options='-I/usr/include/c++/4.7 -I/usr/include/c++/4.7/i486-linux-gnu -I/usr/include/c++/4.7/backward'

map <F5> :wa<ENTER>:make<ENTER>
map <F1> :NERDTree<ENTER>
map <F2> :bp<ENTER>
map <F3> :bn<ENTER>
map <F4> :bd<ENTER>
map <F6> :vsp<ENTER>
map <F7> :sp<ENTER>

map <F9> :make run<ENTER>
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

autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_bufer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
highlight Pmenu ctermbg=238 gui=bold

augroup vala
au!
au! BufRead,BufNewFile *.vala set filetype=cs
augroup END

augroup i2c
au!
au! BufRead *.mic set filetype=i2c
augroup END

augroup fs
au!
au! BufRead *.fs set filetype=ocaml
au! BufRead *.fs set expandtab
augroup END

augroup xdc
au!
au! BufRead *.xdc set filetype=javascript
augroup END

augroup qml
au!
au! BufRead *.qml set filetype=javascript
augroup END
