if exists("loaded_c_header")
	finish
endif

let loaded_c_header = 1

function C_Header()
	
	call append(0, "/*")
	call append(1, " * <App> - <purpose, description>")
	call append(2, " *")
	call append(3, " * Copyright (c) 2011 Florin Mihalache. All rights reserved.")
	call append(4, " *")
	call append(5, " * \$Header\$")
	call append(6, " * \$History\$")
	call append(7, " */")
	call append(8, "")
	call append(9, "/* vim: set ts=4 sw=4 noexpandtab: */")
	
endfunction

au BufNewFile *.[ch] :call C_Header()
