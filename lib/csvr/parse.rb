require 'csv'

module CSVR

	module Parse

		module_function

		def headers(file)

			File.open(file) do |fi|
				1.times do
					return CSV.parse_line(fi.readline)
				end
			end
		end

		def index(file, columns)

			array = headers(file)
			hash = {}
			array.each{|value| hash[array.index(value)] = value if columns.include?(value) }

			return hash
		end

		def rows(file, headers, filters = nil)

			index = index(file, headers)

			File.open(file) do |fi|

				#Skip the first line
				lines = fi.each_line
				lines.next

				values = []
				counter = 0

				lines.each do |line|

					counter += 1
					puts "Parsing #{counter}"

					row = CSV.parse_line(line, :converters => :all)

					hash = {}

					#Remove ' punctation - this causes problems with the "INSERT INTO lines"
					index.each do |k, v|
						row[k].gsub!(/[']/, '') if row[k].respond_to? :gsub
						hash[v] = row[k]
					end

					filters ? values << filter(hash, filters) : values << hash

				end

				return values.compact
			end
		end

		def filter(hash, filters)

			hash.each do |key, value|
				filters.each do |filter|
					match = value.match(filter) if value.respond_to? :match
					return hash if match
				end
			end

			return nil
		end

		def type(headers, row)

			types = []
			headers.each do |header|
				hash = {}
				row.each do |k, v|
					hash[k] = v.class if header.include?(k)
					types << hash
				end
			end
			#Remove duplicates and merge array of hashes into single hash
			return types.uniq.inject(:merge)
		end
	end
end
