if exists("loaded_comment_helper")
	finish
endif

let loaded_comment_helper = 1


" Comment line
function Comment_line()
	let s:line = getline(line("."))
	
	let s:mx = '^[ ]\+/*\(.\*\)*/[ ]\+$'
	let s:mtch = matchstr(s:line, s:mx)

	if s:mtch != ''
		let s:nocomment = substitute(s:mtch, s:mx, '\1', '')
		call setline(line("."), s:nocomment)
	else
		call setline(line("."), "/* " . s:line . " */")
	endif
	
endfunction


" Mappings
map <Leader>k :call Comment_line()<CR>
