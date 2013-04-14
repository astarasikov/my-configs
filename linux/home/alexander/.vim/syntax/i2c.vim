if exists("b:current_syntax")
	finish
endif

syn match iWrite /^.*b2300000.*$/
syn match iRead /^.*b230000c.*$/
syn match iStatus /^.*b2300008.*$/
hi iWrite ctermfg=red guifg=red
hi iRead ctermfg=cyan guifg=cyan
hi iStatus ctermfg=yellow guifg=yellow


let b:current_syntax = "i2c"
