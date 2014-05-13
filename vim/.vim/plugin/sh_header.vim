if exists("loaded_sh_header")
	finish
endif

let loaded_sh_header = 1

function SH_Header()
	call append(0, "#!/bin/sh")
	call append(1, "#")
	call append(2, "# {App} - {purpose, description}")
	call append(3, "#")
	call append(4, "")
	call append(5, "")

endfunction

au BufNewFile *.sh :call SH_Header()
