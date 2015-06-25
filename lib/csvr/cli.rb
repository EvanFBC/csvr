require 'thor'

module CSVR

	class CLI < Thor 

		desc "api", "details use of CSVR"
		def api 

			outputs = []
			outputs << "\t require 'csvr' "
 			outputs << "\tcsvr = CSVR.open('path/to/file')"
 			outputs << "\t(optional) csvr.headers = ['array','of','custom', 'headers]"
			outputs << "\t(optional) csvr.filters = ['array', 'of' 'strings' 'to' 'parse']"
			outputs << "\tcsvr.create('db_name', 'table_name')"

			outputs.each { |x| puts x }

		end
	end

end