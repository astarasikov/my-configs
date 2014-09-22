augroup promela
au!
au! BufNewFile,BufRead *.promela,*.prm,*.pml set filetype=promela
augroup END

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

augroup nu
au!
au! BufRead *.nu set filetype=lisp
augroup END
