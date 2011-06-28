if exists("loaded_sh_header")
	finish
endif

let loaded_sh_header = 1

function SH_Header()
	call append(0, "#!/bin/sh")
	call append(1, "#")
	call append(2, "# {app} - {purpose, description}")
	call append(3, "#")
	call append(4, "# Copyright (c) 2005-2006 Rack-Soft, LLC. All rights reserved.")
	call append(5, "#")
	call append(6, "# \$Header\$")
	call append(7, "#")
	call append(8, "# Modified: $DateTime$ by $Author$ with $Change$")
	call append(9, "#")
	call append(10, "")
	call append(11, "")
endfunction

au BufNewFile *.sh :call SH_Header()
