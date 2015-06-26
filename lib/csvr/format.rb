
module Format

	module_function

	#TODO: Interpret data types from the second line of a csv file
	#TODO: Headers should reflect the data types of their rows

	def headers(headers, types)

		headers = headers.map { |h| "#{h} #{type(h, types)}" }.join(",")
		return headers
	end

	def type(header, types)
		return "TEXT" unless types[header] == Fixnum || Float
		return "INTEGER" unless types[header] == Float
		return "REAL"
	end

	def row(row)

		if row.is_a? Hash
			values = row.values.map { |r| "'#{r}'"}.join(",")
			keys = row.keys.join(",")
		end
		return "(#{keys}) VALUES(#{values})"
	end
end
