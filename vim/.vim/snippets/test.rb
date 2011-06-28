#!/usr/bin/ruby
file = ARGV[0]
begin
	if File.symlink?(file)
		puts File.readlink(file)
	else
		puts file
	end
rescue => e
	puts "EROARE: " + e
ensure
	puts "done"
end
