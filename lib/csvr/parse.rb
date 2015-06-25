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

				#TODO: Skip the first line. The code below creates an EOF Error

				# lines = fi.each_line
				# lines.next

				values = []
				counter = 0

				maximum(file).times do 

					counter += 1
					puts "Parsing #{counter}"

					row = CSV.parse_line(fi.readline)

					hash = {}

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

		def maximum(file)
			return %x{wc -l < "#{file}"}.to_i
		end
	end
end
