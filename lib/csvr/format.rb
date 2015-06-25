
module Format

	module_function

	def headers(headers)
		headers = headers.map { |h| "#{h} TEXT"}
		return headers.join(",")
	end

	def row(row)

		if row.is_a? Hash
			values = row.values.map { |r| "'#{r}'"}.join(",")
			keys = row.keys.join(",")
		end
		return "(#{keys}) VALUES(#{values})"
	end
end