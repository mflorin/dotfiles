if exists("loaded_c_header")
	finish
endif

let loaded_c_header = 1

function C_Header()
	
	call append(0, "/*")
	call append(1, " * Copyright (c) 2018 Florin Mihalache. All rights reserved.")
	call append(2, " *")
	call append(3, " */")
	call append(4, "")
	call append(5, "/* vim: set ts=4 sw=4 noexpandtab: */")
	
endfunction

au BufNewFile *.[ch] :call C_Header()
