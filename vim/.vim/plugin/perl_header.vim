if exists("loaded_perl_header")
	finish
endif

let loaded_perl_header = 1

function Perl_Header()
	
	call append(0, "#!/usr/bin/perl")
	call append(1, "# {app} - {purpose, description}")
	call append(2, "#")
	call append(3, "# Copyright (c) 2011 Florin Mihalache. All rights reserved.")
	call append(4, "#")
	call append(5, "# \$Header\$")
	call append(6, "#")
	call append(7, "# \$History\$")
	call append(8, "#")
	call append(9, "")
	call append(10, "")
	
endfunction

au BufNewFile *.pl :call Perl_Header()
