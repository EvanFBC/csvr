require 'thor'

module CSVR

	class CLI < Thor 

		desc "api", "details use of CSVR"
		def api 
 			puts "csvr = CSVR.open('path/to/file')"
			puts "csvr.create('db_name', 'table_name')"
			puts "(optional) csvr.headers = ['array','of','custom', 'headers]"
			puts "(optional) csvr.rows = ['array', 'of' 'strings' 'to' 'parse']"
		end
	end

end