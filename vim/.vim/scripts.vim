
if getline(1) =~ '^# A Perforce '
	setfiletype perforce
endif

if &filetype == "xml"
	set ts=2
	set sw=2
endif
