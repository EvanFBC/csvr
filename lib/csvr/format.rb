
module Format

	module_function

	#TODO: Interpret data types from the second line of a csv file
	#TODO: Headers should reflect the data types of their rows

	def headers(headers)

		headers = headers.map { |h| "#{h} TEXT" }.join(",")
		return headers
	end

	def type(types)

		#Convert Fixnum to Int, etc
		

	end

	def row(row)

		if row.is_a? Hash
			values = row.values.map { |r| "'#{r}'"}.join(",")
			keys = row.keys.join(",")
		end
		return "(#{keys}) VALUES(#{values})"
	end
end
