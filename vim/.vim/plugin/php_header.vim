if exists("loaded_php_header")
	finish
endif

let loaded_php_header = 1

function PHP_Header()
	call append(0, "<?php")
	call append(1, "/*")
	call append(2, " * {App} - {purpose, description}")
	call append(3, " *")
	call append(4, " * \$Header\$")
	call append(5, " */")
	call append(6, "")
	call append(7, "")
	call append(8, "")
	
	exe "normal \<UP>\<UP>\<UP>\<UP>\<UP>\<HOME>"
endfunction

au BufNewFile *.php :call PHP_Header()
