if exists("loaded_sh_header")
	finish
endif

let loaded_sh_header = 1

function SH_Header()
	call append(0, "#!/usr/bin/env bash")
	call append(1, "")
	call append(2, "")
	call append(3, "")
	call append(4, "# vim: ts=2: sw=2: ai: si")
	exe 3

endfunction

au BufNewFile *.sh :call SH_Header()
