
module Format

	module_function

	def headers(headers, types)
		headers = headers.map { |h| "#{h} #{type(h, types)}" }.join(",")
		return headers
	end

	def type(header, types)
		#This can be done better I am sure
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
